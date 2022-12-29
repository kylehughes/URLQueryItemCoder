//
//  URLQueryItemEncoder+Partial.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 12/27/22.
//

import Foundation

extension URLQueryItemEncoder {
    internal class Partial {
        private var storage: [String: String?]
        
        // MARK: Internal Initialization
        
        internal init() {
            storage = [:]
        }
        
        // MARK: Internal Instance Interface
        
        internal func encode(_ codingPath: [any CodingKey], as value: String?) {
            let key = codingPath.map(\.stringValue).joined(separator: ".")
            storage[key] = value
        }
        
        internal func encodeLosslessly(_ codingPath: [any CodingKey], as value: (some LosslessStringConvertible)?) {
            guard let value else {
                encode(codingPath, as: nil)
                return
            }
            
            encode(codingPath, as: String(value))
        }
        
        internal func finalize() -> [URLQueryItem] {
            storage
                .keys
                .sorted()
                .map { key in
                    URLQueryItem(name: key, value: storage[key] ?? nil)
                }
        }
    }
}
