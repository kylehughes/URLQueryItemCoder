//
//  LowLevelDecoder.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/19/23.
//

public final class LowLevelDecoder<PrimitiveValue> where PrimitiveValue: DecodingPrimitiveValue {
    public let userInfo: [CodingUserInfoKey: Any]
    
    private let container: DecodingContainer<PrimitiveValue>
    
    // MARK: Public Initialization
    
    public init(container: DecodingContainer<PrimitiveValue>) {
        self.container = container
        
        userInfo = [:]
    }
}

// MARK: - Decoder Extension

extension LowLevelDecoder: Decoder {
    // MARK: Internal Instance Interface
    
    public var codingPath: [any CodingKey] {
        switch container {
        case let .empty(container):
            return container.codingPath
        case let .multiValue(container):
            return container.codingPath
        case let .singleValue(container):
            return container.codingPath
        }
    }
    
    public func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key: CodingKey {
        switch container {
        case let .empty(container):
            return KeyedDecodingContainer(container.wrapped())
        case let .multiValue(container):
            return KeyedDecodingContainer(container.wrapped())
        case .singleValue:
            throw DecodingError.typeMismatch(KeyedDecodingContainer<Key>.self, .obvious(codingPath))
        }
    }
    
    public func singleValueContainer() throws -> SingleValueDecodingContainer {
        switch container {
        case let .empty(container):
            return container
        case .multiValue:
            throw DecodingError.typeMismatch(SingleValueDecodingContainer.self, .obvious(codingPath))
        case let .singleValue(container):
            return container
        }
    }
    
    public func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        switch container {
        case let .empty(container):
            return container
        case let .multiValue(container):
            return container
        case .singleValue:
            throw DecodingError.typeMismatch(UnkeyedDecodingContainer.self, .obvious(codingPath))
        }
    }
}
