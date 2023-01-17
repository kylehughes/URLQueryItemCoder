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
    // TODO: map [URLQueryItem] to the `Container<PrimitiveValue.Unknown>` tree structure
}

// MARK: - TopLevelDecoder Extension

extension URLQueryItemDecoder2: TopLevelDecoder {
    // MARK: Public Instance Interface
    
    public func decode<Value>(_ type: Value.Type, from: [URLQueryItem]) throws -> Value where Value: Decodable {
        // TODO: convert URLQueryItem to the `Container` storage definition and give it to LowLevelDecoder through initializer
        
        let lowLevelDecoder = LowLevelDecoder(codingPath: [])
        
        return try Value(from: lowLevelDecoder)
    }
}
