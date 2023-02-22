//
//  EncodingContainer+Keyed+Wrapper.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/15/23.
//

import Common

extension EncodingContainer.Keyed {
    public struct Wrapper<Key> where Key: CodingKey {
        private let base: EncodingContainer.Keyed
                
        // MARK: public Initialization
        
        public init(_ base: EncodingContainer.Keyed) {
            self.base = base
        }
    }
}

// MARK: - KeyedEncodingContainerProtocol Extension

extension EncodingContainer.Keyed.Wrapper: KeyedEncodingContainerProtocol {
    // MARK: Public Instance Interface
    
    public var codingPath: [CodingKey] {
        base.codingPath
    }
    
    public func encode(_ value: Bool, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: Double, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: Float, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: Int, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: Int8, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: Int16, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: Int32, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: Int64, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: String, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: UInt, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: UInt8, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: UInt16, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: UInt32, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: UInt64, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encodeNil(forKey key: Key) throws {
        try base.encodeNil(forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type,
        forKey key: Key
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey: CodingKey {
        base.nestedContainer(keyedBy: keyType, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public mutating func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        base.nestedUnkeyedContainer(forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public mutating func superEncoder() -> Encoder {
        base.superEncoder()
    }
    
    public mutating func superEncoder(forKey key: Key) -> Encoder {
        base.superEncoder(forKey: StringCodingKey(stringValue: key.stringValue))
    }
}
