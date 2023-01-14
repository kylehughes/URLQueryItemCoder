//
//  URLQueryItemEncoder+KeyedContainer.swift
//  URLQueryItemEncodable
//
//  Created by Kyle Hughes on 12/27/22.
//

import Foundation

@_implementationOnly import Common

extension URLQueryItemEncoder {
    internal struct KeyedContainer<Key> where Key: CodingKey {
        internal private(set) var codingPath: [any CodingKey]
        
        private let intermediate: Intermediate
        
        // MARK: Internal Initialization
        
        internal init(intermediate: Intermediate, codingPath: [any CodingKey]) {
            self.intermediate = intermediate
            self.codingPath = codingPath
        }
    }
}

// MARK: - KeyedEncodingContainerProtocol Extension

extension URLQueryItemEncoder.KeyedContainer: KeyedEncodingContainerProtocol {
    // MARK: Internal Instance Interface
    
    internal mutating func encode(_ value: Bool, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    internal mutating func encode(_ value: String, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        intermediate.encode(nextCodingPath, as: value)
    }
    
    internal mutating func encode(_ value: Double, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    internal mutating func encode(_ value: Float, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    internal mutating func encode(_ value: Int, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    internal mutating func encode(_ value: Int8, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    internal mutating func encode(_ value: Int16, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    internal mutating func encode(_ value: Int32, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    internal mutating func encode(_ value: Int64, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    internal mutating func encode(_ value: UInt, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    internal mutating func encode(_ value: UInt8, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    internal mutating func encode(_ value: UInt16, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    internal mutating func encode(_ value: UInt32, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    internal mutating func encode(_ value: UInt64, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    internal mutating func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
        let nextCodingPath = codingPath.appending(key)
        let lowLevelEncoder = URLQueryItemEncoder.LowLevelEncoder(
            intermediate: intermediate,
            codingPath: nextCodingPath
        )
        
        try value.encode(to: lowLevelEncoder)
    }
    
    internal mutating func encodeNil(forKey key: Key) throws {
        intermediate.encode(codingPath.appending(key), as: nil)
    }
    
    internal mutating func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type,
        forKey key: Key
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey: CodingKey {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemEncoder.KeyedContainer<NestedKey>(
            intermediate: intermediate,
            codingPath: nextCodingPath
        )
        
        return KeyedEncodingContainer(container)
    }
    
    internal mutating func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        let nextCodingPath = codingPath.appending(key)
        
        return URLQueryItemEncoder.UnkeyedContainer(intermediate: intermediate, codingPath: nextCodingPath)
    }
    
    internal mutating func superEncoder() -> Encoder {
        let key = Key(stringValue: "super")!
        
        return superEncoder(forKey: key)
    }
    
    internal mutating func superEncoder(forKey key: Key) -> Encoder {
        let nextCodingPath = codingPath.appending(key)
        
        return URLQueryItemEncoder.LowLevelEncoder(intermediate: intermediate, codingPath: nextCodingPath)
    }
}
