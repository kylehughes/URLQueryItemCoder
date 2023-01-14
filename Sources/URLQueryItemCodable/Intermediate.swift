//
//  IntermediateRepresentation.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 12/30/22.
//

import Foundation

internal class Intermediate {
    internal static let keySeparator = "."
    
    /// - Note: We don't encode `nil` values – we skip them – but we do need to be able to decode them regardless.
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
    
    // MARK: Private Initialization
    
    private init(storage: [String: String?]) {
        self.storage = storage
    }
    
    // MARK: Internal Static Interface
    
    internal static func key(for codingPath: [any CodingKey]) -> String {
        codingPath.map(\.stringValue).joined(separator: keySeparator)
    }

    // MARK: Internal Instance Interface
    
    internal var allStringKeys: [String] {
        Array(storage.keys)
    }
    
    internal var childrenCount: Int {
        var uniqueChildKeys: Set<String.SubSequence> = []
        
        for key in storage.keys {
            uniqueChildKeys.insert(key.prefix { $0 != "." })
        }
        
        return uniqueChildKeys.count
    }
    
    internal var count: Int {
        storage.count
    }
    
    internal func contains(_ codingPath: [any CodingKey]) -> Bool {
        guard !codingPath.isEmpty else {
            return true
        }
        
        let storageKey = key(for: codingPath)
        
        guard storage[storageKey] == nil else {
            return true
        }
        
        for key in storage.keys {
            guard key.hasPrefix(storageKey) else {
                continue
            }
            
            return true
        }
        
        return false
    }
    
    internal func decode(_ codingPath: [any CodingKey]) throws -> String {
        let storageKey = key(for: codingPath)
        
        guard let value = storage[storageKey] else {
            guard let codingKey = codingPath.last else {
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(codingPath: codingPath, debugDescription: "Expected valid coding path.")
                )
            }
            
            throw DecodingError.keyNotFound(
                codingKey,
                DecodingError.Context(codingPath: codingPath, debugDescription: "Storage key: \(storageKey)")
            )
        }
        
        guard let value else {
            throw DecodingError.valueNotFound(
                String.self,
                DecodingError.Context(codingPath: codingPath, debugDescription: "Expected value but found nil.")
            )
        }
        
        return value
    }
    
    internal func decodeLosslessly<Target>(
        _ codingPath: [any CodingKey]
    ) throws -> Target where Target: LosslessStringConvertible {
        let stringValue = try decode(codingPath)
        
        guard let value = Target(stringValue) else {
            throw DecodingError.typeMismatch(
                Target.self,
                DecodingError.Context(codingPath: codingPath, debugDescription: "Couldn't decode from string.")
            )
        }
        
        return value
    }

    internal func encode(_ codingPath: [any CodingKey], as value: String?) {
        storage[key(for: codingPath)] = value
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
    
    internal func isNil(for codingPath: [any CodingKey]) -> Bool {
        !contains(codingPath) || isValueNil(for: codingPath)
    }
    
    internal func scoped(to codingPath: [any CodingKey]) -> Intermediate {
        guard !codingPath.isEmpty else {
            return self
        }
        
        let prefix = key(for: codingPath)
        let scopedStorage = storage.filter { $0.key.hasPrefix(prefix) }
        
        return Intermediate(storage: scopedStorage)
    }
    
    // MARK: Private Instsance
    
    private func isValueNil(for codingPath: [any CodingKey]) -> Bool {
        storage[key(for: codingPath)] == Optional(Optional(nil))
    }
    
    private func key(for codingPath: [any CodingKey]) -> String {
        Self.key(for: codingPath)
    }
}
