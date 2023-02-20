//
//  URLQueryItemDecoder.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/17/23.
//

import Combine
import Foundation

@_implementationOnly import Common

public struct URLQueryItemDecoder {
    // MARK: Private Instance Interface
    
    private func decode(from queryItems: [URLQueryItem]) -> DecodingContainerType<String> {
        let codingPath: [any CodingKey] = []
        
        guard !queryItems.isEmpty else {
            return .singleValue(at: codingPath)
        }
        
        let multiValueContainer = DecodingContainer<String>(codingPath: codingPath)
        
        for queryItem in queryItems {
            guard
                let keyComponents = queryItem.name.removingPercentEncoding?.components(separatedBy: "."),
                let firstKeyComponent = keyComponents.first,
                !firstKeyComponent.isEmpty
            else {
                // Must be single value because this means there is no key, and to have any other keys would be invalid
                let singleValue = DecodingContainer<String>.SingleValue(codingPath: codingPath)
                singleValue.store(queryItem.value?.removingPercentEncoding)
                
                // Must be single value because this means there is no key, and to have any other keys would be invalid
                
                return .singleValue(singleValue)
            }
            
            // Once we're here we know that we, at the root, have a multiValue container
            
            var currentCodingPath: [String] = []
            var currentMultiValueContainer = multiValueContainer
            
            for (index, key) in zip(keyComponents.indices, keyComponents) {
                currentCodingPath.append(key)
                
                if index == keyComponents.index(before: keyComponents.endIndex) {
                    let singleValue = DecodingContainer<String>.SingleValue(codingPath: currentCodingPath.map(StringCodingKey.init))
                    singleValue.store(queryItem.value?.removingPercentEncoding)
                    
                    currentMultiValueContainer.storage[key] = .singleValue(singleValue)
                } else if let nestedContainer = currentMultiValueContainer.storage[key] {
                    switch nestedContainer {
                    case let .multiValue(existingMultiValueContainer):
                        currentMultiValueContainer = existingMultiValueContainer
                    case .singleValue:
                        fatalError("bad I think")
                    }
                } else {
                    let newMultiValueContainer = DecodingContainer<String>(codingPath: currentCodingPath.map(StringCodingKey.init))
                    currentMultiValueContainer.storage[key] = .multiValue(newMultiValueContainer)
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
    
    public func decode<Value>(_ type: Value.Type, from: [URLQueryItem]) throws -> Value where Value: Decodable {
        let lowLevelDecoder = LowLevelDecoder(container: decode(from: from))
        
        return try Value(from: lowLevelDecoder)
    }
}
