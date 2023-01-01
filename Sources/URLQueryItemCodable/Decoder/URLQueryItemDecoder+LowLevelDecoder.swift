//
//  URLQueryItemDecoder+LowLevelDecoder.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 12/30/22.
//

import Foundation

extension URLQueryItemDecoder {
    internal struct LowLevelDecoder {
        internal let userInfo: [CodingUserInfoKey: Any]
        
        internal private(set) var codingPath: [any CodingKey]
        
        private let intermediate: Intermediate
        
        // MARK: Internal Initialization
        
        internal init(intermediate: Intermediate, codingPath: [any CodingKey]) {
            self.intermediate = intermediate
            self.codingPath = codingPath
            
            userInfo = [:]
        }
    }
}

// MARK: - Encoder Extension

extension URLQueryItemDecoder.LowLevelDecoder: Decoder {
    // MARK: Internal Instance Interface

    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        let container = URLQueryItemDecoder.KeyedContainer<Key>(intermediate: intermediate, codingPath: codingPath)
        
        return KeyedDecodingContainer(container)
    }
    
    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        <#code#>
    }
    
    func singleValueContainer() throws -> SingleValueDecodingContainer {
        URLQueryItemDecoder.SingleValueContainer(intermediate: intermediate, codingPath: codingPath)
    }
}
