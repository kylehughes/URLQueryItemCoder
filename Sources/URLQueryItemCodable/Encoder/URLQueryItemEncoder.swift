//
//  URLQueryItemEncoder.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 12/27/22.
//

import Foundation

public struct URLQueryItemEncoder {
    // MARK: Public Instance Interface
    
    public func encode<T: Encodable>(_ value: T) throws -> [URLQueryItem] {
        let partial = Partial()
        let lowLevelEncoder = LowLevelEncoder(partial: partial, codingPath: [])
        
        try value.encode(to: lowLevelEncoder)
        
        return partial.finalize()
    }
}

#if canImport(Combine)

import Combine

// MARK: - TopLevelEncoder Extension

extension URLQueryItemEncoder: TopLevelEncoder {
    // NO-OP
}

#endif
