//
//  Container+Keyed.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/15/23.
//

extension Container {
    public final class Keyed {
        public private(set) var codingPath: [any CodingKey]
        public private(set) var storage: [String: Container]
                
        // MARK: public Initialization
        
        public init(codingPath: [any CodingKey]) {
            self.codingPath = codingPath
            
            storage = [:]
        }
        
        // MARK: Public Instance Interface
        
        public func wrapped<NestedKey>() -> Wrapper<NestedKey> {
            Wrapper(self)
        }
    }
}

// MARK: - KeyedEncodingContainerProtocol Extension

extension Container.Keyed: KeyedEncodingContainerProtocol {
    // MARK: public Typealiases
    
    public typealias Key = StringCodingKey
    
    // MARK: public Instance Interface
    
    public func encode(_ value: Bool, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: Double, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: Float, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: Int, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: Int8, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: Int16, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: Int32, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: Int64, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: String, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: UInt, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: UInt8, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: UInt16, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: UInt32, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: UInt64, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
        let nextCodingPath = codingPath.appending(key)
        let lowLevelEncoder = LowLevelEncoder(codingPath: nextCodingPath)
        try value.encode(to: lowLevelEncoder)
        
        guard let nestedStorage = lowLevelEncoder.storage else {
            fatalError("IDK is this possuble?")
        }
        
        storage[key.stringValue] = nestedStorage
    }
    
    public func encodeNil(forKey key: Key) throws {
        storage[key.stringValue] = nil
    }
    
    public func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type,
        forKey key: Key
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey: CodingKey {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.Keyed(codingPath: nextCodingPath)

        storage[key.stringValue] = .keyed(container)
        
        return KeyedEncodingContainer(container.wrapped())
    }
    
    public func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.Unkeyed(codingPath: nextCodingPath)
        
        storage[key.stringValue] = .unkeyed(container)
        
        return container
    }
    
    public func superEncoder() -> Encoder {
        // TODO: Does any of this make sense?
        
        let key = Key(stringValue: "super")
        
        return superEncoder(forKey: key)
    }
    
    public func superEncoder(forKey key: Key) -> Encoder {
        let nextCodingPath = codingPath.appending(key)
        
        // TODO: Does any of this make sense?
        
        return LowLevelEncoder(codingPath: nextCodingPath)
    }
}