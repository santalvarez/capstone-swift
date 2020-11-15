import Foundation
import Capstone

struct Code {
    static let armCode1 = Data([0x86, 0x48, 0x60, 0xf4, 0x4d, 0x0f, 0xe2, 0xf4, 0xED, 0xFF, 0xFF, 0xEB, 0x04, 0xe0, 0x2d, 0xe5, 0x00, 0x00, 0x00, 0x00, 0xe0, 0x83, 0x22, 0xe5, 0xf1, 0x02, 0x03, 0x0e, 0x00, 0x00, 0xa0, 0xe3, 0x02, 0x30, 0xc1, 0xe7, 0x00, 0x00, 0x53, 0xe3, 0x00, 0x02, 0x01, 0xf1, 0x05, 0x40, 0xd0, 0xe8, 0xf4, 0x80, 0x00, 0x00])
    static let armCode2 = Data([0xd1, 0xe8, 0x00, 0xf0, 0xf0, 0x24, 0x04, 0x07, 0x1f, 0x3c, 0xf2, 0xc0, 0x00, 0x00, 0x4f, 0xf0, 0x00, 0x01, 0x46, 0x6c])
    static let thumbCode1 = Data([0x60, 0xf9, 0x1f, 0x04, 0xe0, 0xf9, 0x4f, 0x07, 0x70, 0x47, 0x00, 0xf0, 0x10, 0xe8, 0xeb, 0x46, 0x83, 0xb0, 0xc9, 0x68, 0x1f, 0xb1, 0x30, 0xbf, 0xaf, 0xf3, 0x20, 0x84, 0x52, 0xf8, 0x23, 0xf0])
    static let thumbCode2 = Data([0x4f, 0xf0, 0x00, 0x01, 0xbd, 0xe8, 0x00, 0x88, 0xd1, 0xe8, 0x00, 0xf0, 0x18, 0xbf, 0xad, 0xbf, 0xf3, 0xff, 0x0b, 0x0c, 0x86, 0xf3, 0x00, 0x89, 0x80, 0xf3, 0x00, 0x8c, 0x4f, 0xfa, 0x99, 0xf6, 0xd0, 0xff, 0xa2, 0x01])
    static let thumbMClass = Data([0xef, 0xf3, 0x02, 0x80])
    static let armV8 = Data([0xe0, 0x3b, 0xb2, 0xee, 0x42, 0x00, 0x01, 0xe1, 0x51, 0xf0, 0x7f, 0xf5])
    
    static let arm64Code1 = Data([0x09, 0x00, 0x38, 0xd5, 0xbf, 0x40, 0x00, 0xd5, 0x0c, 0x05, 0x13, 0xd5, 0x20, 0x50, 0x02, 0x0e, 0x20, 0xe4, 0x3d, 0x0f, 0x00, 0x18, 0xa0, 0x5f, 0xa2, 0x00, 0xae, 0x9e, 0x9f, 0x37, 0x03, 0xd5, 0xbf, 0x33, 0x03, 0xd5, 0xdf, 0x3f, 0x03, 0xd5, 0x21, 0x7c, 0x02, 0x9b, 0x21, 0x7c, 0x00, 0x53, 0x00, 0x40, 0x21, 0x4b, 0xe1, 0x0b, 0x40, 0xb9, 0x20, 0x04, 0x81, 0xda, 0x20, 0x08, 0x02, 0x8b, 0x10, 0x5b, 0xe8, 0x3c])
    
    static let ppcCode1 = Data([0x43, 0x20, 0x0c, 0x07, 0x41, 0x56, 0xff, 0x17, 0x80, 0x20, 0x00, 0x00, 0x80, 0x3f, 0x00, 0x00, 0x10, 0x43, 0x23, 0x0e, 0xd0, 0x44, 0x00, 0x80, 0x4c, 0x43, 0x22, 0x02, 0x2d, 0x03, 0x00, 0x80, 0x7c, 0x43, 0x20, 0x14, 0x7c, 0x43, 0x20, 0x93, 0x4f, 0x20, 0x00, 0x21, 0x4c, 0xc8, 0x00, 0x21, 0x40, 0x82, 0x00, 0x14])
    static let ppcCode2 = Data([0x10, 0x60, 0x2a, 0x10, 0x10, 0x64, 0x28, 0x88, 0x7c, 0x4a, 0x5d, 0x0f])
    
    static let x86Code64 = Data([0x55, 0x48, 0x8b, 0x05, 0xb8, 0x13, 0x00, 0x00, 0xe9, 0xea, 0xbe, 0xad, 0xde, 0xff, 0x25, 0x23, 0x01, 0x00, 0x00, 0xe8, 0xdf, 0xbe, 0xad, 0xde, 0x74, 0xff])
    static let x86Code16 = Data([0x8d, 0x4c, 0x32, 0x08, 0x01, 0xd8, 0x81, 0xc6, 0x34, 0x12, 0x00, 0x00, 0x05, 0x23, 0x01, 0x00, 0x00, 0x36, 0x8b, 0x84, 0x91, 0x23, 0x01, 0x00, 0x00, 0x41, 0x8d, 0x84, 0x39, 0x89, 0x67, 0x00, 0x00, 0x8d, 0x87, 0x89, 0x67, 0x00, 0x00, 0xb4, 0xc6, 0x66, 0xe9, 0xb8, 0x00, 0x00, 0x00, 0x67, 0xff, 0xa0, 0x23, 0x01, 0x00, 0x00, 0x66, 0xe8, 0xcb, 0x00, 0x00, 0x00, 0x74, 0xfc])
    static let x86Code32 = Data([0x8d, 0x4c, 0x32, 0x08, 0x01, 0xd8, 0x81, 0xc6, 0x34, 0x12, 0x00, 0x00, 0x05, 0x23, 0x01, 0x00, 0x00, 0x36, 0x8b, 0x84, 0x91, 0x23, 0x01, 0x00, 0x00, 0x41, 0x8d, 0x84, 0x39, 0x89, 0x67, 0x00, 0x00, 0x8d, 0x87, 0x89, 0x67, 0x00, 0x00, 0xb4, 0xc6, 0xe9, 0xea, 0xbe, 0xad, 0xde, 0xff, 0xa0, 0x23, 0x01, 0x00, 0x00, 0xe8, 0xdf, 0xbe, 0xad, 0xde, 0x74, 0xff])
    
    static let m68kCode = Data([0xf0, 0x10, 0xf0, 0x00, 0x48, 0xaf, 0xff, 0xff, 0x7f, 0xff, 0x11, 0xb0, 0x01, 0x37, 0x7f, 0xff, 0xff, 0xff, 0x12, 0x34, 0x56, 0x78, 0x01, 0x33, 0x10, 0x10, 0x10, 0x10, 0x32, 0x32, 0x32, 0x32, 0x4C, 0x00, 0x54, 0x04, 0x48, 0xe7, 0xe0, 0x30, 0x4C, 0xDF, 0x0C, 0x07, 0xd4, 0x40, 0x87, 0x5a, 0x4e, 0x71, 0x02, 0xb4, 0xc0, 0xde, 0xc0, 0xde, 0x5c, 0x00, 0x1d, 0x80, 0x71, 0x12, 0x01, 0x23, 0xf2, 0x3c, 0x44, 0x22, 0x40, 0x49, 0x0e, 0x56, 0x54, 0xc5, 0xf2, 0x3c, 0x44, 0x00, 0x44, 0x7a, 0x00, 0x00, 0xf2, 0x00, 0x0a, 0x28, 0x4E, 0xB9, 0x00, 0x00, 0x00, 0x12, 0x4E, 0x75])
    
    static let sparcCode = Data([0x80, 0xa0, 0x40, 0x02, 0x85, 0xc2, 0x60, 0x08, 0x85, 0xe8, 0x20, 0x01, 0x81, 0xe8, 0x00, 0x00, 0x90, 0x10, 0x20, 0x01, 0xd5, 0xf6, 0x10, 0x16, 0x21, 0x00, 0x00, 0x0a, 0x86, 0x00, 0x40, 0x02, 0x01, 0x00, 0x00, 0x00, 0x12, 0xbf, 0xff, 0xff, 0x10, 0xbf, 0xff, 0xff, 0xa0, 0x02, 0x00, 0x09, 0x0d, 0xbf, 0xff, 0xff, 0xd4, 0x20, 0x60, 0x00, 0xd4, 0x4e, 0x00, 0x16, 0x2a, 0xc2, 0x80, 0x03])
    static let sparcCodeV9 = Data([0x81, 0xa8, 0x0a, 0x24, 0x89, 0xa0, 0x10, 0x20, 0x89, 0xa0, 0x1a, 0x60, 0x89, 0xa0, 0x00, 0xe0])

    static let evmCode = Data([0x60,0x61,0x50])
    
    static let mipsCode = Data([0x0C, 0x10, 0x00, 0x97, 0x00, 0x00, 0x00, 0x00, 0x24, 0x02, 0x00, 0x0c, 0x8f, 0xa2, 0x00, 0x00, 0x34, 0x21, 0x34, 0x56])
    static let mipsCode2 = Data([0x56, 0x34, 0x21, 0x34, 0xc2, 0x17, 0x01, 0x00])
    static let mipsCode32R6M = Data([0x00, 0x07, 0x00, 0x07, 0x00, 0x11, 0x93, 0x7c, 0x01, 0x8c, 0x8b, 0x7c, 0x00, 0xc7, 0x48, 0xd0])
    static let mipsCode32R6 = Data([0xec, 0x80, 0x00, 0x19, 0x7c, 0x43, 0x22, 0xa0])
    static let mipsCode64SD = Data([0x70, 0x00, 0xb2, 0xff])
    
    static let m6800Code = Data([0x01, 0x09, 0x36, 0x64, 0x7f, 0x74, 0x10, 0x00, 0x90, 0x10, 0xA4, 0x10, 0xb6, 0x10, 0x00, 0x39])
    static let m6801Code = Data([0x04, 0x05, 0x3c, 0x3d, 0x38, 0x93, 0x10, 0xec, 0x10, 0xed, 0x10, 0x39])
    static let m6805Code = Data([0x04, 0x7f, 0x00, 0x17, 0x22, 0x28, 0x00, 0x2e, 0x00, 0x40, 0x42, 0x5a, 0x70, 0x8e, 0x97, 0x9c, 0xa0, 0x15, 0xad, 0x00, 0xc3, 0x10, 0x00, 0xda, 0x12, 0x34, 0xe5, 0x7f, 0xfe])
    static let m6808Code = Data([0x31, 0x22, 0x00, 0x35, 0x22, 0x45, 0x10, 0x00, 0x4b, 0x00, 0x51, 0x10, 0x52, 0x5e, 0x22, 0x62, 0x65, 0x12, 0x34, 0x72, 0x84, 0x85, 0x86, 0x87, 0x8a, 0x8b, 0x8c, 0x94, 0x95, 0xa7, 0x10, 0xaf, 0x10, 0x9e, 0x60, 0x7f, 0x9e, 0x6b, 0x7f, 0x00, 0x9e, 0xd6, 0x10, 0x00, 0x9e, 0xe6, 0x7f])
    static let hcs08Code = Data([0x32, 0x10, 0x00, 0x9e, 0xae, 0x9e, 0xce, 0x7f, 0x9e, 0xbe, 0x10, 0x00, 0x9e, 0xfe, 0x7f, 0x3e, 0x10, 0x00, 0x9e, 0xf3, 0x7f, 0x96, 0x10, 0x00, 0x9e, 0xff, 0x7f, 0x82])
    static let m6811Code = Data([0x02, 0x03, 0x12, 0x7f, 0x10, 0x00, 0x13, 0x99, 0x08, 0x00, 0x14, 0x7f, 0x02, 0x15, 0x7f, 0x01, 0x1e, 0x7f, 0x20, 0x00, 0x8f, 0xcf, 0x18, 0x08, 0x18, 0x30, 0x18, 0x3c, 0x18, 0x67, 0x18, 0x8c, 0x10, 0x00, 0x18, 0x8f, 0x18, 0xce, 0x10, 0x00, 0x18, 0xff, 0x10, 0x00, 0x1a, 0xa3, 0x7f, 0x1a, 0xac, 0x1a, 0xee, 0x7f, 0x1a, 0xef, 0x7f, 0xcd, 0xac, 0x7f])
    static let cpu12Code = Data([0x00, 0x04, 0x01, 0x00, 0x0c, 0x00, 0x80, 0x0e, 0x00, 0x80, 0x00, 0x11, 0x1e, 0x10, 0x00, 0x80, 0x00, 0x3b, 0x4a, 0x10, 0x00, 0x04, 0x4b, 0x01, 0x04, 0x4f, 0x7f, 0x80, 0x00, 0x8f, 0x10, 0x00, 0xb7, 0x52, 0xb7, 0xb1, 0xa6, 0x67, 0xa6, 0xfe, 0xa6, 0xf7, 0x18, 0x02, 0xe2, 0x30, 0x39, 0xe2, 0x10, 0x00, 0x18, 0x0c, 0x30, 0x39, 0x10, 0x00, 0x18, 0x11, 0x18, 0x12, 0x10, 0x00, 0x18, 0x19, 0x00, 0x18, 0x1e, 0x00, 0x18, 0x3e, 0x18, 0x3f, 0x00])
    static let hd6301Code = Data([0x6b, 0x10, 0x00, 0x71, 0x10, 0x00, 0x72, 0x10, 0x10, 0x39])
    static let m6809Code = Data([0x06, 0x10, 0x19, 0x1a, 0x55, 0x1e, 0x01, 0x23, 0xe9, 0x31, 0x06, 0x34, 0x55, 0xa6, 0x81, 0xa7, 0x89, 0x7f, 0xff, 0xa6, 0x9d, 0x10, 0x00, 0xa7, 0x91, 0xa6, 0x9f, 0x10, 0x00, 0x11, 0xac, 0x99, 0x10, 0x00, 0x39, 0xA6, 0x07, 0xA6, 0x27, 0xA6, 0x47, 0xA6, 0x67, 0xA6, 0x0F, 0xA6, 0x10, 0xA6, 0x80, 0xA6, 0x81, 0xA6, 0x82, 0xA6, 0x83, 0xA6, 0x84, 0xA6, 0x85, 0xA6, 0x86, 0xA6, 0x88, 0x7F, 0xA6, 0x88, 0x80, 0xA6, 0x89, 0x7F, 0xFF, 0xA6, 0x89, 0x80, 0x00, 0xA6, 0x8B, 0xA6, 0x8C, 0x10, 0xA6, 0x8D, 0x10, 0x00, 0xA6, 0x91, 0xA6, 0x93, 0xA6, 0x94, 0xA6, 0x95, 0xA6, 0x96, 0xA6, 0x98, 0x7F, 0xA6, 0x98, 0x80, 0xA6, 0x99, 0x7F, 0xFF, 0xA6, 0x99, 0x80, 0x00, 0xA6, 0x9B, 0xA6, 0x9C, 0x10, 0xA6, 0x9D, 0x10, 0x00, 0xA6, 0x9F, 0x10, 0x00])
    static let hd6309Code = Data([0x01, 0x10, 0x10, 0x62, 0x10, 0x10, 0x7b, 0x10, 0x10, 0x00, 0xcd, 0x49, 0x96, 0x02, 0xd2, 0x10, 0x30, 0x23, 0x10, 0x38, 0x10, 0x3b, 0x10, 0x53, 0x10, 0x5d, 0x11, 0x30, 0x43, 0x10, 0x11, 0x37, 0x25, 0x10, 0x11, 0x38, 0x12, 0x11, 0x39, 0x23, 0x11, 0x3b, 0x34, 0x11, 0x8e, 0x10, 0x00, 0x11, 0xaf, 0x10, 0x11, 0xab, 0x10, 0x11, 0xf6, 0x80, 0x00])

    static let syszCode = Data([0xed, 0x00, 0x00, 0x00, 0x00, 0x1a, 0x5a, 0x0f, 0x1f, 0xff, 0xc2, 0x09, 0x80, 0x00, 0x00, 0x00, 0x07, 0xf7, 0xeb, 0x2a, 0xff, 0xff, 0x7f, 0x57, 0xe3, 0x01, 0xff, 0xff, 0x7f, 0x57, 0xeb, 0x00, 0xf0, 0x00, 0x00, 0x24, 0xb2, 0x4f, 0x00, 0x78, 0xec, 0x18, 0x00, 0x00, 0xc1, 0x7f])
    
    static let xcoreCode = Data([0xfe, 0x0f, 0xfe, 0x17, 0x13, 0x17, 0xc6, 0xfe, 0xec, 0x17, 0x97, 0xf8, 0xec, 0x4f, 0x1f, 0xfd, 0xec, 0x37, 0x07, 0xf2, 0x45, 0x5b, 0xf9, 0xfa, 0x02, 0x06, 0x1b, 0x10, 0x09, 0xfd, 0xec, 0xa7])
    
    static let tms320c64xCode = Data([0x01, 0xac, 0x88, 0x40, 0x81, 0xac, 0x88, 0x43, 0x00, 0x00, 0x00, 0x00, 0x02, 0x90, 0x32, 0x96, 0x02, 0x80, 0x46, 0x9e, 0x05, 0x3c, 0x83, 0xe6, 0x0b, 0x0c, 0x8b, 0x24])

    static let skipDataX86Code32 = Data([0x8d, 0x4c, 0x32, 0x08, 0x01, 0xd8, 0x81, 0xc6, 0x34, 0x12, 0x00, 0x00, 0x00, 0x91, 0x92])
    static let randomCode = Data([0xed, 0x00, 0x00, 0x00, 0x00, 0x1a, 0x5a, 0x0f, 0x1f, 0xff, 0xc2, 0x09, 0x80, 0x00, 0x00, 0x00, 0x07, 0xf7, 0xeb, 0x2a, 0xff, 0xff, 0x7f, 0x57, 0xe3, 0x01, 0xff, 0xff, 0x7f, 0x57, 0xeb, 0x00, 0xf0, 0x00, 0x00, 0x24, 0xb2, 0x4f, 0x00, 0x78])
}

struct Tests {
    // all tests in the same order as test_basic.c
    static var allTests: [PlatformTest] {
        x86Tests + armTests + mipsTests + arm64Tests + ppcTests + sparcTests + syszTests + xcoreTests + tms320c64xTests +
        m68kTests + evmTests
    }
    
    static let skipDataTests = [
        PlatformTest(name: "X86 32 (Intel syntax) - Skip data",
                     arch: .x86,
                     mode: [Mode.bits.b32],
                     code: Code.skipDataX86Code32,
                     options: [.skipDataEnabled(true)]),
        PlatformTest(name: "X86 32 (Intel syntax) - Skip data with custom mnemonic",
                     arch: .x86,
                     mode: [Mode.bits.b32],
                     code: Code.skipDataX86Code32,
                     options: [.skipData(mnemonic: "db")]),
        PlatformTest(name: "Arm - Skip data",
                     arch: .arm,
                     mode: [Mode.arm.arm],
                     code: Code.randomCode,
                     options: [.skipDataEnabled(true)]),
        PlatformTest(name: "Arm - Skip data with callback",
                     arch: .arm,
                     mode: [Mode.arm.arm],
                     code: Code.randomCode,
                     options: [.skipData(mnemonic: "db", callback: { (_, _, _) -> SkipDataResult in
                        // always skip 2 bytes
                        .skip(bytes: 2)
                     })])
    ]
    
    static let armTests = [
        PlatformTest(name: "ARM",
                     arch: .arm,
                     mode: [Mode.arm.arm],
                     code: Code.armCode1),
        PlatformTest(name: "Thumb",
                     arch: .arm,
                     mode: [Mode.arm.thumb],
                     code: Code.thumbCode1),
        PlatformTest(name: "Thumb-mixed",
                     arch: .arm,
                     mode: [Mode.arm.thumb],
                     code: Code.armCode2),
        PlatformTest(name: "Thumb-2 & register named with numbers",
                     arch: .arm,
                     mode: [Mode.arm.thumb],
                     code: Code.thumbCode2,
                     options: [.syntax(syntax: .noRegName)]),
        PlatformTest(name: "Thumb-MClass",
                     arch: .arm,
                     mode: [Mode.arm.thumb, Mode.arm.mClass],
                     code: Code.thumbMClass),
        PlatformTest(name: "Arm-V8",
                     arch: .arm,
                     mode: [Mode.arm.arm, Mode.arm.v8],
                     code: Code.armV8)
    ]
    
    static let arm64Tests = [
        PlatformTest(name: "ARM-64",
                     arch: .arm64,
                     mode: [Mode.arm.arm],
                     code: Code.arm64Code1)
    ]
    
    static let ppcTests = [
        PlatformTest(name: "PPC-64",
                     arch: .ppc,
                     mode: [Mode.endian.big],
                     code: Code.ppcCode1),
        PlatformTest(name: "PPC-64 + QPX",
                     arch: .ppc,
                     mode: [Mode.endian.big, Mode.ppc.qpx],
                     code: Code.ppcCode2),
    ]
    
    static let x86Tests = [
        PlatformTest(
            name: "X86 16bit (Intel syntax)",
            arch: .x86,
            mode: [Mode.bits.b16],
            code: Code.x86Code16),
        PlatformTest(
            name: "X86 32 (AT&T syntax)",
            arch: .x86,
            mode: [Mode.bits.b32],
            code: Code.x86Code32,
            options: [.syntax(syntax: .att)]),
        PlatformTest(
            name: "X86 32 (Intel syntax)",
            arch: .x86,
            mode: [Mode.bits.b32],
            code: Code.x86Code32),
        PlatformTest(
            name: "X86 64 (Intel syntax)",
            arch: .x86,
            mode: [Mode.bits.b64],
            code: Code.x86Code64)
    ]
    
    static let m68kTests = [
        PlatformTest(
            name: "M68K",
            arch: .m68k,
            mode: [Mode.m68k.mc68040, Mode.endian.big],
            code: Code.m68kCode)
    ]
    
    static let sparcTests = [
        PlatformTest(
            name: "Sparc",
            arch: .sparc,
            mode: [Mode.endian.big],
            code: Code.sparcCode),
        PlatformTest(
            name: "SparcV9",
            arch: .sparc,
            mode: [Mode.endian.big, Mode.sparc.v9],
            code: Code.sparcCodeV9)
    ]
    
    static let evmTests = [
        PlatformTest(
            name: "EVM",
            arch: .evm,
            mode: [],
            code: Code.evmCode)
    ]
    
    static let mipsTests = [
        PlatformTest(
            name: "MIPS-32 (Big-endian)",
            arch: .mips,
            mode: [Mode.bits.b32, Mode.endian.big],
            code: Code.mipsCode),
        PlatformTest(
            name: "MIPS-64-EL (Little-endian)",
            arch: .mips,
            mode: [Mode.bits.b64, Mode.endian.little],
            code: Code.mipsCode2),
        PlatformTest(
            name: "MIPS-32R6 | Micro (Big-endian)",
            arch: .mips,
            mode: [Mode.mips.mips32r6, Mode.mips.micro, Mode.endian.big],
            code: Code.mipsCode32R6M),
        PlatformTest(
            name: "MIPS-32R6 (Big-endian)",
            arch: .mips,
            mode: [Mode.mips.mips32r6, Mode.endian.big],
            code: Code.mipsCode32R6),
        PlatformTest(
            name: "MIPS-64-EL + Mips II (Little-endian)",
            arch: .mips,
            mode: [Mode.bits.b64, Mode.mips.mips2, Mode.endian.little],
            code: Code.mipsCode64SD),
        PlatformTest(
            name: "MIPS-64-EL (Little-endian)",
            arch: .mips,
            mode: [Mode.bits.b64, Mode.endian.little],
            code: Code.mipsCode64SD),
    ]
    
    static let m680xTests = [
        PlatformTest(
            name: "M680X_HD6301",
            arch: .m680x,
            mode: [Mode.m680x.m6301],
            code: Code.hd6301Code),
        PlatformTest(
            name: "M680X_HD6309",
            arch: .m680x,
            mode: [Mode.m680x.m6309],
            code: Code.hd6309Code),
        PlatformTest(
            name: "M680X_M6800",
            arch: .m680x,
            mode: [Mode.m680x.m6800],
            code: Code.m6800Code),
        PlatformTest(
            name: "M680X_M6801",
            arch: .m680x,
            mode: [Mode.m680x.m6801],
            code: Code.m6801Code),
        PlatformTest(
            name: "M680X_M68HC05",
            arch: .m680x,
            mode: [Mode.m680x.m6805],
            code: Code.m6805Code),
        PlatformTest(
            name: "M680X_M68HC08",
            arch: .m680x,
            mode: [Mode.m680x.m6808],
            code: Code.m6808Code),
        PlatformTest(
            name: "M680X_M6809",
            arch: .m680x,
            mode: [Mode.m680x.m6809],
            code: Code.m6809Code),
        PlatformTest(
            name: "M680X_M68HC11",
            arch: .m680x,
            mode: [Mode.m680x.m6811],
            code: Code.m6811Code),
        PlatformTest(
            name: "M680X_CPU12",
            arch: .m680x,
            mode: [Mode.m680x.cpu12],
            code: Code.cpu12Code),
        PlatformTest(
            name: "M680X_HCS08",
            arch: .m680x,
            mode: [Mode.m680x.hcs08],
            code: Code.hcs08Code)
    ]
    
    static let syszTests = [
        PlatformTest(
            name: "SystemZ",
            arch: .sysz,
            mode: [Mode.endian.big],
            code: Code.syszCode)
    ]
    
    static let xcoreTests = [
        PlatformTest(
            name: "XCore",
            arch: .xcore,
            mode: [Mode.endian.big],
            code: Code.xcoreCode)
    ]
    
    static let tms320c64xTests = [
        PlatformTest(
            name: "TMS320C64x",
            arch: .tms320c64x,
            mode: [Mode.endian.big],
            code: Code.tms320c64xCode)
    ]
}
