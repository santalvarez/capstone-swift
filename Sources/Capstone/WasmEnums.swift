// For Capstone Engine. AUTO-GENERATED FILE, DO NOT EDIT (Wasm)


public enum WasmOp: UInt32 {
    case invalid = 0
    case none = 1
    case int7 = 2
    case varuint32 = 3
    case varuint64 = 4
    case uint32 = 5
    case uint64 = 6
    case imm = 7
    case brtable = 8
}

/// WASM instruction
public enum WasmIns: UInt32 {
    case unreachable = 0
    case nop = 1
    case block = 2
    case loop = 3
    case `if` = 4
    case `else` = 5
    case end = 11
    case br = 12
    case brIf = 13
    case brTable = 14
    case `return` = 15
    case call = 16
    case callIndirect = 17
    case drop = 26
    case select = 27
    case getLocal = 32
    case setLocal = 33
    case teeLocal = 34
    case getGlobal = 35
    case setGlobal = 36
    case i32Load = 40
    case i64Load = 41
    case f32Load = 42
    case f64Load = 43
    case i32Load8S = 44
    case i32Load8U = 45
    case i32Load16S = 46
    case i32Load16U = 47
    case i64Load8S = 48
    case i64Load8U = 49
    case i64Load16S = 50
    case i64Load16U = 51
    case i64Load32S = 52
    case i64Load32U = 53
    case i32Store = 54
    case i64Store = 55
    case f32Store = 56
    case f64Store = 57
    case i32Store8 = 58
    case i32Store16 = 59
    case i64Store8 = 60
    case i64Store16 = 61
    case i64Store32 = 62
    case currentMemory = 63
    case growMemory = 64
    case i32Const = 65
    case i64Const = 66
    case f32Const = 67
    case f64Const = 68
    case i32Eqz = 69
    case i32Eq = 70
    case i32Ne = 71
    case i32LtS = 72
    case i32LtU = 73
    case i32GtS = 74
    case i32GtU = 75
    case i32LeS = 76
    case i32LeU = 77
    case i32GeS = 78
    case i32GeU = 79
    case i64Eqz = 80
    case i64Eq = 81
    case i64Ne = 82
    case i64LtS = 83
    case i64LtU = 84
    case i64GtU = 86
    case i64LeS = 87
    case i64LeU = 88
    case i64GeS = 89
    case i64GeU = 90
    case f32Eq = 91
    case f32Ne = 92
    case f32Lt = 93
    case f32Gt = 94
    case f32Le = 95
    case f32Ge = 96
    case f64Eq = 97
    case f64Ne = 98
    case f64Lt = 99
    case f64Gt = 100
    case f64Le = 101
    case f64Ge = 102
    case i32Clz = 103
    case i32Ctz = 104
    case i32Popcnt = 105
    case i32Add = 106
    case i32Sub = 107
    case i32Mul = 108
    case i32DivS = 109
    case i32DivU = 110
    case i32RemS = 111
    case i32RemU = 112
    case i32And = 113
    case i32Or = 114
    case i32Xor = 115
    case i32Shl = 116
    case i32ShrS = 117
    case i32ShrU = 118
    case i32Rotl = 119
    case i32Rotr = 120
    case i64Clz = 121
    case i64Ctz = 122
    case i64Popcnt = 123
    case i64Add = 124
    case i64Sub = 125
    case i64Mul = 126
    case i64DivS = 127
    case i64DivU = 128
    case i64RemS = 129
    case i64RemU = 130
    case i64And = 131
    case i64Or = 132
    case i64Xor = 133
    case i64Shl = 134
    case i64ShrS = 135
    case i64ShrU = 136
    case i64Rotl = 137
    case i64Rotr = 138
    case f32Abs = 139
    case f32Neg = 140
    case f32Ceil = 141
    case f32Floor = 142
    case f32Trunc = 143
    case f32Nearest = 144
    case f32Sqrt = 145
    case f32Add = 146
    case f32Sub = 147
    case f32Mul = 148
    case f32Div = 149
    case f32Min = 150
    case f32Max = 151
    case f32Copysign = 152
    case f64Abs = 153
    case f64Neg = 154
    case f64Ceil = 155
    case f64Floor = 156
    case f64Trunc = 157
    case f64Nearest = 158
    case f64Sqrt = 159
    case f64Add = 160
    case f64Sub = 161
    case f64Mul = 162
    case f64Div = 163
    case f64Min = 164
    case f64Max = 165
    case f64Copysign = 166
    case i32WarpI64 = 167
    case i32TruncUF32 = 169
    case i32TruncSF64 = 170
    case i32TruncUF64 = 171
    case i64ExtendSI32 = 172
    case i64ExtendUI32 = 173
    case i64TruncSF32 = 174
    case i64TruncUF32 = 175
    case i64TruncSF64 = 176
    case i64TruncUF64 = 177
    case f32ConvertSI32 = 178
    case f32ConvertUI32 = 179
    case f32ConvertSI64 = 180
    case f32ConvertUI64 = 181
    case f32DemoteF64 = 182
    case f64ConvertSI32 = 183
    case f64ConvertUI32 = 184
    case f64ConvertSI64 = 185
    case f64ConvertUI64 = 186
    case f64PromoteF32 = 187
    case i32ReinterpretF32 = 188
    case i64ReinterpretF64 = 189
    case f32ReinterpretI32 = 190
    case f64ReinterpretI64 = 191
    case invalid = 512
    case ending = 513

}

/// Group of WASM instructions
public enum WasmGrp: UInt8 {
    /// = CS_GRP_INVALID
    case invalid = 0
    case numberic = 8
    case parametric = 9
    case variable = 10
    case memory = 11
    case control = 12
    /// <-- mark the end of the list of groups
    case ending = 13
}

