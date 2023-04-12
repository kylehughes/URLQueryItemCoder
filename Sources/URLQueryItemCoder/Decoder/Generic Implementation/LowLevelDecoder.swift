//
//  LowLevelDecoder.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/19/23.
//

import Foundation

internal final class LowLevelDecoder<PrimitiveValue> where PrimitiveValue: DecodingPrimitiveValue {
    internal let container: DecodingContainer<PrimitiveValue>
    internal let userInfo: [CodingUserInfoKey: Any]
    
    // MARK: Internal Initialization
    
    internal init(container: DecodingContainer<PrimitiveValue>) {
        self.container = container
        
        userInfo = [:]
    }
    
    // MARK: Internal Instance Interface
    
    func decodeWithSpecialTreatment<Target>(as target: Target.Type) throws -> Target where Target: Decodable {
        switch target {
        case is Data.Type:
            return try container.configuration.dataStrategy.decode(insideOf: self) as! Target
        case is Date.Type:
            return try container.configuration.dateStrategy.decode(insideOf: self) as! Target
        default:
            return try Target(from: self)
        }
    }
}

// MARK: - Decoder Extension

extension LowLevelDecoder: Decoder {
    // MARK: Internal Instance Interface
    
    @inlinable
    internal var codingPath: [any CodingKey] {
        switch container {
        case let .multiValue(multiValueContainer):
            return multiValueContainer.codingPath
        case let .singleValue(singleValueContainer):
            return singleValueContainer.codingPath
        }
    }
    
    @inlinable
    internal func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key: CodingKey {
        switch container {
        case let .multiValue(multiValueContainer):
            return KeyedDecodingContainer(multiValueContainer.wrapped())
        case let .singleValue(singleValueContainer):
            return KeyedDecodingContainer(singleValueContainer.wrapped())
        }
    }
    
    @inlinable
    internal func singleValueContainer() throws -> SingleValueDecodingContainer {
        switch container {
        case let .multiValue(multiValueContainer):
            return multiValueContainer
        case let .singleValue(singleValueContainer):
            return singleValueContainer
        }
    }
    
    @inlinable
    internal func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        switch container {
        case let .multiValue(multiValueContainer):
            return multiValueContainer
        case let .singleValue(singleValueContainer):
            return singleValueContainer
        }
    }
}
