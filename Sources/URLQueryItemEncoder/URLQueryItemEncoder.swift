//
//  URLQueryItemEncoder.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/15/23.
//

import Common
import Foundation

public struct URLQueryItemEncoder {
    // MARK: Public Instance Interface
    
    public func encode(_ value: some Encodable) throws -> [URLQueryItem] {
        let lowLevelEncoder = LowLevelEncoder(codingPath: [])
        
        try value.encode(to: lowLevelEncoder)
        
        var dictionaryRepresentation: [String: String?] = [:]
        
        encode(lowLevelEncoder.container, into: &dictionaryRepresentation)
        
        return dictionaryRepresentation
            .map(URLQueryItem.init)
            .sorted { $0.name < $1.name }
    }
    
    // MARK: Private Instance Interface

    private func encode(
        _ container: EncodingContainer?,
        at key: String = String(),
        into dictionaryRepresentation: inout [String: String?]
    ) {
        guard let container else {
            return
        }
        
        let separator = key.isEmpty ? "" : "."
        
        switch container {
        case let .keyed(keyedContainer):
            if keyedContainer.children.isEmpty {
                if !key.isEmpty {
                    dictionaryRepresentation[key] = String()
                }
            } else {
                for (subKey, childContainer) in keyedContainer.children {
                    let nextKey = "\(key)\(separator)\(subKey)"
                    encode(childContainer, at: nextKey, into: &dictionaryRepresentation)
                }
            }
        case let .singleValue(singleValueContainer):
            switch singleValueContainer.storage {
            case let .container(childContainer):
                encode(childContainer, at: key, into: &dictionaryRepresentation)
            case let .primitive(value):
                if let value {
                    dictionaryRepresentation[key] = String(describing: value)
                } else if !key.isEmpty {
                    dictionaryRepresentation.updateValue(nil, forKey: key)
                }
            case .none:
                preconditionFailure("Value was never encoded to single value container.")
            }
        case let .unkeyed(unkeyedContainer):
            for index in unkeyedContainer.children.indices {
                let childContainer = unkeyedContainer.children[index]
                let nextKey = "\(key)\(separator)\(index)"
                encode(childContainer, at: nextKey, into: &dictionaryRepresentation)
            }
        }
    }
}

#if canImport(Combine)

import Combine

// MARK: - TopLevelEncoder Extension

extension URLQueryItemEncoder: TopLevelEncoder {
    // NO-OP
}

#endif
