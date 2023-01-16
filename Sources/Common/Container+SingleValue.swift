//
//  Container+SingleValue.swift
//  Common
//
//  Created by Kyle Hughes on 1/15/23.
//

extension Container {
    public final class SingleValue {
        public let codingPath: [any CodingKey]
        
        public private(set) var storage: Storage<Representation>?
                
        // MARK: public Initialization
        
        public init(codingPath: [any CodingKey]) {
            self.codingPath = codingPath
            
            storage = nil
        }
    }
}

// MARK: - SingleValueDecodingContainer Extension

extension Container.SingleValue: SingleValueDecodingContainer where Representation == PrimitiveValue.Unknown {
    // MARK: Public Instance Interface
    
    public func decode(_ type: Bool.Type) throws -> Bool {
        switch storage {
        case let .primitive(primitive):
            switch primitive.value {
            case let value as Bool:
                return value
            default:
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
        case .container:
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        case .none:
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
    }
    
    public func decode(_ type: Double.Type) throws -> Double {
        switch storage {
        case let .primitive(primitive):
            switch primitive.value {
            case let value as Double:
                return value
            default:
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
        case .container:
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        case .none:
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
    }
    
    public func decode(_ type: Float.Type) throws -> Float {
        switch storage {
        case let .primitive(primitive):
            switch primitive.value {
            case let value as Float:
                return value
            default:
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
        case .container:
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        case .none:
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
    }
    
    public func decode(_ type: Int.Type) throws -> Int {
        switch storage {
        case let .primitive(primitive):
            switch primitive.value {
            case let value as Int:
                return value
            default:
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
        case .container:
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        case .none:
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
    }
    
    public func decode(_ type: Int8.Type) throws -> Int8 {
        switch storage {
        case let .primitive(primitive):
            switch primitive.value {
            case let value as Int8:
                return value
            default:
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
        case .container:
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        case .none:
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
    }
    
    public func decode(_ type: Int16.Type) throws -> Int16 {
        switch storage {
        case let .primitive(primitive):
            switch primitive.value {
            case let value as Int16:
                return value
            default:
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
        case .container:
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        case .none:
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
    }
    
    public func decode(_ type: Int32.Type) throws -> Int32 {
        switch storage {
        case let .primitive(primitive):
            switch primitive.value {
            case let value as Int32:
                return value
            default:
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
        case .container:
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        case .none:
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
    }
    
    public func decode(_ type: Int64.Type) throws -> Int64 {
        switch storage {
        case let .primitive(primitive):
            switch primitive.value {
            case let value as Int64:
                return value
            default:
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
        case .container:
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        case .none:
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
    }
    
    public func decode(_ type: String.Type) throws -> String {
        switch storage {
        case let .primitive(primitive):
            switch primitive.value {
            case let value as String:
                return value
            default:
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
        case .container:
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        case .none:
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
    }
    
    public func decode(_ type: UInt.Type) throws -> UInt {
        switch storage {
        case let .primitive(primitive):
            switch primitive.value {
            case let value as UInt:
                return value
            default:
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
        case .container:
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        case .none:
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
    }
    
    public func decode(_ type: UInt8.Type) throws -> UInt8 {
        switch storage {
        case let .primitive(primitive):
            switch primitive.value {
            case let value as UInt8:
                return value
            default:
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
        case .container:
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        case .none:
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
    }
    
    public func decode(_ type: UInt16.Type) throws -> UInt16 {
        switch storage {
        case let .primitive(primitive):
            switch primitive.value {
            case let value as UInt16:
                return value
            default:
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
        case .container:
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        case .none:
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
    }
    
    public func decode(_ type: UInt32.Type) throws -> UInt32 {
        switch storage {
        case let .primitive(primitive):
            switch primitive.value {
            case let value as UInt32:
                return value
            default:
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
        case .container:
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        case .none:
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
    }
    
    public func decode(_ type: UInt64.Type) throws -> UInt64 {
        switch storage {
        case let .primitive(primitive):
            switch primitive.value {
            case let value as UInt64:
                return value
            default:
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
        case .container:
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        case .none:
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
    }
    
    public func decode<Target>(_ type: Target.Type) throws -> Target where Target: Decodable {
        let lowLevelDecoder = LowLevelDecoder(codingPath: codingPath)
        
        return try Target(from: lowLevelDecoder)
    }
    
    public func decodeNil() -> Bool {
        switch storage {
        case .none:
            return true
        default:
            return false
        }
    }
}

// MARK: - SingleValueEncodingContainer Extension

extension Container.SingleValue: SingleValueEncodingContainer where Representation == PrimitiveValue.Known {
    // MARK: Public Instance Interface
    
    public func encode(_ value: Bool) throws {
        storage = .primitive(.bool(value))
    }
    
    public func encode(_ value: Double) throws {
        storage = .primitive(.double(value))
    }
    
    public func encode(_ value: Float) throws {
        storage = .primitive(.float(value))
    }
    
    public func encode(_ value: Int) throws {
        storage = .primitive(.int(value))
    }
    
    public func encode(_ value: Int8) throws {
        storage = .primitive(.int8(value))
    }
    
    public func encode(_ value: Int16) throws {
        storage = .primitive(.int16(value))
    }
    
    public func encode(_ value: Int32) throws {
        storage = .primitive(.int32(value))
    }
    
    public func encode(_ value: Int64) throws {
        storage = .primitive(.int64(value))
    }
    
    public func encode(_ value: String) throws {
        storage = .primitive(.string(value))
    }
    
    public func encode(_ value: UInt) throws {
        storage = .primitive(.uint(value))
    }
    
    public func encode(_ value: UInt8) throws {
        storage = .primitive(.uint8(value))
    }
    
    public func encode(_ value: UInt16) throws {
        storage = .primitive(.uint16(value))
    }
    
    public func encode(_ value: UInt32) throws {
        storage = .primitive(.uint32(value))
    }
    
    public func encode(_ value: UInt64) throws {
        storage = .primitive(.uint64(value))
    }
    
    public func encode<T>(_ value: T) throws where T: Encodable {
        let lowLevelEncoder = LowLevelEncoder(codingPath: codingPath)
        try value.encode(to: lowLevelEncoder)
        
        guard let nestedStorage = lowLevelEncoder.storage else {
            fatalError("IDK is this possuble?")
        }
        
        storage = .container(nestedStorage)
    }
    
    public func encodeNil() throws {
        storage = nil
    }
}

// MARK: - Container.SingleValue.Storage Definition

extension Container.SingleValue {
    public enum Storage<Representation> where Representation: PrimitiveValueRepresentation {
        case container(Container)
        case primitive(Representation)
    }
}

extension DecodingError.Context {
    internal static func obvious(_ codingPath: [any CodingKey]) -> Self {
        Self(codingPath: codingPath, debugDescription: String())
    }
}
