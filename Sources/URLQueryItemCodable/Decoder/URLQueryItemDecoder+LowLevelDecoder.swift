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
        
        // MARK: Internal Initialization
        
        internal init(codingPath: [any CodingKey]) {
            self.codingPath = codingPath
            
            userInfo = [:]
        }
    }
}

// MARK: - Encoder Extension

extension URLQueryItemDecoder.LowLevelDecoder: Decoder {
    // MARK: Internal Instance Interface

    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        <#code#>
    }
    
    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        <#code#>
    }
    
    func singleValueContainer() throws -> SingleValueDecodingContainer {
        URLQueryItemDecoder.SingleValueContainer(source:, codingPath: codingPath)
    }
}
