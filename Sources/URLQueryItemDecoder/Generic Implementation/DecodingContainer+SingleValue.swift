//
//  DecodingContainer+SingleValue.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 2/21/23.
//

import Common

extension DecodingContainer {
    public final class SingleValue {
        public let codingPath: [any CodingKey]
        
        public private(set) var storage: PrimitiveValue?
        
        // MARK: Public Initialization
        
        public init(codingPath: [any CodingKey]) {
            self.codingPath = codingPath
            
            storage = nil
        }
        
        // MARK: Public Instance Interface
        
        public func store(_ value: PrimitiveValue?) {
            precondition(storage == nil)
            
            storage = value
        }

        public func wrapped<Key>() -> Wrapper<Key> {
            Wrapper(self)
        }
    }
}

// MARK: - SingleValueDecodingContainer Extension

extension DecodingContainer.SingleValue: SingleValueDecodingContainer {
    // MARK: Public Instance Interface
    
    public func decode(_ type: Bool.Type) throws -> Bool {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: String.Type) throws -> String {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Double.Type) throws -> Double {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Float.Type) throws -> Float {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Int.Type) throws -> Int {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Int8.Type) throws -> Int8 {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Int16.Type) throws -> Int16 {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Int32.Type) throws -> Int32 {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Int64.Type) throws -> Int64 {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: UInt.Type) throws -> UInt {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: UInt8.Type) throws -> UInt8 {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: UInt16.Type) throws -> UInt16 {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: UInt32.Type) throws -> UInt32 {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: UInt64.Type) throws -> UInt64 {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        let lowLevelDecoder = LowLevelDecoder(container: .singleValue(self))
        
        return try T(from: lowLevelDecoder)
    }
    
    public func decodeNil() -> Bool {
        storage == nil
    }
}

// MARK: - KeyedDecodingContainerProtocol Extension

extension DecodingContainer.SingleValue: KeyedDecodingContainerProtocol {
    // MARK: Public Instance Interface
    
    public var allKeys: [StringCodingKey] {
        []
    }
    
    public func contains(_ key: StringCodingKey) -> Bool {
        false
    }
    
    public func decode(_ type: Bool.Type, forKey key: StringCodingKey) throws -> Bool {
        throw DecodingError.dataCorrupted(.obvious(codingPath))
    }
    
    public func decode(_ type: String.Type, forKey key: StringCodingKey) throws -> String {
        throw DecodingError.dataCorrupted(.obvious(codingPath))
    }
    
    public func decode(_ type: Double.Type, forKey key: StringCodingKey) throws -> Double {
        throw DecodingError.dataCorrupted(.obvious(codingPath))
    }
    
    public func decode(_ type: Float.Type, forKey key: StringCodingKey) throws -> Float {
        throw DecodingError.dataCorrupted(.obvious(codingPath))
    }
    
    public func decode(_ type: Int.Type, forKey key: StringCodingKey) throws -> Int {
        throw DecodingError.dataCorrupted(.obvious(codingPath))
    }
    
    public func decode(_ type: Int8.Type, forKey key: StringCodingKey) throws -> Int8 {
        throw DecodingError.dataCorrupted(.obvious(codingPath))
    }
    
    public func decode(_ type: Int16.Type, forKey key: StringCodingKey) throws -> Int16 {
        throw DecodingError.dataCorrupted(.obvious(codingPath))
    }
    
    public func decode(_ type: Int32.Type, forKey key: StringCodingKey) throws -> Int32 {
        throw DecodingError.dataCorrupted(.obvious(codingPath))
    }
    
    public func decode(_ type: Int64.Type, forKey key: StringCodingKey) throws -> Int64 {
        throw DecodingError.dataCorrupted(.obvious(codingPath))
    }
    
    public func decode(_ type: UInt.Type, forKey key: StringCodingKey) throws -> UInt {
        throw DecodingError.dataCorrupted(.obvious(codingPath))
    }
    
    public func decode(_ type: UInt8.Type, forKey key: StringCodingKey) throws -> UInt8 {
        throw DecodingError.dataCorrupted(.obvious(codingPath))
    }
    
    public func decode(_ type: UInt16.Type, forKey key: StringCodingKey) throws -> UInt16 {
        throw DecodingError.dataCorrupted(.obvious(codingPath))
    }
    
    public func decode(_ type: UInt32.Type, forKey key: StringCodingKey) throws -> UInt32 {
        throw DecodingError.dataCorrupted(.obvious(codingPath))
    }
    
    public func decode(_ type: UInt64.Type, forKey key: StringCodingKey) throws -> UInt64 {
        throw DecodingError.dataCorrupted(.obvious(codingPath))
    }
    
    public func decode<T>(_ type: T.Type, forKey key: StringCodingKey) throws -> T where T : Decodable {
        throw DecodingError.dataCorrupted(.obvious(codingPath))
    }
    
    public func decodeNil(forKey key: StringCodingKey) throws -> Bool {
        true
    }
    
    public func nestedContainer<NestedKey>(
        keyedBy type: NestedKey.Type,
        forKey key: StringCodingKey
    ) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        throw DecodingError.dataCorrupted(
            DecodingError.Context(
                codingPath: codingPath.appending(key),
                debugDescription: "Cannot decode primitive value as keyed container."
            )
        )
    }
    
    public func nestedUnkeyedContainer(forKey key: StringCodingKey) throws -> UnkeyedDecodingContainer {
        throw DecodingError.dataCorrupted(
            DecodingError.Context(
                codingPath: codingPath.appending(key),
                debugDescription: "Cannot decode primitive value as unkeyed container."
            )
        )
    }
    
    public func superDecoder() throws -> Decoder {
        // TODO: Implement somehow
        fatalError("TODO")
    }
    
    public func superDecoder(forKey key: StringCodingKey) throws -> Decoder {
        // TODO: Implement somehow
        fatalError("TODO")
    }
}

// MARK: - UnkeyedDecodingContainer Extension

extension DecodingContainer.SingleValue: UnkeyedDecodingContainer {
    public var count: Int? {
        storage == nil ? 0 : 1
    }
    
    public var isAtEnd: Bool {
        true
    }
    
    public var currentIndex: Int {
        0
    }
    
    public func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        throw DecodingError.dataCorrupted(
            DecodingError.Context(
                codingPath: codingPath.appending(IntCodingKey(intValue: 0)),
                debugDescription: "Cannot decode primitive value as keyed container."
            )
        )
    }
    
    public func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        throw DecodingError.dataCorrupted(
            DecodingError.Context(
                codingPath: codingPath.appending(IntCodingKey(intValue: 0)),
                debugDescription: "Cannot decode primitive value as unkeyed container."
            )
        )
    }
}


extension DecodingContainer.SingleValue {
    public struct Wrapper<Key> where Key: CodingKey {
        public let base: DecodingContainer.SingleValue
                
        // MARK: Public Initialization
        
        public init(_ base: DecodingContainer.SingleValue) {
            self.base = base
        }
    }
}

extension DecodingContainer.SingleValue.Wrapper: KeyedDecodingContainerProtocol {
    // MARK: Public Instance Interface
    
    @inlinable
    public var allKeys: [Key] {
        base
            .allKeys
            .lazy
            .map(\.stringValue)
            .compactMap(Key.init)
    }
    
    @inlinable
    public var codingPath: [any CodingKey] {
        base.codingPath
    }
    
    @inlinable
    public func contains(_ key: Key) -> Bool {
        base.contains(StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    public func decode(_ type: Bool.Type, forKey key: Key) throws -> Bool {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    public func decode(_ type: String.Type, forKey key: Key) throws -> String {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    public func decode(_ type: Double.Type, forKey key: Key) throws -> Double {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    public func decode(_ type: Float.Type, forKey key: Key) throws -> Float {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    public func decode(_ type: Int.Type, forKey key: Key) throws -> Int {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    public func decode(_ type: Int8.Type, forKey key: Key) throws -> Int8 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    public func decode(_ type: Int16.Type, forKey key: Key) throws -> Int16 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    public func decode(_ type: Int32.Type, forKey key: Key) throws -> Int32 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    public func decode(_ type: Int64.Type, forKey key: Key) throws -> Int64 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    public func decode(_ type: UInt.Type, forKey key: Key) throws -> UInt {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    public func decode(_ type: UInt8.Type, forKey key: Key) throws -> UInt8 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    public func decode(_ type: UInt16.Type, forKey key: Key) throws -> UInt16 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    public func decode(_ type: UInt32.Type, forKey key: Key) throws -> UInt32 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    public func decode(_ type: UInt64.Type, forKey key: Key) throws -> UInt64 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    public func decode<T>(_ type: T.Type, forKey key: Key) throws -> T where T: Decodable {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    public func decodeNil(forKey key: Key) throws -> Bool {
        try base.decodeNil(forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    public func nestedContainer<NestedKey>(
        keyedBy type: NestedKey.Type,
        forKey key: Key
    ) throws -> KeyedDecodingContainer<NestedKey> where NestedKey: CodingKey {
        try base.nestedContainer(keyedBy: type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    public func nestedUnkeyedContainer(forKey key: Key) throws -> UnkeyedDecodingContainer {
        try base.nestedUnkeyedContainer(forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    public func superDecoder() throws -> Decoder {
        try base.superDecoder()
    }
    
    @inlinable
    public func superDecoder(forKey key: Key) throws -> Decoder {
        try base.superDecoder(forKey: StringCodingKey(stringValue: key.stringValue))
    }
}
