import Ccapstone

// Instruction details
extension Instruction {
    // detail accessor
    var detail: cs_detail? {
        /// NOTE: detail pointer is only valid when both requirements below are met:
        /// (1) CS_OP_DETAIL = CS_OPT_ON
        /// (2) Engine is not in Skipdata mode (CS_OP_SKIPDATA option set to CS_OPT_ON)
        guard hasDetail else {
            return nil
        }
        return insn.detail?.pointee
    }

    /// True if details are available for this instruction.
    ///
    /// Details are available on instructions (not on skipped data) when disassembling in detail mode,
    /// by setting the appropriate option:
    /// ~~~
    /// capstone.set(option: .detail(value: true))
    /// ~~~
    public var hasDetail: Bool { mgr.cs.detail && insn.id != 0 }

    /// List of architecture-agnostic groups this instruction belongs to.
    ///
    /// The list will be empty in any of these cases:
    /// * detail mode is off
    /// * capstone is built in diet mode
    /// * instruction groups are not implemented for this architecture
    /// See `groups` for architecture-specific groups.
    public var baseGroups: [InstructionGroup] {
        return getInstructionGroups().compactMap({ InstructionGroup(rawValue: $0) })
    }

    /// Check if an instruction belong to a particular group.
    ///
    /// This API is only valid when detail mode is on (it's off by default).
    /// When in 'diet' mode, this API is irrelevant because engine does not store groups.
    /// - parameter group: group to check.
    /// - returns: `true` if the instruction belongs to this group, `false` otherwise.
    public func isIn(group: InstructionGroup) -> Bool {
        return withUnsafePointer(to: insn, { cs_insn_group(mgr.cs.handle, $0, UInt32(group.rawValue)) })
    }

    /// List of group names this instruction belongs to.
    ///
    /// This API is only valid when detail mode is on (it's off by default).
    /// When in 'diet' mode, this API is irrelevant because engine does not store groups.
    public var groupNames: [String] {
        getInstructionGroups().compactMap { group in
            guard let groupName = cs_group_name(mgr.cs.handle, UInt32(group)) else {
                return nil
            }
            return String(cString: groupName)
        }
    }

    internal func getInstructionGroups() -> [UInt8] {
        readDetailsArray(array: detail?.groups, size: detail?.groups_count)
    }

    /// Register names implicitly and explicitly accessed by this instruction.
    ///
    /// This API is only valid when detail mode is on (it's off by default).
    /// When in 'diet' mode, this API is irrelevant because engine does not store registers.
    public var registerNamesAccessed: (read: [String], written: [String]) {
        getRegsAccessed(implicitly: false)
    }

    /// Register names implicitly accessed by this instruction.
    ///
    /// This API is only valid when detail mode is on (it's off by default).
    /// When in 'diet' mode, this API is irrelevant because engine does not store registers.
    public var registerNamesAccessedImplicitly: (read: [String], written: [String]) {
        getRegsAccessed(implicitly: true)
    }

    internal func readDetailsArray<E, A, C>(array: A?, size: C?) -> [E] where C: FixedWidthInteger {
        guard let array = array, let size = size else {
            // skipped data or no details
            return []
        }
        let maxSize = Mirror(reflecting: array).children.count
        let count = min(maxSize, Int(size))
        return withUnsafePointer(to: array, { $0.withMemoryRebound(to: E.self, capacity: count, { regs in
            (0..<count).map({ regs[$0] })
        })})
    }

    func getRegIdsAccessed(implicitly: Bool) throws -> (read: [UInt16], written: [UInt16]) {
        guard let detail = insn.detail?.pointee else {
            throw CapstoneError.detailNotAvailable
        }
        if !implicitly {
            do {
                let maxRegs = MemoryLayout<cs_regs>.size / MemoryLayout<UInt16>.size
                var regsRead = Array(repeating: UInt16(0), count: maxRegs)
                var regsWritten = Array(repeating: UInt16(0), count: maxRegs)
                var regsReadCount = UInt8(0)
                var regsWrittenCount = UInt8(0)
                let err = withUnsafePointer(to: insn, { cs_regs_access(mgr.cs.handle, $0, &regsRead, &regsReadCount, &regsWritten, &regsWrittenCount) })
                guard err == CS_ERR_OK else {
                    throw CapstoneError(err)
                }
                // remove unused values
                regsRead.removeLast(64 - numericCast(regsReadCount))
                regsWritten.removeLast(64 - numericCast(regsWrittenCount))
                return (read: regsRead, written: regsWritten)
            } catch CapstoneError.unsupportedArchitecture {
                // fallthrough to implicit regs
            }
        }
        // implicit regs from detail
        let regsRead: [UInt16] = readDetailsArray(array: detail.regs_read, size: detail.regs_read_count)
        let regsWritten: [UInt16] = readDetailsArray(array: detail.regs_write, size: detail.regs_write_count)
        return (read: regsRead, written: regsWritten)
    }

    func getRegsAccessed(implicitly: Bool) -> (read: [String], written: [String]) {
        guard hasDetail, let registers = try? getRegIdsAccessed(implicitly: implicitly) else {
            return (read: [], written: [])
        }
        return (read: registers.read.compactMap({ mgr.cs.name(ofRegister: numericCast($0)) }),
                written: registers.written.compactMap({ mgr.cs.name(ofRegister: numericCast($0)) }))
    }
}

/// Common instruction operand access types - to be consistent across all architectures.
public struct Access: OptionSet, CustomStringConvertible {
    // must match cs_ac_type
    public var rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// Operand reads from memory or register.
    public static let read = Access(rawValue: 1)
    /// Operand writes to memory or register.
    public static let write = Access(rawValue: 2)

    public var description: String {
        var description = ""
        if self.contains(Access.read) {
            description += "r"
        }
        if self.contains(Access.write) {
            description += "w"
        }
        return description
    }
}

/// Common instruction groups - to be consistent across all architectures.
public enum InstructionGroup: UInt8 {
    // must match cs_group_type
    /// uninitialized/invalid group.
    case invalid
    /// all jump instructions (conditional+direct+indirect jumps)
    case jump
    /// all call instructions
    case call
    /// all return instructions
    case ret
    /// all interrupt instructions (int+syscall)
    case int
    /// all interrupt return instructions
    case iret
    /// all privileged instructions
    case privilege
    /// all relative branching instructions
    case branchRelative
}

/// Protocol for instructions that contain operands.
public protocol OperandContainer {
    /// Type of operands for this instruction.
    associatedtype OperandType where OperandType: InstructionOperand

    /// Instruction operands.
    ///
    /// Empty when detail mode is off.
    var operands: [OperandType] { get }
}

/// Protocol for instruction operands.
public protocol InstructionOperand {
    associatedtype OperandTypeType
    associatedtype OperandValueType

    /// Operand type
    var type: OperandTypeType { get }
    /// Operand value
    var value: OperandValueType { get }
}

extension PlatformInstructionBase {
    /// List of architecture-specific groups the instruction belongs to.
    ///
    /// The list will be empty in any of these cases:
    /// * detail mode is off
    /// * capstone is built in diet mode
    /// * instruction groups are not implemented for this architecture
    /// See `baseGroups` for architecture-agnostic groups.
    public var groups: [GroupType] {
        getInstructionGroups().compactMap({ GroupType(rawValue: $0) })
    }

    /// Check if an instruction belong to a particular group.
    ///
    /// This API is only valid when detail mode is on (it's off by default).
    /// When in 'diet' mode, this API is irrelevant because engine does not store groups.
    /// - parameter group: group to check.
    /// - returns: `true` if the instruction belongs to this group, `false` otherwise.
    public func isIn(group: GroupType) -> Bool {
        return withUnsafePointer(to: insn, { cs_insn_group(mgr.cs.handle, $0, UInt32(group.rawValue)) })
    }
}

extension PlatformInstruction {
    /// Registers implicitly and explicitly accessed by this instruction.
    ///
    /// This API is only valid when detail mode is on (it's off by default).
    /// When in 'diet' mode, this API is irrelevant because engine does not store registers.
    public var registersAccessed: (read: [RegType], written: [RegType]) {
        getRegsAccessed(implicitly: false)
    }

    /// Registers implicitly accessed by this instruction.
    /// 
    /// This API is only valid when detail mode is on (it's off by default).
    /// When in 'diet' mode, this API is irrelevant because engine does not store registers.
    public var registersAccessedImplicitly: (read: [RegType], written: [RegType]) {
        getRegsAccessed(implicitly: true)
    }

    func getRegsAccessed(implicitly: Bool) -> (read: [RegType], written: [RegType]) {
        guard hasDetail, let registers = try? getRegIdsAccessed(implicitly: implicitly) else {
            return (read: [], written: [])
        }
        return (read: registers.read.compactMap({ RegType(rawValue: $0) }),
                written: registers.written.compactMap({ RegType(rawValue: $0) }))
    }
}
