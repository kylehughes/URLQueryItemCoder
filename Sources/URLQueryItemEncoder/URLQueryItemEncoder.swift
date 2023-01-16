//
//  URLQueryItemEncoder.swift
//  URLQueryItemEncoder
//
//  Created by Kyle Hughes on 1/15/23.
//

import Combine
import Foundation

@_implementationOnly import Common

public struct URLQueryItemEncoder {
    // MARK: Private Instance Interface
    
    private func encode(_ container: Container?, at key: String, into storage: inout [String: String]) {
        let separator = key.isEmpty ? "" : "."
        
        switch container {
        case let .keyed(container):
            for (subKey, container) in container.storage {
                let nextKey = "\(key)\(separator)\(subKey)"
                encode(container, at: nextKey, into: &storage)
            }
        case let .singleValue(container):
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
                let nextKey = "\(key)\(separator)\(index)"
                encode(container, at: nextKey, into: &storage)
            }
        case .none:
            storage.removeValue(forKey: key)
        }
    }
}

// MARK: - TopLevelEncoder Extension

extension URLQueryItemEncoder: TopLevelEncoder {
    // MARK: Public Instance Interface
    
    public func encode(_ value: some Encodable) throws -> [URLQueryItem] {
        let lowLevelEncoder = LowLevelEncoder(codingPath: [])
        
        try value.encode(to: lowLevelEncoder)
        
        var storage: [String: String] = [:]
        
        encode(lowLevelEncoder.storage, at: String(), into: &storage)
        
        return storage
            .map(URLQueryItem.init)
            .sorted { $0.name < $1.name }
    }
}
