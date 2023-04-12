//
//  DecodingContainer.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/19/23.
//

import Foundation

internal enum DecodingContainer<PrimitiveValue> where PrimitiveValue: DecodingPrimitiveValue {
    case multiValue(MultiValue)
    case singleValue(SingleValue)
    
    // MARK: Internal Static Interface
    
    @inlinable
    internal static func empty(
        at codingPath: [any CodingKey],
        using configuration: DecodingStrategies
    ) -> Self {
        .multiValue(at: codingPath, using: configuration)
    }
    
    @inlinable
    internal static func multiValue(
        at codingPath: [any CodingKey],
        using configuration: DecodingStrategies
    ) -> Self {
        .multiValue(MultiValue(codingPath: codingPath, configuration: configuration))
    }
    
    @inlinable
    internal static func singleValue(
        at codingPath: [any CodingKey],
        using configuration: DecodingStrategies
    ) -> Self {
        .singleValue(SingleValue(codingPath: codingPath, configuration: configuration))
    }
    
    // MARK: Internal Instance Interface
    
    internal var configuration: DecodingStrategies {
        switch self {
        case let .multiValue(multiValueContainer):
            return multiValueContainer.configuration
        case let .singleValue(singleValueContainer):
            return singleValueContainer.configuration
        }
    }
    
    internal func expectedSingleValueContainer(at codingPath: [any CodingKey]) throws -> SingleValue {
        switch self {
        case .multiValue:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath,
                    debugDescription: "Expected date to be encoded as a single value conatiner."
                )
            )
        case let .singleValue(singleValueContainer):
            return singleValueContainer
        }
    }
}
