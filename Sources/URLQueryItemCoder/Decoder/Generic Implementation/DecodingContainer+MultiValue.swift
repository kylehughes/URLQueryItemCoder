//
//  DecodingContainer+MultiValue.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 2/21/23.
//

import Foundation

extension DecodingContainer {
    internal final class MultiValue {
        internal let configuration: DecodingStrategies
        
        internal private(set) var children: [String: DecodingContainer<PrimitiveValue>]
        internal private(set) var codingPath: [any CodingKey]
        internal private(set) var currentIndex: Int
        
        // MARK: Internal Initialization
        
        internal init(codingPath: [any CodingKey], configuration: DecodingStrategies) {
            self.codingPath = codingPath
            self.configuration = configuration
            
            children = [:]
            currentIndex = 0
        }
        
        // MARK: Internal Instance Interface
        
        internal func set(_ key: String, to child: DecodingContainer<PrimitiveValue>) {
            precondition(children[key] == nil, "A child already exists for that key.")
            
            children[key] = child
        }
        
        // MARK: Private Instance Interface
        
        private var endIndex: Int {
            children.count - 1
        }
        
        private func childContainer(for key: some CodingKey) throws -> DecodingContainer {
            let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
            
            guard let childContainer = children[encodedKey.stringValue] else {
                throw DecodingError.keyNotFound(
                    key,
                    .noValueAssociatedWithKey(at: nextCodingPath(appending: key))
                )
            }
            
            return childContainer
        }
        
        private func singleValueContainer(for key: some CodingKey) throws -> DecodingContainer.SingleValue {
            switch try childContainer(for: key) {
            case .multiValue:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: codingPath,
                        debugDescription: "Cannot decode container as primitive value."
                    )
                )
            case let .singleValue(singleValueContainer):
                return singleValueContainer
            }
        }
        
        // MARK: Private Instance Interface
        
        private func nextCodingPath(appending key: some CodingKey) -> [any CodingKey] {
            var nextCodingPath = codingPath
            nextCodingPath.append(key)
            
            return nextCodingPath
        }
        
        private func nextDecodingKey() -> StringCodingKey {
            defer {
                currentIndex += 1
            }
            
            return StringCodingKey(intValue: currentIndex)
        }
    }
}

// MARK: - KeyedDecodingContainerProtocol Extension

extension DecodingContainer.MultiValue: KeyedDecodingContainerProtocol {
    // MARK: Internal Instance Interface
    
    internal var allKeys: [StringCodingKey] {
        children.keys.map(StringCodingKey.init(stringValue:))
    }
    
    internal func contains(_ key: StringCodingKey) -> Bool {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        
        return children[encodedKey.stringValue] != nil
    }
    
    internal func decode(_ type: Bool.Type, forKey key: StringCodingKey) throws -> Bool {
        try singleValueContainer(for: key).decode(type)
    }
    
    internal func decode(_ type: String.Type, forKey key: StringCodingKey) throws -> String {
        try singleValueContainer(for: key).decode(type)
    }
    
    internal func decode(_ type: Double.Type, forKey key: StringCodingKey) throws -> Double {
        try singleValueContainer(for: key).decode(type)
    }
    
    internal func decode(_ type: Float.Type, forKey key: StringCodingKey) throws -> Float {
        try singleValueContainer(for: key).decode(type)
    }
    
    internal func decode(_ type: Int.Type, forKey key: StringCodingKey) throws -> Int {
        try singleValueContainer(for: key).decode(type)
    }
    
    internal func decode(_ type: Int8.Type, forKey key: StringCodingKey) throws -> Int8 {
        try singleValueContainer(for: key).decode(type)
    }
    
    internal func decode(_ type: Int16.Type, forKey key: StringCodingKey) throws -> Int16 {
        try singleValueContainer(for: key).decode(type)
    }
    
    internal func decode(_ type: Int32.Type, forKey key: StringCodingKey) throws -> Int32 {
        try singleValueContainer(for: key).decode(type)
    }
    
    internal func decode(_ type: Int64.Type, forKey key: StringCodingKey) throws -> Int64 {
        try singleValueContainer(for: key).decode(type)
    }
    
    internal func decode(_ type: UInt.Type, forKey key: StringCodingKey) throws -> UInt {
        try singleValueContainer(for: key).decode(type)
    }
    
    internal func decode(_ type: UInt8.Type, forKey key: StringCodingKey) throws -> UInt8 {
        try singleValueContainer(for: key).decode(type)
    }
    
    internal func decode(_ type: UInt16.Type, forKey key: StringCodingKey) throws -> UInt16 {
        try singleValueContainer(for: key).decode(type)
    }
    
    internal func decode(_ type: UInt32.Type, forKey key: StringCodingKey) throws -> UInt32 {
        try singleValueContainer(for: key).decode(type)
    }
    
    internal func decode(_ type: UInt64.Type, forKey key: StringCodingKey) throws -> UInt64 {
        try singleValueContainer(for: key).decode(type)
    }
    
    internal func decode<Target>(
        _ type: Target.Type,
        forKey key: StringCodingKey
    ) throws -> Target where Target: Decodable {
        let childContainer = try childContainer(for: key)
        let lowLevelDecoder = LowLevelDecoder(container: childContainer)
        
        return try lowLevelDecoder.decodeWithSpecialTreatment(as: type)
    }
    
    internal func decodeNil(forKey key: StringCodingKey) throws -> Bool {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        
        guard let childContainer = children[encodedKey.stringValue] else {
            return true
        }
        
        switch childContainer {
        case .multiValue:
            return false
        case let .singleValue(singleValueContainer):
            return singleValueContainer.decodeNil()
        }
    }
    
    internal func nestedContainer<NestedKey>(
        keyedBy type: NestedKey.Type,
        forKey key: StringCodingKey
    ) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        switch try childContainer(for: key) {
        case let .multiValue(multiValueContainer):
            return KeyedDecodingContainer(multiValueContainer.wrapped())
        case let .singleValue(singleValueContainer):
            return KeyedDecodingContainer(singleValueContainer.wrapped())
        }
    }
    
    internal func nestedUnkeyedContainer(forKey key: StringCodingKey) throws -> UnkeyedDecodingContainer {
        switch try childContainer(for: key) {
        case let .multiValue(multiValueContainer):
            return multiValueContainer
        case let .singleValue(singleValueContainer):
            return singleValueContainer
        }
    }
    
    internal func superDecoder() throws -> Decoder {
        let key = StringCodingKey(stringValue: "super")
        
        return try superDecoder(forKey: key)
    }
    
    internal func superDecoder(forKey key: StringCodingKey) throws -> Decoder {
        let encodedKey = configuration.keyStrategy.encode(key, at: codingPath)
        
        guard let childContainer = children[encodedKey.stringValue] else {
            throw DecodingError.keyNotFound(key, .noValueAssociatedWithKey(at: nextCodingPath(appending: encodedKey)))
        }
        
        return LowLevelDecoder(container: childContainer)
    }
}

// MARK: - SingleValueDecodingContainer

extension DecodingContainer.MultiValue: SingleValueDecodingContainer {
    // NO-OP
}

// MARK: - UnkeyedDecodingContainer Extension

extension DecodingContainer.MultiValue: UnkeyedDecodingContainer {
    // MARK: Internal Instance Interface
    
    internal var count: Int? {
        children.count
    }
    
    internal var isAtEnd: Bool {
        endIndex < currentIndex
    }
    
    internal func decode(_ type: Bool.Type) throws -> Bool {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    internal func decode(_ type: Double.Type) throws -> Double {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    internal func decode(_ type: Float.Type) throws -> Float {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    internal func decode(_ type: Int.Type) throws -> Int {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    internal func decode(_ type: Int8.Type) throws -> Int8 {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    internal func decode(_ type: Int16.Type) throws -> Int16 {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    internal func decode(_ type: Int32.Type) throws -> Int32 {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    internal func decode(_ type: Int64.Type) throws -> Int64 {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    internal func decode(_ type: String.Type) throws -> String {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    internal func decode(_ type: UInt.Type) throws -> UInt {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    internal func decode(_ type: UInt8.Type) throws -> UInt8 {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    internal func decode(_ type: UInt16.Type) throws -> UInt16 {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    internal func decode(_ type: UInt32.Type) throws -> UInt32 {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    internal func decode(_ type: UInt64.Type) throws -> UInt64 {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    internal func decode<Target>(_ type: Target.Type) throws -> Target where Target: Decodable {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
        
    internal func decodeNil() -> Bool {
        let nextCodingKey = nextDecodingKey()
        
        return (try? decodeNil(forKey: nextCodingKey)) ?? false
    }
    
    internal func nestedContainer<NestedKey>(
        keyedBy type: NestedKey.Type
    ) throws -> KeyedDecodingContainer<NestedKey> where NestedKey: CodingKey {
        let nextCodingKey = nextDecodingKey()
        
        return try nestedContainer(keyedBy: type, forKey: nextCodingKey)
    }
    
    internal func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        let nextCodingKey = nextDecodingKey()
        
        return try nestedUnkeyedContainer(forKey: nextCodingKey)
    }
}
