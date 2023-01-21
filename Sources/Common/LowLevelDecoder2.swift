//
//  LowLevelDecoder.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/19/23.
//

public final class LowLevelDecoder2<PrimitiveValue> where PrimitiveValue: DecodingPrimitiveValue {
    public let userInfo: [CodingUserInfoKey: Any]
    
    public private(set) var container: DecodingContainer<PrimitiveValue>
    
    // MARK: Internal Initialization
    
    // TODO: do i need to scope this or something?
    
    public init(container: DecodingContainer<PrimitiveValue>) {
        self.container = container
        
        userInfo = [:]
    }
}

// MARK: - Decoder Extension

extension LowLevelDecoder2: Decoder {
    // MARK: Internal Instance Interface
    
    public var codingPath: [any CodingKey] {
        container.codingPath
    }
    
    public func container<Key>(keyedBy type: Key.Type) -> KeyedDecodingContainer<Key> where Key: CodingKey {
        KeyedDecodingContainer(container.wrapped())
    }
    
    public func singleValueContainer() -> SingleValueDecodingContainer {
        container
    }
    
    public func unkeyedContainer() -> UnkeyedDecodingContainer {
        container
    }
}
