//
//  LowLevelEncoder.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/15/23.
//

public final class LowLevelEncoder {
    public let userInfo: [CodingUserInfoKey: Any]
    
    public private(set) var codingPath: [any CodingKey]
    public private(set) var storage: Container?
    
    // MARK: Internal Initialization
    
    public init(codingPath: [any CodingKey]) {
        self.codingPath = codingPath
        
        storage = nil
        userInfo = [:]
    }
}

// MARK: - Encoder Extension

extension LowLevelEncoder: Encoder {
    // MARK: Internal Instance Interface
    
    public func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key: CodingKey {
        precondition(storage == nil)
        
        let container = Container.Keyed(codingPath: codingPath)
        
        storage = .keyed(container)
        
        return KeyedEncodingContainer(container.wrapped())
    }
    
    public func singleValueContainer() -> SingleValueEncodingContainer {
        precondition(storage == nil)
        
        let container = Container.SingleValue(codingPath: codingPath)
        
        storage = .singleValue(container)
        
        return container
    }
    
    public func unkeyedContainer() -> UnkeyedEncodingContainer {
        precondition(storage == nil)
        
        let container = Container.Unkeyed(codingPath: codingPath)
        
        storage = .unkeyed(container)
        
        return container
    }
}
