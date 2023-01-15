//
//  URLQueryItemEncoder.swift
//  URLQueryItemEncoder
//
//  Created by Kyle Hughes on 1/15/23.
//

import Combine
import Foundation

@_implementationOnly import Common

public struct URLQueryItemEncoder2 {
    
}

// MARK: - TopLevelEncoder Extension

extension URLQueryItemEncoder2: TopLevelEncoder {
    // MARK: Public Instance Interface
    
    public func encode(_ value: some Encodable) throws -> [URLQueryItem] {
        let lowLevelEncoder = LowLevelEncoder(intermediate: intermediate, codingPath: [])
        
        try value.encode(to: lowLevelEncoder)
        
        return intermediate.finalize()
    }
}
