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
        
        internal init(from output: [URLQueryItem]) {
            storage = {
                var storage: [String: String?] = Dictionary(minimumCapacity: output.count)
                
                for queryItem in output {
                    storage[queryItem.name] = queryItem.value
                }
                
                return storage
            }()
        }
        
        // MARK: Internal Instance Interface
        
        internal func decode(_ codingPath: [any CodingKey]) -> String? {
            storage.removeValue(forKey: Self.storageKey(for: codingPath)) ?? nil
        }
        
        internal func decodeLosslessly<Target>(
            _ codingPath: [any CodingKey]
        ) -> Target? where Target: LosslessStringConvertible {
            guard let stringValue = decode(codingPath) else {
                return nil
            }
            
            return Target(stringValue)
        }
        
        internal func encode(_ codingPath: [any CodingKey], as value: String?) {
            storage[Self.storageKey(for: codingPath)] = value
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
        
        // MARK: Private Static Interface
        
        private static func storageKey(for codingPath: [any CodingKey]) -> String {
            codingPath.map(\.stringValue).joined(separator: ".")
        }
    }
}
