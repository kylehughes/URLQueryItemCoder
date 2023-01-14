//
//  URLQueryItemDecoder+LowLevelDecoder.swift
//  URLQueryItemDecodable
//
//  Created by Kyle Hughes on 12/30/22.
//

import Foundation

@_implementationOnly import Common

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

    internal func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        KeyedDecodingContainer(
            URLQueryItemDecoder.KeyedContainer<Key>(from: intermediate, scopedTo: codingPath)
        )
    }
    
    internal func singleValueContainer() throws -> SingleValueDecodingContainer {
        URLQueryItemDecoder.SingleValueContainer(from: intermediate, scopedTo: codingPath)
    }
    
    internal func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        URLQueryItemDecoder.UnkeyedContainer(from: intermediate, scopedTo: codingPath)
    }
}
