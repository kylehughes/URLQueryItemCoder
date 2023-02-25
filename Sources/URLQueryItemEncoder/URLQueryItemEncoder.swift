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

    private func encode(
        _ container: EncodingContainer?,
        at key: String = String(),
        into storage: inout [String: String?]
    ) {
        guard let container else {
            return
        }
        
        let separator = key.isEmpty ? "" : "."
        
        switch container {
        case let .keyed(keyedContainer):
            if keyedContainer.storage.isEmpty {
                if !key.isEmpty {
                    storage[key] = String()
                }
            } else {
                for (subKey, container) in keyedContainer.storage {
                    let nextKey = "\(key)\(separator)\(subKey)"
                    encode(container, at: nextKey, into: &storage)
                }
            }
        case let .singleValue(singleValueContainer):
            switch singleValueContainer.storage {
            case let .container(childContainer):
                encode(childContainer, at: key, into: &storage)
            case let .primitive(value):
                if let value {
                    storage[key] = String(describing: value)
                } else if !key.isEmpty {
                    storage.updateValue(nil, forKey: key)
                }
            case .none:
                fatalError("should throw error i think?")
            }
        case let .unkeyed(unkeyedContainer):
            for index in unkeyedContainer.storage.indices {
                let childContainer = unkeyedContainer.storage[index]
                let nextKey = "\(key)\(separator)\(index)"
                encode(childContainer, at: nextKey, into: &storage)
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
        
        encode(lowLevelEncoder.storage, into: &storage)
        
        return storage
            .map(URLQueryItem.init)
            .sorted { $0.name < $1.name }
    }
}
