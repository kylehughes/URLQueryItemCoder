//
//  URLQueryItemEncoder+KeyedContainer.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 12/27/22.
//

import Foundation

extension URLQueryItemEncoder {
    internal struct KeyedContainer<Key> where Key: CodingKey {
        internal private(set) var codingPath: [any CodingKey]
        
        private let partial: Partial
        
        // MARK: Internal Initialization
        
        internal init(partial: Partial, codingPath: [any CodingKey]) {
            self.partial = partial
            self.codingPath = codingPath
        }
    }
}

// MARK: - KeyedEncodingContainerProtocol Extension

extension URLQueryItemEncoder.KeyedContainer: KeyedEncodingContainerProtocol {
    // MARK: Public Instance Interface
    
    mutating public func encode(_ value: Bool, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: String, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, as: value)
    }
    
    mutating public func encode(_ value: Double, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Float, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Int, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Int8, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Int16, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Int32, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Int64, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: UInt, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: UInt8, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: UInt16, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: UInt32, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: UInt64, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
        let nextCodingPath = codingPath.appending(key)
        let lowLevelEncoder = URLQueryItemEncoder.LowLevelEncoder(partial: partial, codingPath: nextCodingPath)
        
        try value.encode(to: lowLevelEncoder)
    }
    
    mutating public func encodeNil(forKey key: Key) throws {
        partial.encode(codingPath.appending(key), as: nil)
    }
    
    mutating public func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type,
        forKey key: Key
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey: CodingKey {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemEncoder.KeyedContainer<NestedKey>(partial: partial, codingPath: nextCodingPath)
        
        return KeyedEncodingContainer(container)
    }
    
    mutating public func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        let nextCodingPath = codingPath.appending(key)
        
        return URLQueryItemEncoder.UnkeyedContainer(partial: partial, codingPath: nextCodingPath)
    }
    
    mutating public func superEncoder() -> Encoder {
        let key = Key(stringValue: "super")!
        
        return superEncoder(forKey: key)
    }
    
    mutating public func superEncoder(forKey key: Key) -> Encoder {
        let nextCodingPath = codingPath.appending(key)
        
        return URLQueryItemEncoder.LowLevelEncoder(partial: partial, codingPath: nextCodingPath)
    }
}
