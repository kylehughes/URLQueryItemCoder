//
//  CodableTestTypes.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 12/30/22.
//

import Foundation

public enum CodableTestTypes {
    // NO-OP
}

// MARK: - CodableTestTypes.OmniValueProperties Definition

extension CodableTestTypes {
    public struct OmniValueProperties: Codable, Equatable {
        public let one: SingleValueProperties?
        public let two: SingleValueProperties?
        public let three: [String?]?
        public let four: [String?]?
        
        // MARK: Predefined Constants
        
        public static let maximumValues = OmniValueProperties(
            one: .default,
            two: .default,
            three: Array(repeating: "THREE", count: 10),
            four: Array(repeating: "FOUR", count: 10)
        )
        
        public static let minimumValues = OmniValueProperties(
            one: .default,
            two: .default,
            three: Array(repeating: "THREE", count: 10),
            four: Array(repeating: "FOUR", count: 10)
        )
        
        public static let `nil` = OmniValueProperties(
            one: .partial,
            two: .partial,
            three: Array(repeating: nil as String?, count: 10),
            four: Array(repeating: nil as String?, count: 10)
        )
    }
}

// MARK: - CodableTestTypes.SingleValueProperties Definition

extension CodableTestTypes {
    public struct SingleValueProperties: Codable, Equatable {
        public let bool: Bool?
        public let date: Date?
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
        
        public static let empty = SingleValueProperties(
            bool: nil,
            date: nil,
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
        
        public static let `default` = SingleValueProperties(
            bool: true,
            date: Date(timeIntervalSince1970: 1_000),
            double: 123.45,
            float: 543.21,
            int: 10,
            int8: 20,
            int16: 30,
            int32: 40,
            int64: 50,
            string: "DEFAULT CONSTANT",
            uint: 60,
            uint8: 70,
            uint16: 80,
            uint32: 90,
            uint64: 100
        )
        
        public static let partial = SingleValueProperties(
            bool: true,
            date: nil,
            double: 123.45,
            float: nil,
            int: 10,
            int8: nil,
            int16: 30,
            int32: nil,
            int64: 50,
            string: nil,
            uint: 60,
            uint8: nil,
            uint16: 80,
            uint32: nil,
            uint64: 100
        )
    }
}

// MARK: - CodableTestTypes.SingleValueProperties.Abridged Definition

extension CodableTestTypes.SingleValueProperties {
    public struct Abridged: Codable, Equatable {
        public let bool: Bool
        public let data: Data
        public let date: Date
        public let double: Double
        public let float: Float
        public let int: Int
        public let string: String
        public let uint: UInt
        
        // MARK: Predefined Constants

        public static let `default` = Self(
            bool: true,
            data: Data([0xDE, 0xAD, 0xBE, 0xEF]),
            date: Date(timeIntervalSince1970: 1_000),
            double: 123.45,
            float: 543.21,
            int: 10,
            string: "DEFAULT CONSTANT",
            uint: 20
        )
        
        public static let `doubleNegativeInfinity` = Self(
            bool: true,
            data: Data([0xDE, 0xAD, 0xBE, 0xEF]),
            date: Date(timeIntervalSince1970: 1_000),
            double: -.infinity,
            float: 543.21,
            int: 10,
            string: "DEFAULT CONSTANT",
            uint: 20
        )
        
        public static let `doubleNotANumber` = Self(
            bool: true,
            data: Data([0xDE, 0xAD, 0xBE, 0xEF]),
            date: Date(timeIntervalSince1970: 1_000),
            double: .nan,
            float: 543.21,
            int: 10,
            string: "DEFAULT CONSTANT",
            uint: 20
        )
        
        public static let `doublePositiveInfinity` = Self(
            bool: true,
            data: Data([0xDE, 0xAD, 0xBE, 0xEF]),
            date: Date(timeIntervalSince1970: 1_000),
            double: .infinity,
            float: 543.21,
            int: 10,
            string: "DEFAULT CONSTANT",
            uint: 20
        )
        
        public static let `floatNegativeInfinity` = Self(
            bool: true,
            data: Data([0xDE, 0xAD, 0xBE, 0xEF]),
            date: Date(timeIntervalSince1970: 1_000),
            double: 123.45,
            float: -.infinity,
            int: 10,
            string: "DEFAULT CONSTANT",
            uint: 20
        )
        
        public static let `floatNotANumber` = Self(
            bool: true,
            data: Data([0xDE, 0xAD, 0xBE, 0xEF]),
            date: Date(timeIntervalSince1970: 1_000),
            double: 123.45,
            float: .nan,
            int: 10,
            string: "DEFAULT CONSTANT",
            uint: 20
        )
        
        public static let `floatPositiveInfinity` = Self(
            bool: true,
            data: Data([0xDE, 0xAD, 0xBE, 0xEF]),
            date: Date(timeIntervalSince1970: 1_000),
            double: 123.45,
            float: .infinity,
            int: 10,
            string: "DEFAULT CONSTANT",
            uint: 20
        )
    }
}

// MARK: - CodableTestTypes.SingleValueProperties.Superclass Definition

extension CodableTestTypes.SingleValueProperties {
    public class Superclass: Decodable, Encodable, Equatable {
        public let bool: Bool?
        public let data: Data?
        public let date: Date?
        public let double: Double?
        public let float: Float?
        public let int: Int?
        public let int8: Int8?
        public let int16: Int16?
        public let int32: Int32?
        public let int64: Int64?
        
        // MARK: Public Initialization
        
        public init(
            bool: Bool?,
            data: Data?,
            date: Date?,
            double: Double?,
            float: Float?,
            int: Int?,
            int8: Int8?,
            int16: Int16?,
            int32: Int32?,
            int64: Int64?
        ) {
            self.bool = bool
            self.data = data
            self.date = date
            self.double = double
            self.float = float
            self.int = int
            self.int8 = int8
            self.int16 = int16
            self.int32 = int32
            self.int64 = int64
        }
        
        // MARK: Decodable Implementation
        
        public required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            bool = try Self.decode(.bool, in: container)
            data = try Self.decode(.data, in: container)
            date = try Self.decode(.date, in: container)
            double = try Self.decode(.double, in: container)
            float = try Self.decode(.float, in: container)
            int = try Self.decode(.int, in: container)
            int8 = try Self.decode(.int8, in: container)
            int16 = try Self.decode(.int16, in: container)
            int32 = try Self.decode(.int32, in: container)
            int64 = try Self.decode(.int64, in: container)
        }
        
        // MARK: Equatable Implementation
        
        public static func == (
            lhs: CodableTestTypes.SingleValueProperties.Superclass,
            rhs: CodableTestTypes.SingleValueProperties.Superclass
        ) -> Bool {
            lhs.bool == rhs.bool &&
            lhs.data == rhs.data &&
            lhs.date == rhs.date &&
            lhs.double == rhs.double &&
            lhs.float == rhs.float &&
            lhs.int == rhs.int &&
            lhs.int8 == rhs.int8 &&
            lhs.int16 == rhs.int16 &&
            lhs.int32 == rhs.int32 &&
            lhs.int64 == rhs.int64
        }
        
        // MARK: Private Static Interface
        
        private static func decode<Target>(
            _ key: CodingKeys,
            in container: KeyedDecodingContainer<CodingKeys>
        ) throws -> Target? where Target: Decodable {
            guard try !container.decodeNil(forKey: key) else {
                return nil
            }
            
            return try container.decode(Target.self, forKey: key)
        }
        
        private static func encode<Target>(
            _ key: CodingKeys,
            as value: Target?,
            in container: inout KeyedEncodingContainer<CodingKeys>
        ) throws where Target: Encodable {
            guard let value else {
                return
            }
            
            try container.encode(value, forKey: key)
        }
        
        // MARK: Encodable Implementation
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try Self.encode(.bool, as: bool, in: &container)
            try Self.encode(.data, as: data, in: &container)
            try Self.encode(.date, as: date, in: &container)
            try Self.encode(.double, as: double, in: &container)
            try Self.encode(.float, as: float, in: &container)
            try Self.encode(.int, as: int, in: &container)
            try Self.encode(.int8, as: int8, in: &container)
            try Self.encode(.int16, as: int16, in: &container)
            try Self.encode(.int32, as: int32, in: &container)
            try Self.encode(.int64, as: int64, in: &container)
        }
    }
}

// MARK: - Predefined Constants

extension CodableTestTypes.SingleValueProperties.Superclass {
    // MARK: Predefined Constants
    
    public static let `default` = CodableTestTypes.SingleValueProperties.Superclass(
        bool: true,
        data: Data([0xDE, 0xAD, 0xBE, 0xEF]),
        date: Date(timeIntervalSince1970: 1_000),
        double: 1,
        float: 2,
        int: 3,
        int8: 4,
        int16: 5,
        int32: 6,
        int64: 7
    )
    
    public static let partial = CodableTestTypes.SingleValueProperties.Superclass(
        bool: true,
        data: nil,
        date: Date(timeIntervalSince1970: 1_000),
        double: nil,
        float: 2,
        int: nil,
        int8: 4,
        int16: nil,
        int32: 6,
        int64: nil
    )
}

// MARK: - CodableTestTypes.Superclass.CodingKeys Definition

extension CodableTestTypes.SingleValueProperties.Superclass {
    public enum CodingKeys: CodingKey {
        case bool
        case data
        case date
        case double
        case float
        case int
        case int8
        case int16
        case int32
        case int64
    }
}

// MARK: - CodableTestTypes.SingleValueProperties.Subclass Definition

extension CodableTestTypes.SingleValueProperties {
    public class Subclass: Superclass {
        public let string: String?
        public let uint: UInt?
        public let uint8: UInt8?
        public let uint16: UInt16?
        public let uint32: UInt32?
        public let uint64: UInt64?
        
        // MARK: Public Initialization
        
        public init(
            bool: Bool?,
            data: Data?,
            date: Date?,
            double: Double?,
            float: Float?,
            int: Int?,
            int8: Int8?,
            int16: Int16?,
            int32: Int32?,
            int64: Int64?,
            string: String?,
            uint: UInt?,
            uint8: UInt8?,
            uint16: UInt16?,
            uint32: UInt32?,
            uint64: UInt64?
        ) {
            self.string = string
            self.uint = uint
            self.uint8 = uint8
            self.uint16 = uint16
            self.uint32 = uint32
            self.uint64 = uint64
            
            super.init(
                bool: bool,
                data: data,
                date: date,
                double: double,
                float: float,
                int: int,
                int8: int8,
                int16: int16,
                int32: int32,
                int64: int64
            )
        }
        
        // MARK: Decodable Implementation
        
        public required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            string = try Self.decode(.string, in: container)
            uint = try Self.decode(.uint, in: container)
            uint8 = try Self.decode(.uint8, in: container)
            uint16 = try Self.decode(.uint16, in: container)
            uint32 = try Self.decode(.uint32, in: container)
            uint64 = try Self.decode(.uint64, in: container)
            
            let superDecoder = try container.superDecoder()
            
            try super.init(from: superDecoder)
        }
        
        // MARK: Equatable Implementation
        
        public static func == (
            lhs: CodableTestTypes.SingleValueProperties.Subclass,
            rhs: CodableTestTypes.SingleValueProperties.Subclass
        ) -> Bool {
            lhs.bool == rhs.bool &&
            lhs.data == rhs.data &&
            lhs.date == rhs.date &&
            lhs.double == rhs.double &&
            lhs.float == rhs.float &&
            lhs.int == rhs.int &&
            lhs.int8 == rhs.int8 &&
            lhs.int16 == rhs.int16 &&
            lhs.int32 == rhs.int32 &&
            lhs.int64 == rhs.int64 &&
            lhs.string == rhs.string &&
            lhs.uint == rhs.uint &&
            lhs.uint8 == rhs.uint8 &&
            lhs.uint16 == rhs.uint16 &&
            lhs.uint32 == rhs.uint32 &&
            lhs.uint64 == rhs.uint64
        }
        
        // MARK: Private Static Interface
        
        private static func decode<Target>(
            _ key: CodingKeys,
            in container: KeyedDecodingContainer<CodingKeys>
        ) throws -> Target? where Target: Decodable {
            guard try !container.decodeNil(forKey: key) else {
                return nil
            }
            
            return try container.decode(Target.self, forKey: key)
        }
        
        private static func encode<Target>(
            _ key: CodingKeys,
            as value: Target?,
            in container: inout KeyedEncodingContainer<CodingKeys>
        ) throws where Target: Encodable {
            guard let value else {
                return
            }
            
            try container.encode(value, forKey: key)
        }
        
        // MARK: Encodable Implementation
        
        public override func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try Self.encode(.string, as: string, in: &container)
            try Self.encode(.uint, as: uint, in: &container)
            try Self.encode(.uint8, as: uint8, in: &container)
            try Self.encode(.uint16, as: uint16, in: &container)
            try Self.encode(.uint32, as: uint32, in: &container)
            try Self.encode(.uint64, as: uint64, in: &container)
            
            let superEncoder = container.superEncoder()
            
            try super.encode(to: superEncoder)
        }
    }
}

// MARK: - Constants

extension CodableTestTypes.SingleValueProperties.Subclass {
    public static let subDefault = CodableTestTypes.SingleValueProperties.Subclass(
        bool: true,
        data: Data([0xDE, 0xAD, 0xBE, 0xEF]),
        date: Date(timeIntervalSince1970: 1_000),
        double: 1,
        float: 2,
        int: 3,
        int8: 4,
        int16: 5,
        int32: 6,
        int64: 7,
        string: "SUB DEFAULT CONSTANT",
        uint: 8,
        uint8: 9,
        uint16: 10,
        uint32: 11,
        uint64: 12
    )
    
    public static let subEmpty = CodableTestTypes.SingleValueProperties.Subclass(
        bool: nil,
        data: nil,
        date: nil,
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
    
    public static let subPartial = CodableTestTypes.SingleValueProperties.Subclass(
        bool: true,
        data: nil,
        date: Date(timeIntervalSince1970: 1_000),
        double: nil,
        float: 2,
        int: nil,
        int8: 4,
        int16: nil,
        int32: 6,
        int64: nil,
        string: "SUB DEFAULT CONSTANT",
        uint: nil,
        uint8: 9,
        uint16: nil,
        uint32: 11,
        uint64: nil
    )
}

// MARK: - CodableTestTypes.Superclass.CodingKeys Definition

extension CodableTestTypes.SingleValueProperties.Subclass {
    public enum CodingKeys: CodingKey {
        case string
        case uint
        case uint8
        case uint16
        case uint32
        case uint64
    }
}

// MARK: - CodableTestTypes.KeyEncodingStrategy Definition

extension CodableTestTypes {
    public struct KeyEncodingStrategy: Codable, Equatable {
        public let thisIsABool: Bool
        public let thisIsAData: Data
        public let thisIsADate: Date
        public let thisIsADouble: Double
        public let thisIsAFloat: Float
        public let thisIsAnInt: Int
        public let thisIsAnInt8: Int8
        public let thisIsAnInt16: Int16
        public let thisIsAnInt32: Int32
        public let thisIsAnInt64: Int64
        public let thisIsAnOptional: Optional<String>
        public let thisIsAString: String
        public let thisIsAUint: UInt
        public let thisIsAUint8: UInt8
        public let thisIsAUint16: UInt16
        public let thisIsAUint32: UInt32
        public let thisIsAUint64: UInt64
    }
}

// MARK: - Constants

extension CodableTestTypes.KeyEncodingStrategy {
    // MARK: Predefined

    public static let `default` = CodableTestTypes.KeyEncodingStrategy(
        thisIsABool: true,
        thisIsAData: Data([0xDE, 0xAD, 0xBE, 0xEF]),
        thisIsADate: Date(timeIntervalSince1970: 0),
        thisIsADouble: 1,
        thisIsAFloat: 2,
        thisIsAnInt: 3,
        thisIsAnInt8: 4,
        thisIsAnInt16: 5,
        thisIsAnInt32: 6,
        thisIsAnInt64: 7,
        thisIsAnOptional: nil,
        thisIsAString: "String",
        thisIsAUint: 8,
        thisIsAUint8: 9,
        thisIsAUint16: 10,
        thisIsAUint32: 11,
        thisIsAUint64: 12
    )
}
