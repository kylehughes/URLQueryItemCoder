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
        
        internal init(intermediate: Intermediate, codingPath: [any CodingKey]) {
            self.intermediate = intermediate
            self.codingPath = codingPath
        }
    }
}

// MARK: - KeyedDecodingContainerProtocol Extension

extension URLQueryItemDecoder.KeyedContainer: KeyedDecodingContainerProtocol {
    // MARK: Internal Instance Interface
    
    internal var allKeys: [Key] {
        <#code#>
    }
    
    internal func contains(_ key: Key) -> Bool {
        let nextCodingPath = codingPath.appending(key)
        
        intermediate.contains(nextCodingPath)
    }
    
    internal func decode(_ type: Bool.Type, forKey key: Key) throws -> Bool {
        let nextCodingPath = codingPath.appending(key)
        
        guard let value: Bool = intermediate.decodeLosslessly(nextCodingPath) else {
            /// hmmm but id on't know if the key or value was not found here.
            throw DecodingError.
        }
    }
    
    internal func decode(_ type: String.Type, forKey key: Key) throws -> String {
        <#code#>
    }
    
    internal func decode(_ type: Double.Type, forKey key: Key) throws -> Double {
        <#code#>
    }
    
    internal func decode(_ type: Float.Type, forKey key: Key) throws -> Float {
        <#code#>
    }
    
    internal func decode(_ type: Int.Type, forKey key: Key) throws -> Int {
        <#code#>
    }
    
    internal func decode(_ type: Int8.Type, forKey key: Key) throws -> Int8 {
        <#code#>
    }
    
    internal func decode(_ type: Int16.Type, forKey key: Key) throws -> Int16 {
        <#code#>
    }
    
    internal func decode(_ type: Int32.Type, forKey key: Key) throws -> Int32 {
        <#code#>
    }
    
    internal func decode(_ type: Int64.Type, forKey key: Key) throws -> Int64 {
        <#code#>
    }
    
    internal func decode(_ type: UInt.Type, forKey key: Key) throws -> UInt {
        <#code#>
    }
    
    internal func decode(_ type: UInt8.Type, forKey key: Key) throws -> UInt8 {
        <#code#>
    }
    
    internal func decode(_ type: UInt16.Type, forKey key: Key) throws -> UInt16 {
        <#code#>
    }
    
    internal func decode(_ type: UInt32.Type, forKey key: Key) throws -> UInt32 {
        <#code#>
    }
    
    internal func decode(_ type: UInt64.Type, forKey key: Key) throws -> UInt64 {
        <#code#>
    }
    
    internal func decode<Target>(_ type: Target.Type, forKey key: Key) throws -> Target where Target: Decodable {
        <#code#>
    }
    
    internal func decodeNil(forKey key: Key) throws -> Bool {
        <#code#>
    }
    
    internal func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: Key) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        <#code#>
    }
    
    internal func nestedUnkeyedContainer(forKey key: Key) throws -> UnkeyedDecodingContainer {
        <#code#>
    }
    
    internal func superDecoder() throws -> Decoder {
        <#code#>
    }
    
    internal func superDecoder(forKey key: Key) throws -> Decoder {
        <#code#>
    }
}
