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
    // NO-OP
}

// MARK: - TopLevelEncoder Extension

extension URLQueryItemEncoder2: TopLevelEncoder {
    // MARK: Public Instance Interface
    
    public func encode(_ value: some Encodable) throws -> [URLQueryItem] {
        let lowLevelEncoder = LowLevelEncoder(codingPath: [])
        
        try value.encode(to: lowLevelEncoder)
        
        var storage: [String: String] = [:]
        
        encode(lowLevelEncoder.storage, at: String(), into: &storage)
        
        return storage.map(URLQueryItem.init)
    }
    
    private func encode(_ container: Container?, at key: String, into storage: inout [String: String]) {
        switch container {
        case let .keyed(container):
            for (subKey, container) in container.storage {
                let nextKey = "\(key).\(subKey)"
                encode(container, at: nextKey, into: &storage)
            }
        case let .single(container):
            switch container.storage {
            case let .container(container):
                encode(container, at: key, into: &storage)
            case let .primitive(value):
                storage[key] = String(describing: value)
            case .none:
                storage.removeValue(forKey: key)
            }
        case let .unkeyed(container):
            for (index, container) in zip(container.storage.indices, container.storage) {
                let nextKey = "\(key).\(index)"
                encode(container, at: nextKey, into: &storage)
            }
        case .none:
            storage.removeValue(forKey: key)
        }
    }
}
