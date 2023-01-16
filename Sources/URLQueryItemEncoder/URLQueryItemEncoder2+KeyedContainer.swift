//
//  URLQueryItemEncoder+KeyedContainer.swift
//  URLQueryItemEncoder
//
//  Created by Kyle Hughes on 1/15/23.
//

import Foundation

@_implementationOnly import Common

extension URLQueryItemEncoder2 {
    internal struct KeyedContainer<Key> where Key: CodingKey {
        private let base: URLQueryItemEncoder2.StringlyKeyedContainer
                
        // MARK: Internal Initialization
        
        internal init(_ base: URLQueryItemEncoder2.StringlyKeyedContainer) {
            self.base = base
        }
    }
}

// MARK: - KeyedEncodingContainerProtocol Extension

extension URLQueryItemEncoder2.KeyedContainer: KeyedEncodingContainerProtocol {
    // MARK: Internal Instance Interface
    
    internal var codingPath: [CodingKey] {
        base.codingPath
    }
    
    internal func encode(_ value: Bool, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    internal func encode(_ value: Double, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    internal func encode(_ value: Float, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    internal func encode(_ value: Int, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    internal func encode(_ value: Int8, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    internal func encode(_ value: Int16, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    internal func encode(_ value: Int32, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    internal func encode(_ value: Int64, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    internal func encode(_ value: String, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    internal func encode(_ value: UInt, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    internal func encode(_ value: UInt8, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    internal func encode(_ value: UInt16, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    internal func encode(_ value: UInt32, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    internal func encode(_ value: UInt64, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    internal func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    internal func encodeNil(forKey key: Key) throws {
        try base.encodeNil(forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    internal func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type,
        forKey key: Key
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey: CodingKey {
        base.nestedContainer(keyedBy: keyType, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    internal mutating func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        base.nestedUnkeyedContainer(forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    internal mutating func superEncoder() -> Encoder {
        base.superEncoder()
    }
    
    internal mutating func superEncoder(forKey key: Key) -> Encoder {
        base.superEncoder(forKey: StringCodingKey(stringValue: key.stringValue))
    }
}
