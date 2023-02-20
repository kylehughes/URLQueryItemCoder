//
//  EncodingPrimitiveValue.swift
//  Common
//
//  Created by Kyle Hughes on 1/15/23.
//

public enum EncodingPrimitiveValue {
    case bool(Bool)
    case double(Double)
    case float(Float)
    case int(Int)
    case int8(Int8)
    case int16(Int16)
    case int32(Int32)
    case int64(Int64)
    case string(String)
    case uint(UInt)
    case uint8(UInt8)
    case uint16(UInt16)
    case uint32(UInt32)
    case uint64(UInt64)
}

// MARK: - CustomStringConvertible Extension

extension EncodingPrimitiveValue: CustomStringConvertible {
    // MARK: Public Instance Interface
    
    public var description: String {
        switch self {
        case let .bool(value):
            return String(value)
        case let .double(value):
            return String(value)
        case let .float(value):
            return String(value)
        case let .int(value):
            return String(value)
        case let .int8(value):
            return String(value)
        case let .int16(value):
            return String(value)
        case let .int32(value):
            return String(value)
        case let .int64(value):
            return String(value)
        case let .string(value):
            return String(value)
        case let .uint(value):
            return String(value)
        case let .uint8(value):
            return String(value)
        case let .uint16(value):
            return String(value)
        case let .uint32(value):
            return String(value)
        case let .uint64(value):
            return String(value)
        }
    }
}
