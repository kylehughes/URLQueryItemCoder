//
//  URLQueryItemDecoder.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/17/23.
//

import Combine
import Foundation

@_implementationOnly import Common

public struct URLQueryItemDecoder2 {
    // TODO: map [URLQueryItem] to the `DecodingContainer<String>` tree structure
    private func decode(from queryItems: [URLQueryItem]) -> DecodingContainer<String> {
        let container = DecodingContainer<String>(codingPath: [])
        
        for queryItem in queryItems {
            let keys = queryItem.name.split(separator: ".").map(String.init)
            
            guard let value = queryItem.value, let firstKey = keys.first else {
                continue
            }
            
            decode(key: firstKey, precededBy: [], followedBy: Array(keys.dropFirst()), as: value, in: container)
        }
        
        return container
    }
    
    // I think the problem now is might be that this representation puts the uarray values right in the unkeyed container
    // whereas my decoder logic might be looking for it in a nested single value container. so here, that's a containre with a storage of [0] = value
    
    
    private func decode(
        key: String,
        precededBy codingPath: [String],
        followedBy futureCodingPath: [String],
        as primitiveValue: String,
        in parent: DecodingContainer<String>
    ) {
        guard let nextKey = futureCodingPath.first else {
            parent.storage[key] = .primitiveValue(primitiveValue)
            
            return
        }
        
        let container: DecodingContainer<String> = {
            guard let existing = parent.storage[key] else {
                let new = DecodingContainer<String>(codingPath: codingPath.appending(key).map(StringCodingKey.init))
                parent.storage[key] = .container(new)
                
                return new
            }
            
            switch existing {
            case let .container(container):
                return container
            case .primitiveValue:
                fatalError("TODO")
            }
        }()
        
        decode(
            key: nextKey,
            precededBy: codingPath.appending(key),
            followedBy: Array(futureCodingPath.dropFirst()),
            as: primitiveValue,
            in: container
        )
    }
}

// MARK: - TopLevelDecoder Extension

extension URLQueryItemDecoder2: TopLevelDecoder {
    // MARK: Public Instance Interface
    
    public func decode<Value>(_ type: Value.Type, from: [URLQueryItem]) throws -> Value where Value: Decodable {
        let lowLevelDecoder = LowLevelDecoder2(container: decode(from: from))
        
        return try Value(from: lowLevelDecoder)
    }
}
