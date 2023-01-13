//
//  CodableTestTypes.swift
//  CodableSkeleton
//
//  Created by Kyle Hughes on 12/30/22.
//

public enum CodableTestTypes {
    // NO-OP
}

// MARK: - CodableTestTypes.OmniValueProperties Definition

extension CodableTestTypes {
    public struct OmniValueProperties: Codable, Equatable {
        public let one: SingleValueProperties?
        public let two: SingleValueProperties?
        public let three: UnkeyedValueProperties?
        public let four: UnkeyedValueProperties?
        
        // MARK: Predefined Constants
        
        public static let maximumValues = OmniValueProperties(
            one: .maximumValues,
            two: .maximumValues,
            three: .nonNil,
            four: .nonNil
        )
        
        public static let minimumValues = OmniValueProperties(
            one: .minimumValues,
            two: .minimumValues,
            three: .nonNil,
            four: .nonNil
        )
        
        public static let `nil` = OmniValueProperties(
            one: .nil,
            two: .nil,
            three: .nil,
            four: .nil
        )
    }
}

// MARK: - CodableTestTypes.SingleValueProperties Definition

extension CodableTestTypes {
    public struct SingleValueProperties: Codable, Equatable {
        public let bool: Bool?
        public let double: Double?
        public let float: Float?
        public let int: Int?
        public let int8: Int8?
        public let int16: Int16?
        public let int32: Int32?
        public let int64: Int64?
        public let string: String?
        public let uint: UInt?
        public let uint8: UInt8?
        public let uint16: UInt16?
        public let uint32: UInt32?
        public let uint64: UInt64?
        
        // MARK: Predefined Constants
        
        public static let maximumValues = SingleValueProperties(
            bool: true,
            double: .greatestFiniteMagnitude,
            float: .greatestFiniteMagnitude,
            int: .max,
            int8: .max,
            int16: .max,
            int32: .max,
            int64: .max,
            string: String(repeating: "LOL", count: 100),
            uint: .max,
            uint8: .max,
            uint16: .max,
            uint32: .max,
            uint64: .max
        )
        
        public static let minimumValues = SingleValueProperties(
            bool: false,
            double: .leastNonzeroMagnitude,
            float: .leastNonzeroMagnitude,
            int: .min,
            int8: .min,
            int16: .min,
            int32: .min,
            int64: .min,
            string: String(),
            uint: .min,
            uint8: .min,
            uint16: .min,
            uint32: .min,
            uint64: .min
        )
        
        public static let `nil` = SingleValueProperties(
            bool: nil,
            double: nil,
            float: nil,
            int: nil,
            int8: nil,
            int16: nil,
            int32: nil,
            int64: nil,
            string: nil,
            uint: nil,
            uint8: nil,
            uint16: nil,
            uint32: nil,
            uint64: nil
        )
    }
}

// MARK: - CodableTestTypes.UnkeyedValueProperties Definition

extension CodableTestTypes {
    public typealias UnkeyedValueProperties = [String?]
}

extension CodableTestTypes.UnkeyedValueProperties {
    // MARK: Predefined Constants
    
    public static let `nil` = CodableTestTypes.UnkeyedValueProperties(repeating: nil, count: 10)
    public static let nonNil = CodableTestTypes.UnkeyedValueProperties(repeating: "LOL", count: 10)
}
