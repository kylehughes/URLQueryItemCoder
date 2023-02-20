//
//  EncodingContainer+SingleValue.swift
//  Common
//
//  Created by Kyle Hughes on 1/15/23.
//

extension EncodingContainer {
    public final class SingleValue {
        public let codingPath: [any CodingKey]
        
        public private(set) var storage: Storage?
                
        // MARK: public Initialization
        
        public init(codingPath: [any CodingKey]) {
            self.codingPath = codingPath
            
            storage = nil
        }
    }
}

// MARK: - SingleValueEncodingContainer Extension

extension EncodingContainer.SingleValue: SingleValueEncodingContainer {
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

extension EncodingContainer.SingleValue {
    public enum Storage {
        case container(EncodingContainer)
        case primitive(PrimitiveValue)
    }
}

extension DecodingError.Context {
    internal static func obvious(_ codingPath: [any CodingKey]) -> Self {
        Self(codingPath: codingPath, debugDescription: String())
    }
}
