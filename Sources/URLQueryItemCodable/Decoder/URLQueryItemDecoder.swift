//
//  URLQueryItemDecoder.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 12/30/22.
//

import Combine
import Foundation

public struct URLQueryItemDecoder {
    // NO-OP
}

// MARK: - TopLevelDecoder Extension

extension URLQueryItemDecoder: TopLevelDecoder {
    // MARK: Public Instance Interface
    
    public func decode<Value>(_ type: Value.Type, from: [URLQueryItem]) throws -> Value where Value: Decodable {
        let lowLevelDecoder = 
        
        return try Value(from: <#T##Decoder#>)
    }
}
