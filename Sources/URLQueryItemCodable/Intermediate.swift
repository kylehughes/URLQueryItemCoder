//
//  IntermediateRepresentation.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 12/30/22.
//

import Foundation

// TODO: this should be called, like, intermediate representation

internal class Intermediate {
    private var storage: [String: String]
    
    // MARK: Internal Initialization
    
    internal init() {
        storage = [:]
    }
    
    internal init(from output: [URLQueryItem]) {
        storage = {
            var storage: [String: String] = Dictionary(minimumCapacity: output.count)
            
            for queryItem in output {
                storage[queryItem.name] = queryItem.value
            }
            
            return storage
        }()
    }
    
    // MARK: Internal Instance Interface
    
    internal func contains(_ codingPath: [any CodingKey]) -> Bool {
        storage[key(for: codingPath)] != nil
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
    
    // MARK: Private Instsance
    
    private func key(for codingPath: [any CodingKey]) -> String {
        codingPath.map(\.stringValue).joined(separator: ".")
    }
}
