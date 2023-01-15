//
//  URLQueryItemEncoder+LowLevelEncoder.swift
//  URLQueryItemEncodable
//
//  Created by Kyle Hughes on 12/27/22.
//

import Foundation

@_implementationOnly import Common

extension URLQueryItemEncoder {
    internal struct LowLevelEncoder {
        internal let userInfo: [CodingUserInfoKey: Any]
        
        internal private(set) var codingPath: [any CodingKey]
        
        private let intermediate: any ReferenceContainerProtocol
        
        // MARK: Internal Initialization
        
        internal init(intermediate: any ReferenceContainerProtocol, codingPath: [any CodingKey]) {
            self.intermediate = intermediate
            self.codingPath = codingPath
            
            userInfo = [:]
        }
    }
}

// MARK: - Encoder Extension

extension URLQueryItemEncoder.LowLevelEncoder: Encoder {
    // MARK: Internal Instance Interface
    
    internal func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key: CodingKey {
        KeyedEncodingContainer(
            URLQueryItemEncoder.KeyedContainer<Key>(intermediate: intermediate, codingPath: codingPath)
        )
    }
    
    internal func singleValueContainer() -> SingleValueEncodingContainer {
        URLQueryItemEncoder.SingleValueContainer(intermediate: intermediate, codingPath: codingPath)
    }
    
    internal func unkeyedContainer() -> UnkeyedEncodingContainer {
        URLQueryItemEncoder.UnkeyedContainer(intermediate: intermediate, codingPath: codingPath)
    }
}
