//
//  DecodingContainer+None.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 2/22/23.
//

import Common

// TODO: could I just reuse multi value instead?

extension DecodingContainer {
    public final class None {
        public let codingPath: [any CodingKey]
        
        public private(set) var currentIndex: Int
        
        // MARK: Public Initialization
        
        public init(codingPath: [any CodingKey]) {
            self.codingPath = codingPath
            
            currentIndex = 0
        }
        
        // MARK: Public Instance Interface

        public func wrapped<Key>() -> Wrapper<Key> {
            Wrapper(self)
        }
        
        // MARK: Private Instance Interface
        
        private func nextDecodingKey() -> StringCodingKey {
            defer {
                currentIndex += 1
            }
            
            return StringCodingKey(intValue: currentIndex)
        }
    }
}

// MARK: - KeyedDecodingContainerProtocol Extension

extension DecodingContainer.None: KeyedDecodingContainerProtocol {
    // MARK: Public Instance Interface
    
    public var allKeys: [StringCodingKey] {
        []
    }
    
    public func contains(_ key: StringCodingKey) -> Bool {
        false
    }
    
    public func decode(_ type: Bool.Type, forKey key: StringCodingKey) throws -> Bool {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: String.Type, forKey key: StringCodingKey) throws -> String {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: Double.Type, forKey key: StringCodingKey) throws -> Double {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: Float.Type, forKey key: StringCodingKey) throws -> Float {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: Int.Type, forKey key: StringCodingKey) throws -> Int {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: Int8.Type, forKey key: StringCodingKey) throws -> Int8 {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: Int16.Type, forKey key: StringCodingKey) throws -> Int16 {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: Int32.Type, forKey key: StringCodingKey) throws -> Int32 {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: Int64.Type, forKey key: StringCodingKey) throws -> Int64 {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: UInt.Type, forKey key: StringCodingKey) throws -> UInt {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: UInt8.Type, forKey key: StringCodingKey) throws -> UInt8 {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: UInt16.Type, forKey key: StringCodingKey) throws -> UInt16 {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: UInt32.Type, forKey key: StringCodingKey) throws -> UInt32 {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: UInt64.Type, forKey key: StringCodingKey) throws -> UInt64 {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode<T>(_ type: T.Type, forKey key: StringCodingKey) throws -> T where T : Decodable {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decodeNil(forKey key: StringCodingKey) throws -> Bool {
        true
    }
    
    public func nestedContainer<NestedKey>(
        keyedBy type: NestedKey.Type,
        forKey key: StringCodingKey
    ) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        KeyedDecodingContainer(Self(codingPath: codingPath.appending(key)).wrapped())
    }
    
    public func nestedUnkeyedContainer(forKey key: StringCodingKey) throws -> UnkeyedDecodingContainer {
        Self(codingPath: codingPath.appending(key))
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

// MARK: - SingleValueDecodingContainer Extension

extension DecodingContainer.None: SingleValueDecodingContainer {
    // MARK: Public Instance Interface
    
    public func decode(_ type: Bool.Type) throws -> Bool {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: String.Type) throws -> String {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: Double.Type) throws -> Double {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: Float.Type) throws -> Float {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: Int.Type) throws -> Int {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: Int8.Type) throws -> Int8 {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: Int16.Type) throws -> Int16 {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: Int32.Type) throws -> Int32 {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: Int64.Type) throws -> Int64 {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: UInt.Type) throws -> UInt {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: UInt8.Type) throws -> UInt8 {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: UInt16.Type) throws -> UInt16 {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: UInt32.Type) throws -> UInt32 {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode(_ type: UInt64.Type) throws -> UInt64 {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        throw DecodingError.valueNotFound(type, .obvious(codingPath))
    }
    
    public func decodeNil() -> Bool {
        true
    }
}

extension DecodingContainer.None {
    public struct Wrapper<Key> where Key: CodingKey {
        public let base: DecodingContainer.None
                
        // MARK: Public Initialization
        
        public init(_ base: DecodingContainer.None) {
            self.base = base
        }
    }
}

extension DecodingContainer.None.Wrapper: KeyedDecodingContainerProtocol {
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

// MARK: - UnkeyedDecodingContainer Extension

extension DecodingContainer.None: UnkeyedDecodingContainer {
    // MARK: Public Instance Interface
    
    public var count: Int? {
        0
    }
    
    public var isAtEnd: Bool {
        true
    }
    
    public func nestedContainer<NestedKey>(
        keyedBy type: NestedKey.Type
    ) throws -> KeyedDecodingContainer<NestedKey> where NestedKey: CodingKey {
        let nextCodingKey = nextDecodingKey()
        
        return try nestedContainer(keyedBy: type, forKey: nextCodingKey)
    }
    
    public func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        let nextCodingKey = nextDecodingKey()
        
        return try nestedUnkeyedContainer(forKey: nextCodingKey)
    }
}
