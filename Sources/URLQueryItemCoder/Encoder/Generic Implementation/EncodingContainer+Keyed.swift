//
//  EncodingsingleValueContainer+Keyed.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/15/23.
//

extension EncodingContainer {
    internal final class Keyed {
        internal private(set) var children: [String: EncodingContainer]
        internal private(set) var codingPath: [any CodingKey]
        
        private let configuration: EncodingStrategies
                
        // MARK: Internal Initialization
        
        internal init(codingPath: [any CodingKey], configuration: EncodingStrategies) {
            self.codingPath = codingPath
            self.configuration = configuration
            
            children = [:]
        }
        
        // MARK: Internal Instance Interface
        
        internal func wrapped<NestedKey>() -> Wrapper<NestedKey> {
            Wrapper(self)
        }
        
        // MARK: Private Instance Interface
        
        private func nextCodingPath(appending key: any CodingKey) -> [any CodingKey] {
            var nextCodingPath = codingPath
            nextCodingPath.append(key)
            
            return nextCodingPath
        }
    }
}

// MARK: - KeyedEncodingsingleValueContainerProtocol Extension

extension EncodingContainer.Keyed: KeyedEncodingContainerProtocol {
    // MARK: Internal Instance Interface
    
    internal func encode(_ value: Bool, forKey key: StringCodingKey) throws {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        let nextCodingPath = nextCodingPath(appending: encodedKey)
        
        let singleValueContainer = EncodingContainer.SingleValue(
            codingPath: nextCodingPath,
            configuration: configuration
        )
        
        try singleValueContainer.encode(value)
        
        children[encodedKey.stringValue] = .singleValue(singleValueContainer)
    }
    
    internal func encode(_ value: Double, forKey key: StringCodingKey) throws {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        let nextCodingPath = nextCodingPath(appending: encodedKey)
        
        let singleValueContainer = EncodingContainer.SingleValue(
            codingPath: nextCodingPath,
            configuration: configuration
        )
        
        try singleValueContainer.encode(value)
        
        children[encodedKey.stringValue] = .singleValue(singleValueContainer)
    }
    
    internal func encode(_ value: Float, forKey key: StringCodingKey) throws {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        let nextCodingPath = nextCodingPath(appending: encodedKey)
        
        let singleValueContainer = EncodingContainer.SingleValue(
            codingPath: nextCodingPath,
            configuration: configuration
        )
        
        try singleValueContainer.encode(value)
        
        children[encodedKey.stringValue] = .singleValue(singleValueContainer)
    }
    
    internal func encode(_ value: Int, forKey key: StringCodingKey) throws {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        let nextCodingPath = nextCodingPath(appending: encodedKey)
        
        let singleValueContainer = EncodingContainer.SingleValue(
            codingPath: nextCodingPath,
            configuration: configuration
        )
        
        try singleValueContainer.encode(value)
        
        children[encodedKey.stringValue] = .singleValue(singleValueContainer)
    }
    
    internal func encode(_ value: Int8, forKey key: StringCodingKey) throws {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        let nextCodingPath = nextCodingPath(appending: encodedKey)
        
        let singleValueContainer = EncodingContainer.SingleValue(
            codingPath: nextCodingPath,
            configuration: configuration
        )
        
        try singleValueContainer.encode(value)
        
        children[encodedKey.stringValue] = .singleValue(singleValueContainer)
    }
    
    internal func encode(_ value: Int16, forKey key: StringCodingKey) throws {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        let nextCodingPath = nextCodingPath(appending: encodedKey)
        
        let singleValueContainer = EncodingContainer.SingleValue(
            codingPath: nextCodingPath,
            configuration: configuration
        )
        
        try singleValueContainer.encode(value)
        
        children[encodedKey.stringValue] = .singleValue(singleValueContainer)
    }
    
    internal func encode(_ value: Int32, forKey key: StringCodingKey) throws {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        let nextCodingPath = nextCodingPath(appending: encodedKey)
        
        let singleValueContainer = EncodingContainer.SingleValue(
            codingPath: nextCodingPath,
            configuration: configuration
        )
        
        try singleValueContainer.encode(value)
        
        children[encodedKey.stringValue] = .singleValue(singleValueContainer)
    }
    
    internal func encode(_ value: Int64, forKey key: StringCodingKey) throws {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        let nextCodingPath = nextCodingPath(appending: encodedKey)
        
        let singleValueContainer = EncodingContainer.SingleValue(
            codingPath: nextCodingPath,
            configuration: configuration
        )
        
        try singleValueContainer.encode(value)
        
        children[encodedKey.stringValue] = .singleValue(singleValueContainer)
    }
    
    internal func encode(_ value: String, forKey key: StringCodingKey) throws {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        let nextCodingPath = nextCodingPath(appending: encodedKey)
        
        let singleValueContainer = EncodingContainer.SingleValue(
            codingPath: nextCodingPath,
            configuration: configuration
        )
        
        try singleValueContainer.encode(value)
        
        children[encodedKey.stringValue] = .singleValue(singleValueContainer)
    }
    
    internal func encode(_ value: UInt, forKey key: StringCodingKey) throws {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        let nextCodingPath = nextCodingPath(appending: encodedKey)
        
        let singleValueContainer = EncodingContainer.SingleValue(
            codingPath: nextCodingPath,
            configuration: configuration
        )
        
        try singleValueContainer.encode(value)
        
        children[encodedKey.stringValue] = .singleValue(singleValueContainer)
    }
    
    internal func encode(_ value: UInt8, forKey key: StringCodingKey) throws {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        let nextCodingPath = nextCodingPath(appending: encodedKey)
        
        let singleValueContainer = EncodingContainer.SingleValue(
            codingPath: nextCodingPath,
            configuration: configuration
        )
        
        try singleValueContainer.encode(value)
        
        children[encodedKey.stringValue] = .singleValue(singleValueContainer)
    }
    
    internal func encode(_ value: UInt16, forKey key: StringCodingKey) throws {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        let nextCodingPath = nextCodingPath(appending: encodedKey)
        
        let singleValueContainer = EncodingContainer.SingleValue(
            codingPath: nextCodingPath,
            configuration: configuration
        )
        
        try singleValueContainer.encode(value)
        
        children[encodedKey.stringValue] = .singleValue(singleValueContainer)
    }
    
    internal func encode(_ value: UInt32, forKey key: StringCodingKey) throws {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        let nextCodingPath = nextCodingPath(appending: encodedKey)
        
        let singleValueContainer = EncodingContainer.SingleValue(
            codingPath: nextCodingPath,
            configuration: configuration
        )
        
        try singleValueContainer.encode(value)
        
        children[encodedKey.stringValue] = .singleValue(singleValueContainer)
    }
    
    internal func encode(_ value: UInt64, forKey key: StringCodingKey) throws {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        let nextCodingPath = nextCodingPath(appending: encodedKey)
        
        let singleValueContainer = EncodingContainer.SingleValue(
            codingPath: nextCodingPath,
            configuration: configuration
        )
        
        try singleValueContainer.encode(value)
        
        children[encodedKey.stringValue] = .singleValue(singleValueContainer)
    }
    
    internal func encode<Value>(_ value: Value, forKey key: StringCodingKey) throws where Value: Encodable {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        let nextCodingPath = nextCodingPath(appending: encodedKey)

        children[encodedKey.stringValue] = try .encodeWithSpecialTreatment(
            value,
            at: nextCodingPath,
            using: configuration
        )
    }
    
    internal func encodeNil(forKey key: StringCodingKey) throws {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        let nextCodingPath = nextCodingPath(appending: encodedKey)
        
        let singleValueContainer = EncodingContainer.SingleValue(
            codingPath: nextCodingPath,
            configuration: configuration
        )
        
        try singleValueContainer.encodeNil()
        
        children[encodedKey.stringValue] = .singleValue(singleValueContainer)
    }
    
    internal func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type,
        forKey key: StringCodingKey
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey: CodingKey {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        let nextCodingPath = nextCodingPath(appending: encodedKey)
        
        let keyedContainer = EncodingContainer.Keyed(codingPath: nextCodingPath, configuration: configuration)

        children[encodedKey.stringValue] = .keyed(keyedContainer)
        
        return KeyedEncodingContainer(keyedContainer.wrapped())
    }
    
    internal func nestedUnkeyedContainer(forKey key: StringCodingKey) -> UnkeyedEncodingContainer {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        let nextCodingPath = nextCodingPath(appending: encodedKey)
        
        let unkeyedContainer = EncodingContainer.Unkeyed(codingPath: nextCodingPath, configuration: configuration)
        
        children[encodedKey.stringValue] = .unkeyed(unkeyedContainer)
        
        return unkeyedContainer
    }
    
    internal func superEncoder() -> Encoder {
        let key = StringCodingKey(stringValue: "super")
        
        return superEncoder(forKey: key)
    }
    
    internal func superEncoder(forKey key: StringCodingKey) -> Encoder {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        let nextCodingPath = nextCodingPath(appending: encodedKey)
        
        let lowLevelEncoder = LowLevelEncoder(codingPath: nextCodingPath, configuration: configuration)
        
        children[encodedKey.stringValue] = .lowLevelEncoder(lowLevelEncoder)
        
        return lowLevelEncoder
    }
}
