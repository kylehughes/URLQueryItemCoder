//
//  Container+Keyed.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/15/23.
//

extension Container {
    public final class Keyed {
        public private(set) var codingPath: [any CodingKey]
        public private(set) var storage: [String: Container<Representation>]
                
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

// MARK: - KeyedDecodingContainerProtocol Extension

extension Container.Keyed: KeyedDecodingContainerProtocol where Representation == PrimitiveValue.Unknown {
    // MARK: Public Instance Interface
    
    public var allKeys: [StringCodingKey] {
        storage.keys.map(StringCodingKey.init)
    }
    
    public func contains(_ key: StringCodingKey) -> Bool {
        storage[key.stringValue] != nil
    }
    
    public func decode(_ type: Bool.Type, forKey key: StringCodingKey) throws -> Bool {
        guard let container = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(key)))
        }
        
        // TODO: I don't know if the parts of this switch that aren't singleValue make sense or will ever run
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: key)
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: Double.Type, forKey key: StringCodingKey) throws -> Double {
        guard let container = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(key)))
        }
        
        // TODO: I don't know if the parts of this switch that aren't singleValue make sense or will ever run
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: key)
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: Float.Type, forKey key: StringCodingKey) throws -> Float {
        guard let container = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(key)))
        }
        
        // TODO: I don't know if the parts of this switch that aren't singleValue make sense or will ever run
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: key)
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: Int.Type, forKey key: StringCodingKey) throws -> Int {
        guard let container = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(key)))
        }
        
        // TODO: I don't know if the parts of this switch that aren't singleValue make sense or will ever run
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: key)
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: Int8.Type, forKey key: StringCodingKey) throws -> Int8 {
        guard let container = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(key)))
        }
        
        // TODO: I don't know if the parts of this switch that aren't singleValue make sense or will ever run
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: key)
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: Int16.Type, forKey key: StringCodingKey) throws -> Int16 {
        guard let container = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(key)))
        }
        
        // TODO: I don't know if the parts of this switch that aren't singleValue make sense or will ever run
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: key)
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: Int32.Type, forKey key: StringCodingKey) throws -> Int32 {
        guard let container = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(key)))
        }
        
        // TODO: I don't know if the parts of this switch that aren't singleValue make sense or will ever run
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: key)
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: Int64.Type, forKey key: StringCodingKey) throws -> Int64 {
        guard let container = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(key)))
        }
        
        // TODO: I don't know if the parts of this switch that aren't singleValue make sense or will ever run
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: key)
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: String.Type, forKey key: StringCodingKey) throws -> String {
        guard let container = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(key)))
        }
        
        // TODO: I don't know if the parts of this switch that aren't singleValue make sense or will ever run
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: key)
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: UInt.Type, forKey key: StringCodingKey) throws -> UInt {
        guard let container = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(key)))
        }
        
        // TODO: I don't know if the parts of this switch that aren't singleValue make sense or will ever run
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: key)
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: UInt8.Type, forKey key: StringCodingKey) throws -> UInt8 {
        guard let container = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(key)))
        }
        
        // TODO: I don't know if the parts of this switch that aren't singleValue make sense or will ever run
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: key)
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: UInt16.Type, forKey key: StringCodingKey) throws -> UInt16 {
        guard let container = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(key)))
        }
        
        // TODO: I don't know if the parts of this switch that aren't singleValue make sense or will ever run
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: key)
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: UInt32.Type, forKey key: StringCodingKey) throws -> UInt32 {
        guard let container = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(key)))
        }
        
        // TODO: I don't know if the parts of this switch that aren't singleValue make sense or will ever run
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: key)
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: UInt64.Type, forKey key: StringCodingKey) throws -> UInt64 {
        guard let container = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(key)))
        }
        
        // TODO: I don't know if the parts of this switch that aren't singleValue make sense or will ever run
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: key)
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode<Target>(
        _ type: Target.Type,
        forKey key: StringCodingKey
    ) throws -> Target where Target: Decodable {
        let nextCodingPath = codingPath.appending(key)
        let lowLevelDecoder = LowLevelDecoder(codingPath: nextCodingPath)
        
        return try Target(from: lowLevelDecoder)
    }
    
    public func decodeNil(forKey key: StringCodingKey) throws -> Bool {
        guard let container = storage[key.stringValue] else {
            return true
        }
        
        // TODO: I don't know if the parts of this switch that aren't singleValue make sense or will ever run
        
        switch container {
        case let .keyed(container):
            return try container.decodeNil(forKey: key)
        case let .singleValue(container):
            return container.decodeNil()
        case let .unkeyed(container):
            return try container.decodeNil()
        }
    }
    
    public func nestedContainer<NestedKey>(
        keyedBy type: NestedKey.Type,
        forKey key: StringCodingKey
    ) throws -> KeyedDecodingContainer<NestedKey> where NestedKey: CodingKey {
        guard let container = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(key)))
        }
        
        // TODO: I don't know if the parts of this switch that aren't singleValue make sense or will ever run
        
        let nextCodingPath = codingPath.appending(key)
        
        switch container {
        case let .keyed(container):
            return try KeyedDecodingContainer(container.wrapped())
        case let .singleValue(container):
            throw DecodingError.typeMismatch(
                KeyedDecodingContainer<NestedKey>.self,
                .obvious(nextCodingPath)
            )
        case let .unkeyed(container):
            throw DecodingError.typeMismatch(
                KeyedDecodingContainer<NestedKey>.self,
                .obvious(nextCodingPath)
            )
        }
    }
    
    // TODO: continue from here
    
    public func nestedUnkeyedContainer(forKey key: StringCodingKey) throws -> UnkeyedDecodingContainer {
        let nextCodingPath = codingPath.appending(key)
        
        return URLQueryItemDecoder.UnkeyedContainer(from: intermediate, scopedTo: nextCodingPath)
    }
    
    public func superDecoder() throws -> Decoder {
        let superKey = StringCodingKey(stringValue: "super")
        
        return try superDecoder(forKey: superKey)
    }
    
    public func superDecoder(forKey key: StringCodingKey) throws -> Decoder {
        let nextCodingPath = codingPath.appending(key)
        
        return URLQueryItemDecoder.LowLevelDecoder(intermediate: intermediate, codingPath: nextCodingPath)
    }
}

// MARK: - KeyedEncodingContainerProtocol Extension

extension Container.Keyed: KeyedEncodingContainerProtocol where Representation == PrimitiveValue.Known {
    // MARK: public Instance Interface
    
    public func encode(_ value: Bool, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: Double, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: Float, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: Int, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: Int8, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: Int16, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: Int32, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: Int64, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: String, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: UInt, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: UInt8, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: UInt16, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: UInt32, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode(_ value: UInt64, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .singleValue(container)
    }
    
    public func encode<T>(_ value: T, forKey key: StringCodingKey) throws where T : Encodable {
        let nextCodingPath = codingPath.appending(key)
        let lowLevelEncoder = LowLevelEncoder(codingPath: nextCodingPath)
        try value.encode(to: lowLevelEncoder)
        
        guard let nestedStorage = lowLevelEncoder.storage else {
            fatalError("IDK is this possuble?")
        }
        
        storage[key.stringValue] = nestedStorage
    }
    
    public func encodeNil(forKey key: StringCodingKey) throws {
        storage[key.stringValue] = nil
    }
    
    public func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type,
        forKey key: StringCodingKey
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey: CodingKey {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.Keyed(codingPath: nextCodingPath)

        storage[key.stringValue] = .keyed(container)
        
        return KeyedEncodingContainer(container.wrapped())
    }
    
    public func nestedUnkeyedContainer(forKey key: StringCodingKey) -> UnkeyedEncodingContainer {
        let nextCodingPath = codingPath.appending(key)
        let container = Container.Unkeyed(codingPath: nextCodingPath)
        
        storage[key.stringValue] = .unkeyed(container)
        
        return container
    }
    
    public func superEncoder() -> Encoder {
        // TODO: Does any of this make sense?
        
        let key = StringCodingKey(stringValue: "super")
        
        return superEncoder(forKey: key)
    }
    
    public func superEncoder(forKey key: StringCodingKey) -> Encoder {
        let nextCodingPath = codingPath.appending(key)
        
        // TODO: Does any of this make sense?
        
        return LowLevelEncoder(codingPath: nextCodingPath)
    }
}
