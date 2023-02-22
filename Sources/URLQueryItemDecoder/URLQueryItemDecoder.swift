//
//  URLQueryItemDecoder.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/17/23.
//

import Combine
import Common
import Foundation

public struct URLQueryItemDecoder {
    // MARK: Private Instance Interface
    
    private func decode(from queryItems: [URLQueryItem]) -> DecodingContainer<String> {
        let codingPath: [StringCodingKey] = []
        
        guard !queryItems.isEmpty else {
            return .singleValue(at: codingPath)
        }
        
        let multiValueContainer = DecodingContainer<String>.MultiValue(codingPath: codingPath)
        
        for queryItem in queryItems {
            guard
                let keyComponents = queryItem.name.removingPercentEncoding?.components(separatedBy: "."),
                let firstKeyComponent = keyComponents.first,
                !firstKeyComponent.isEmpty
            else {
                // Must be single value because this means there is no key, and to have any other keys would be invalid
                let singleValue = DecodingContainer<String>.SingleValue(codingPath: codingPath)
                singleValue.store(queryItem.value?.removingPercentEncoding)
                
                return .singleValue(singleValue)
            }
            
            // Once we're here we know that we, at the root, have a multiValue container
            
            let lastKeyComponentIndex = keyComponents.index(before: keyComponents.endIndex)
            
            var currentCodingPath = codingPath
            var currentMultiValueContainer = multiValueContainer
            
            for index in keyComponents.indices {
                let keyComponent = keyComponents[index]
                
                let codingKey = StringCodingKey(stringValue: keyComponent)
                currentCodingPath.append(codingKey)
                
                if index == lastKeyComponentIndex {
                    let singleValueContainer = DecodingContainer<String>.SingleValue(codingPath: currentCodingPath)
                    singleValueContainer.store(queryItem.value?.removingPercentEncoding)
                    currentMultiValueContainer.storage[keyComponent] = .singleValue(singleValueContainer)
                } else if let nestedContainer = currentMultiValueContainer.storage[keyComponent] {
                    switch nestedContainer {
                    case let .multiValue(existingMultiValueContainer):
                        currentMultiValueContainer = existingMultiValueContainer
                    case .singleValue:
                        fatalError("bad I think")
                    }
                } else {
                    let newMultiValueContainer = DecodingContainer<String>.MultiValue(codingPath: currentCodingPath)
                    currentMultiValueContainer.storage[keyComponent] = .multiValue(newMultiValueContainer)
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
        let container = decode(from: from)
        let lowLevelDecoder = LowLevelDecoder(container: container)
        
        return try Value(from: lowLevelDecoder)
    }
}
