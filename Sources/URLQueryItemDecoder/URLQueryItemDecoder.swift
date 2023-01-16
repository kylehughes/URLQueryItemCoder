//
//  URLQueryItemDecoder.swift
//  URLQueryItemDecodable
//
//  Created by Kyle Hughes on 12/30/22.
//

import Combine
import Foundation

@_implementationOnly import Common

public struct URLQueryItemDecoder {
    // NO-OP
}

// MARK: - TopLevelDecoder Extension

extension URLQueryItemDecoder: TopLevelDecoder {
    // MARK: Public Instance Interface
    
    public func decode<Value>(_ type: Value.Type, from: [URLQueryItem]) throws -> Value where Value: Decodable {
        let intermediate = Intermediate(from: from)
        let lowLevelDecoder = LowLevelDecoder(intermediate: intermediate, codingPath: [])
        
        return try Value(from: lowLevelDecoder)
    }
}