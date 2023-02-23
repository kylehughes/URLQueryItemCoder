//
//  URLQueryItemEncoder.swift
//  URLQueryItemEncoder
//
//  Created by Kyle Hughes on 1/15/23.
//

import Combine
import Common
import Foundation

public struct URLQueryItemEncoder {
    // MARK: Private Instance Interface
    
    // TODO: clean this up, it's super messy. technically mostly works but gotta be a better way.
    private func encode(
        _ container: EncodingContainer?,
        at key: String,
        into storage: inout [String: String?]
    ) {
        guard let container else {
            return
        }
        
        let separator = key.isEmpty ? "" : "."
        
        switch container {
        case let .keyed(container):
            guard !container.storage.isEmpty else {
                // TODO: find a better way to capture this behavior… this doesn't actually represent the logic we want, it just happens to work
                if !key.isEmpty {
                    storage[key] = String()
                }
                break
            }
            for (subKey, container) in container.storage {
                let nextKey = "\(key)\(separator)\(subKey)"
                encode(container, at: nextKey, into: &storage)
            }
        case let .singleValue(container):
            switch container.storage {
            case let .container(container):
                encode(container, at: key, into: &storage)
            case let .primitive(value):
                guard let value else {
                    // TODO: find a better way to capture this behavior…
                    if !key.isEmpty {
                        storage.updateValue(nil, forKey: key)
                    }
                    break
                }
                storage[key] = String(describing: value)
            case .none:
                fatalError("should throw error i think?")
            }
        case let .unkeyed(container):
            for (index, container) in zip(container.storage.indices, container.storage) {
                let nextKey = "\(key)\(separator)\(index)"
                encode(container, at: nextKey, into: &storage)
            }
        }
    }
}

// MARK: - TopLevelEncoder Extension

extension URLQueryItemEncoder: TopLevelEncoder {
    // MARK: Public Instance Interface
    
    public func encode(_ value: some Encodable) throws -> [URLQueryItem] {
        let lowLevelEncoder = LowLevelEncoder(codingPath: [])
        
        try value.encode(to: lowLevelEncoder)
        
        var storage: [String: String?] = [:]
        
        encode(lowLevelEncoder.storage, at: String(), into: &storage)
        
        return storage
            .map(URLQueryItem.init)
            .sorted { $0.name < $1.name }
    }
}
