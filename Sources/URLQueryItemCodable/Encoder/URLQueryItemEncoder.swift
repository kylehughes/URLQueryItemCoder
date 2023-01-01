//
//  URLQueryItemEncoder.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 12/27/22.
//

import Combine
import Foundation

public struct URLQueryItemEncoder {
    // NO-OP
}

// MARK: - TopLevelEncoder Extension

extension URLQueryItemEncoder: TopLevelEncoder {
    // MARK: Public Instance Interface
    
    public func encode(_ value: some Encodable) throws -> [URLQueryItem] {
        let intermediate = Intermediate()
        let lowLevelEncoder = LowLevelEncoder(intermediate: intermediate, codingPath: [])
        
        try value.encode(to: lowLevelEncoder)
        
        return intermediate.finalize()
    }
}
