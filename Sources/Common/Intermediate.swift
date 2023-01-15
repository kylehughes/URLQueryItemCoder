//
//  IntermediateRepresentation.swift
//  Common
//
//  Created by Kyle Hughes on 12/30/22.
//

import Foundation

public class Intermediate {
    private static let keySeparator = "."
    
    /// - Note: We don't encode `nil` values – we skip them – but we do need to be able to decode them, and thus need to
    ///   be able to represent them in storage.
    private var storage: [String: String?]
    
    // MARK: Public Initialization
    
    public required init() {
        storage = [:]
    }
    
    public required init(from output: [URLQueryItem]) {
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

    // MARK: Internal Instance Interface
    
    public func finalize() -> [URLQueryItem] {
        storage
            .keys
            .sorted()
            .map { key in
                URLQueryItem(name: key, value: storage[key] ?? nil)
            }
    }
    
    public func isNil(for codingPath: [any CodingKey]) -> Bool {
        !contains(codingPath) || isValueNil(for: codingPath)
    }
    
    // MARK: Private Instsance
    
    private func isValueNil(for codingPath: [any CodingKey]) -> Bool {
        storage[key(for: codingPath)] == Optional(Optional(nil))
    }
    
    private func key(for codingPath: [any CodingKey]) -> String {
        codingPath.map(\.stringValue).joined(separator: Self.keySeparator)
    }
}

// MARK: - ReferenceContainerProtocol Extension

extension Intermediate: ReferenceContainerProtocol {
    // MARK: Public Instance Interface
    
    public var allStringKeys: [String] {
        Array(storage.keys)
    }
    
    public var count: Int {
        storage.count
    }
    
    public func contains(_ codingPath: [any CodingKey]) -> Bool {
        guard !storage.isEmpty else {
            return false
        }
        
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
    
    public func decode(_ codingPath: [any CodingKey]) throws -> String {
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
    
    public func encode(_ codingPath: [any CodingKey], as value: String?) {
        storage[key(for: codingPath)] = value
    }
    
    public func scoped(to codingPath: [any CodingKey]) -> ReferenceContainerProtocol {
        guard !codingPath.isEmpty else {
            return self
        }
        
        let prefix = key(for: codingPath)
        let scopedStorage = storage.filter { $0.key.hasPrefix(prefix) }
        
        return Intermediate(storage: scopedStorage)
    }
}
