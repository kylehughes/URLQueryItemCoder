//
//  URLQueryItemEncoder2+LowLevelEncoder.swift
//  URLQueryItemEncoder
//
//  Created by Kyle Hughes on 1/15/23.
//

@_implementationOnly import Common

extension URLQueryItemEncoder2 {
    internal final class LowLevelEncoder {
        internal let userInfo: [CodingUserInfoKey: Any]
        
        internal private(set) var codingPath: [any CodingKey]
        internal private(set) var storage: () -> ContainerStorage?
        
        // MARK: Internal Initialization
        
        internal init(codingPath: [any CodingKey]) {
            self.codingPath = codingPath
            
            storage = { nil }
            userInfo = [:]
        }
    }
}

// MARK: - Encoder Extension

extension URLQueryItemEncoder2.LowLevelEncoder: Encoder {
    // MARK: Internal Instance Interface
    
    internal func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key: CodingKey {
        precondition(storage() == nil)
        
        return KeyedEncodingContainer(
            
        )
    }
    
    internal func singleValueContainer() -> SingleValueEncodingContainer {
        precondition(storage() == nil)
        
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: codingPath)
        
        storage = {
            .singleValue(container.storage)
        }
        
        return container
    }
    
    internal func unkeyedContainer() -> UnkeyedEncodingContainer {
        precondition(storage == nil)
        
        
    }
}

