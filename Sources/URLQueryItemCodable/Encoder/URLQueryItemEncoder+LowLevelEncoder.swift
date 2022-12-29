//
//  URLQueryItemEncoder+LowLevelEncoder.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 12/27/22.
//

import Foundation

extension URLQueryItemEncoder {
    internal struct LowLevelEncoder {
        internal let userInfo: [CodingUserInfoKey: Any]
        
        internal private(set) var codingPath: [any CodingKey]
        
        private let partial: Partial
        
        // MARK: Internal Initialization
        
        internal init(partial: Partial, codingPath: [any CodingKey]) {
            self.partial = partial
            self.codingPath = codingPath
            
            userInfo = [:]
        }
    }
}

// MARK: - Encoder Extension

extension URLQueryItemEncoder.LowLevelEncoder: Encoder {
    // MARK: Internal Instance Interface
    
    internal func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key: CodingKey {
        let container = URLQueryItemEncoder.KeyedContainer<Key>(partial: partial, codingPath: codingPath)
        
        return KeyedEncodingContainer(container)
    }
    
    internal func singleValueContainer() -> SingleValueEncodingContainer {
        URLQueryItemEncoder.SingleValueContainer(partial: partial, codingPath: codingPath)
    }
    
    internal func unkeyedContainer() -> UnkeyedEncodingContainer {
        URLQueryItemEncoder.UnkeyedContainer(partial: partial, codingPath: codingPath)
    }
}
