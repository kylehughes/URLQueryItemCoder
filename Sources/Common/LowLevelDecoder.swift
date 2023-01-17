//
//  LowLevelDecoder.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/15/23.
//

// TODO: I just have no clue what role this should play and what it needs. Theoretically it should be injected with
// `storage` but HOW?

public final class LowLevelDecoder {
    public let userInfo: [CodingUserInfoKey: Any]
    
    public private(set) var codingPath: [any CodingKey]
    public private(set) var storage: Container<PrimitiveValue.Unknown>?
    
    // MARK: Internal Initialization
    
    public init(codingPath: [any CodingKey]) {
        self.codingPath = codingPath
        
        storage = nil
        userInfo = [:]
    }
}

// MARK: - Decoder Extension

extension LowLevelDecoder: Decoder {
    // MARK: Internal Instance Interface
    
    public func container<Key>(keyedBy type: Key.Type) -> KeyedDecodingContainer<Key> where Key: CodingKey {
        precondition(storage == nil)
        
        let container = Container<PrimitiveValue.Unknown>.Keyed(codingPath: codingPath)
        
        storage = .keyed(container)
        
        return KeyedDecodingContainer(container.wrapped())
    }
    
    public func singleValueContainer() -> SingleValueDecodingContainer {
        precondition(storage == nil)
        
        let container = Container<PrimitiveValue.Unknown>.SingleValue(codingPath: codingPath)
        
        storage = .singleValue(container)
        
        return container
    }
    
    public func unkeyedContainer() -> UnkeyedDecodingContainer {
        precondition(storage == nil)
        
        let container = Container<PrimitiveValue.Unknown>.Unkeyed(codingPath: codingPath)
        
        storage = .unkeyed(container)
        
        return container
    }
}
