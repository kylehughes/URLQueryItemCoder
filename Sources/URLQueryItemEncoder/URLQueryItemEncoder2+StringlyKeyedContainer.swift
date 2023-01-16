//
//  URLQueryItemEncoder2+StringlyKeyedContainer.swift
//  URLQueryItemEncoder
//
//  Created by Kyle Hughes on 1/15/23.
//

import Foundation

@_implementationOnly import Common

extension URLQueryItemEncoder2 {
    typealias Container = Common.Container<SingleValueContainer, StringlyKeyedContainer, UnkeyedContainer>
    
    internal final class StringlyKeyedContainer {
        internal private(set) var codingPath: [any CodingKey]
        internal private(set) var storage: [String: Container]
                
        // MARK: Internal Initialization
        
        internal init(codingPath: [any CodingKey]) {
            self.codingPath = codingPath
            
            storage = [:]
        }
    }
}

// MARK: - KeyedEncodingContainerProtocol Extension

extension URLQueryItemEncoder2.StringlyKeyedContainer: KeyedEncodingContainerProtocol {
    // MARK: Internal Typealiases
    
    internal typealias Key = StringCodingKey
    
    // MARK: Internal Instance Interface
    
    internal func encode(_ value: Bool, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .single(container)
    }
    
    internal func encode(_ value: Double, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .single(container)
    }
    
    internal func encode(_ value: Float, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .single(container)
    }
    
    internal func encode(_ value: Int, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .single(container)
    }
    
    internal func encode(_ value: Int8, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .single(container)
    }
    
    internal func encode(_ value: Int16, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .single(container)
    }
    
    internal func encode(_ value: Int32, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .single(container)
    }
    
    internal func encode(_ value: Int64, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .single(container)
    }
    
    internal func encode(_ value: String, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .single(container)
    }
    
    internal func encode(_ value: UInt, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .single(container)
    }
    
    internal func encode(_ value: UInt8, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .single(container)
    }
    
    internal func encode(_ value: UInt16, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .single(container)
    }
    
    internal func encode(_ value: UInt32, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .single(container)
    }
    
    internal func encode(_ value: UInt64, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        try container.encode(value)
        
        storage[key.stringValue] = .single(container)
    }
    
    internal func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
        let nextCodingPath = codingPath.appending(key)
        let lowLevelEncoder = URLQueryItemEncoder2.LowLevelEncoder(codingPath: nextCodingPath)
        try value.encode(to: lowLevelEncoder)
        
        guard let nestedStorage = lowLevelEncoder.storage else {
            fatalError("IDK is this possuble?")
        }
        
        storage[key.stringValue] = nestedStorage
    }
    
    internal func encodeNil(forKey key: Key) throws {
        storage[key.stringValue] = nil
    }
    
    internal func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type,
        forKey key: Key
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey: CodingKey {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemEncoder2.StringlyKeyedContainer(codingPath: nextCodingPath)

        storage[key.stringValue] = .keyed(container)
        
        return KeyedEncodingContainer(URLQueryItemEncoder2.KeyedContainer(container))
    }
    
    internal func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemEncoder2.UnkeyedContainer(codingPath: nextCodingPath)
        
        storage[key.stringValue] = .unkeyed(container)
        
        return container
    }
    
    internal func superEncoder() -> Encoder {
        // TODO: Does any of this make sense?
        
        let key = Key(stringValue: "super")
        
        return superEncoder(forKey: key)
    }
    
    internal func superEncoder(forKey key: Key) -> Encoder {
        let nextCodingPath = codingPath.appending(key)
        
        // TODO: Does any of this make sense?
        
        return URLQueryItemEncoder2.LowLevelEncoder(codingPath: nextCodingPath)
    }
}
