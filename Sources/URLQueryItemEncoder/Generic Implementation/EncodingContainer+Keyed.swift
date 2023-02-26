//
//  EncodingsingleValueContainer+Keyed.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/15/23.
//

import Common

extension EncodingContainer {
    public final class Keyed {
        public private(set) var children: [String: EncodingContainer]
        public private(set) var codingPath: [any CodingKey]
                
        // MARK: Public Initialization
        
        public init(codingPath: [any CodingKey]) {
            self.codingPath = codingPath
            
            children = [:]
        }
        
        // MARK: Public Instance Interface
        
        public func wrapped<NestedKey>() -> Wrapper<NestedKey> {
            Wrapper(self)
        }
    }
}

// MARK: - KeyedEncodingsingleValueContainerProtocol Extension

extension EncodingContainer.Keyed: KeyedEncodingContainerProtocol {
    // MARK: Public Instance Interface
    
    public func encode(_ value: Bool, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children[key.stringValue] = .singleValue(singleValueContainer)
    }
    
    public func encode(_ value: Double, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children[key.stringValue] = .singleValue(singleValueContainer)
    }
    
    public func encode(_ value: Float, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children[key.stringValue] = .singleValue(singleValueContainer)
    }
    
    public func encode(_ value: Int, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children[key.stringValue] = .singleValue(singleValueContainer)
    }
    
    public func encode(_ value: Int8, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children[key.stringValue] = .singleValue(singleValueContainer)
    }
    
    public func encode(_ value: Int16, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children[key.stringValue] = .singleValue(singleValueContainer)
    }
    
    public func encode(_ value: Int32, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children[key.stringValue] = .singleValue(singleValueContainer)
    }
    
    public func encode(_ value: Int64, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        try singleValueContainer.encode(value)
        
        children[key.stringValue] = .singleValue(singleValueContainer)
    }
    
    public func encode(_ value: String, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        try singleValueContainer.encode(value)
        
        children[key.stringValue] = .singleValue(singleValueContainer)
    }
    
    public func encode(_ value: UInt, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children[key.stringValue] = .singleValue(singleValueContainer)
    }
    
    public func encode(_ value: UInt8, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children[key.stringValue] = .singleValue(singleValueContainer)
    }
    
    public func encode(_ value: UInt16, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children[key.stringValue] = .singleValue(singleValueContainer)
    }
    
    public func encode(_ value: UInt32, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children[key.stringValue] = .singleValue(singleValueContainer)
    }
    
    public func encode(_ value: UInt64, forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children[key.stringValue] = .singleValue(singleValueContainer)
    }
    
    public func encode<T>(_ value: T, forKey key: StringCodingKey) throws where T : Encodable {
        let nextCodingPath = codingPath.appending(key)
        let lowLevelEncoder = LowLevelEncoder(codingPath: nextCodingPath)
        
        try value.encode(to: lowLevelEncoder)
        
        guard let container = lowLevelEncoder.container else {
            preconditionFailure("Encodable type \(T.self) was not encoded by low level encoder.")
        }
        
        children[key.stringValue] = container
    }
    
    public func encodeNil(forKey key: StringCodingKey) throws {
        let nextCodingPath = codingPath.appending(key)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encodeNil()
        
        children[key.stringValue] = .singleValue(singleValueContainer)
    }
    
    public func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type,
        forKey key: StringCodingKey
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey: CodingKey {
        let nextCodingPath = codingPath.appending(key)
        let keyedContainer = EncodingContainer.Keyed(codingPath: nextCodingPath)

        children[key.stringValue] = .keyed(keyedContainer)
        
        return KeyedEncodingContainer(keyedContainer.wrapped())
    }
    
    public func nestedUnkeyedContainer(forKey key: StringCodingKey) -> UnkeyedEncodingContainer {
        let nextCodingPath = codingPath.appending(key)
        let unkeyedContainer = EncodingContainer.Unkeyed(codingPath: nextCodingPath)
        
        children[key.stringValue] = .unkeyed(unkeyedContainer)
        
        return unkeyedContainer
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
