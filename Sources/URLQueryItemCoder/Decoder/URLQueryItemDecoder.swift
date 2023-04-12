//
//  URLQueryItemDecoder.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/17/23.
//

import Combine
import Foundation

/// An object that decodes instances of a data type from `URLQueryItem` name-value pairs.
public struct URLQueryItemDecoder {
    /// The strategies used by this decoder for decoding `Decodable` values.
    public var strategies: DecodingStrategies
    
    // MARK: Public Initialization
    
    /// Creates a new, reusable `URLQueryItem` decoder.
    ///
    /// The default decoding strategies are used if none are supplied.
    ///
    /// - Parameter dataStrategy: The strategy to use for decoding `Data` values.
    /// - Parameter dateStrategy: The strategy to use for decoding `Date` values.
    /// - Parameter keyStrategy: The strategy to use for decoding keys on keyed containers.
    /// - Parameter nonConformingFloatStrategy: The strategy to use for non-`URLQueryItem`-conforming floating-point
    ///   values (IEEE 754 infinity and NaN).
    /// - Returns: A new, reusable `URLQueryItem` decoder.
    @inlinable
    public init(
        dataStrategy: DataDecodingStrategy = .default,
        dateStrategy: DateDecodingStrategy = .default,
        keyStrategy: KeyDecodingStrategy = .default,
        nonConformingFloatStrategy: NonConformingFloatDecodingStrategy = .default
    ) {
        self.init(
            strategies: DecodingStrategies(
                dataStrategy: dataStrategy,
                dateStrategy: dateStrategy,
                keyStrategy: keyStrategy,
                nonConformingFloatStrategy: nonConformingFloatStrategy
            )
        )
    }
    
    /// Creates a new, reusable `URLQueryItem` decoder..
    ///
    /// - Parameter strategies: The strategies for this decoder to use.
    /// - Returns: A new, reusable `URLQueryItem` decoder.
    public init(strategies: DecodingStrategies) {
        self.strategies = strategies
    }
    
    // MARK: Private Instance Interface
    
    private func decodeToIntermediateRepresentation(
        from queryItems: [URLQueryItem]
    ) throws -> DecodingContainer<String> {
        let codingPath: [StringCodingKey] = []
        
        guard let firstQueryItem = queryItems.first else {
            return .empty(at: codingPath, using: strategies)
        }
        
        guard
            let firstQueryItemKeyComponents = firstQueryItem.name.removingPercentEncoding?.components(separatedBy: "."),
            let firstQueryItemFirstKeyComponents = firstQueryItemKeyComponents.first,
            !firstQueryItemFirstKeyComponents.isEmpty
        else {
            let singleValueContainer = DecodingContainer<String>.SingleValue(
                codingPath: codingPath,
                configuration: strategies
            )
            singleValueContainer.store(firstQueryItem.value?.removingPercentEncoding)
            
            return .singleValue(singleValueContainer)
        }
        
        let multiValueContainer = DecodingContainer<String>.MultiValue(
            codingPath: codingPath,
            configuration: strategies
        )
        
        for queryItem in queryItems {
            guard let keyComponents = queryItem.name.removingPercentEncoding?.components(separatedBy: ".") else {
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: codingPath,
                        debugDescription:
                            "Cannot have an empty key in a keyed container with multiple keys. " +
                            "Impossible to infer appropriate structure for decoded type."
                    )
                )
            }

            let lastKeyComponentIndex = keyComponents.index(before: keyComponents.endIndex)
            
            var currentCodingPath = codingPath
            var currentMultiValueContainer = multiValueContainer
            
            for index in keyComponents.indices {
                let keyComponent = keyComponents[index]
                
                let codingKey = StringCodingKey(stringValue: keyComponent)
                currentCodingPath.append(codingKey)
                
                if index == lastKeyComponentIndex {
                    let singleValueContainer = DecodingContainer<String>.SingleValue(
                        codingPath: currentCodingPath,
                        configuration: strategies
                    )
                    singleValueContainer.store(queryItem.value?.removingPercentEncoding)
                    currentMultiValueContainer.set(keyComponent, to: .singleValue(singleValueContainer))
                } else if let childContainer = currentMultiValueContainer.children[keyComponent] {
                    switch childContainer {
                    case let .multiValue(existingMultiValueContainer):
                        currentMultiValueContainer = existingMultiValueContainer
                    case .singleValue:
                        throw DecodingError.dataCorrupted(
                            DecodingError.Context(
                                codingPath: currentCodingPath,
                                debugDescription:
                                    "Single value container has to be the last key in a path. " +
                                    "It does not support child keys."
                            )
                        )
                    }
                } else {
                    let newMultiValueContainer = DecodingContainer<String>.MultiValue(
                        codingPath: currentCodingPath,
                        configuration: strategies
                    )
                    currentMultiValueContainer.set(keyComponent, to: .multiValue(newMultiValueContainer))
                    currentMultiValueContainer = newMultiValueContainer
                }
            }
        }
        
        return .multiValue(multiValueContainer)
    }
}

// MARK: - TopLevelDecoder Extension

extension URLQueryItemDecoder: TopLevelDecoder {
    // MARK: Public Instance Interface
    
    /// Decodes an instance of the indicated type.
    ///
    /// - Parameter type: The type to decode the query items into.
    /// - Parameter queryItems: The query items to decode the type from.
    /// - Returns: The instance of the given `Type` represented by the given query items.
    public func decode<Value>(
        _ type: Value.Type,
        from queryItems: [URLQueryItem]
    ) throws -> Value where Value: Decodable {
        let container = try decodeToIntermediateRepresentation(from: queryItems)
        let lowLevelDecoder = LowLevelDecoder(container: container)
        
        return try lowLevelDecoder.decodeWithSpecialTreatment(as: type)
    }
}
