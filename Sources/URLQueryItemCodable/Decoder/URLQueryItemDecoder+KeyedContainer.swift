//
//  URLQueryItemDecoder+KeyedContainer.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 12/30/22.
//

import Foundation

extension URLQueryItemDecoder {
    internal struct KeyedContainer<Key> where Key: CodingKey {
        internal private(set) var codingPath: [any CodingKey]
        
        private let intermediate: Intermediate
        
        // MARK: Internal Initialization
        
        internal init(from source: Intermediate, scopedTo codingPath: [any CodingKey]) {
            self.codingPath = codingPath
            
            intermediate = source.scoped(to: codingPath)
        }
    }
}

// MARK: - KeyedDecodingContainerProtocol Extension

extension URLQueryItemDecoder.KeyedContainer: KeyedDecodingContainerProtocol {
    // MARK: Internal Instance Interface
    
    internal var allKeys: [Key] {
        intermediate.allStringKeys.compactMap { Key(stringValue: $0) }
    }
    
    internal func contains(_ key: Key) -> Bool {
        let nextCodingPath = codingPath.appending(key)
        
        return intermediate.contains(nextCodingPath)
    }
    
    internal func decode(_ type: Bool.Type, forKey key: Key) throws -> Bool {
        let nextCodingPath = codingPath.appending(key)
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal func decode(_ type: Double.Type, forKey key: Key) throws -> Double {
        let nextCodingPath = codingPath.appending(key)
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal func decode(_ type: Float.Type, forKey key: Key) throws -> Float {
        let nextCodingPath = codingPath.appending(key)
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal func decode(_ type: Int.Type, forKey key: Key) throws -> Int {
        let nextCodingPath = codingPath.appending(key)
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal func decode(_ type: Int8.Type, forKey key: Key) throws -> Int8 {
        let nextCodingPath = codingPath.appending(key)
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal func decode(_ type: Int16.Type, forKey key: Key) throws -> Int16 {
        let nextCodingPath = codingPath.appending(key)
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal func decode(_ type: Int32.Type, forKey key: Key) throws -> Int32 {
        let nextCodingPath = codingPath.appending(key)
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal func decode(_ type: Int64.Type, forKey key: Key) throws -> Int64 {
        let nextCodingPath = codingPath.appending(key)
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal func decode(_ type: String.Type, forKey key: Key) throws -> String {
        let nextCodingPath = codingPath.appending(key)
        
        return try intermediate.decode(nextCodingPath)
    }
    
    internal func decode(_ type: UInt.Type, forKey key: Key) throws -> UInt {
        let nextCodingPath = codingPath.appending(key)
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal func decode(_ type: UInt8.Type, forKey key: Key) throws -> UInt8 {
        let nextCodingPath = codingPath.appending(key)
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal func decode(_ type: UInt16.Type, forKey key: Key) throws -> UInt16 {
        let nextCodingPath = codingPath.appending(key)
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal func decode(_ type: UInt32.Type, forKey key: Key) throws -> UInt32 {
        let nextCodingPath = codingPath.appending(key)
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal func decode(_ type: UInt64.Type, forKey key: Key) throws -> UInt64 {
        let nextCodingPath = codingPath.appending(key)
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal func decode<Target>(_ type: Target.Type, forKey key: Key) throws -> Target where Target: Decodable {
        let nextCodingPath = codingPath.appending(key)
        let lowLevelDecoder = URLQueryItemDecoder.LowLevelDecoder(
            intermediate: intermediate,
            codingPath: nextCodingPath
        )
        
        return try Target(from: lowLevelDecoder)
    }
    
    internal func decodeNil(forKey key: Key) throws -> Bool {
        let nextCodingPath = codingPath.appending(key)
        
        return intermediate.isNil(for: nextCodingPath)
    }
    
    internal func nestedContainer<NestedKey>(
        keyedBy type: NestedKey.Type,
        forKey key: Key
    ) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemDecoder.KeyedContainer<NestedKey>(from: intermediate, scopedTo: nextCodingPath)
        
        return KeyedDecodingContainer(container)
    }
    
    internal func nestedUnkeyedContainer(forKey key: Key) throws -> UnkeyedDecodingContainer {
        let nextCodingPath = codingPath.appending(key)
        
        return URLQueryItemDecoder.UnkeyedContainer(from: intermediate, scopedTo: nextCodingPath)
    }
    
    internal func superDecoder() throws -> Decoder {
        guard let superKey = Key(stringValue: "super") else {
            throw DecodingError.dataCorrupted(
                DecodingError.Context(codingPath: codingPath, debugDescription: "Couldn't create super key.")
            )
        }
        
        return try superDecoder(forKey: superKey)
    }
    
    internal func superDecoder(forKey key: Key) throws -> Decoder {
        let nextCodingPath = codingPath.appending(key)
        
        return URLQueryItemDecoder.LowLevelDecoder(intermediate: intermediate, codingPath: nextCodingPath)
    }
}
