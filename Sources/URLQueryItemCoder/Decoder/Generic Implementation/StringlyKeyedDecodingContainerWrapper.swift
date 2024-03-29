//
//  StringlyKeyedDecodingContainerWrapper.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 2/23/23.
//

internal struct StringlyKeyedDecodingContainerWrapper<Key, Base> where
    Key: CodingKey,
    Base: KeyedDecodingContainerProtocol,
    Base.Key == StringCodingKey
{
    internal let base: Base
            
    // MARK: Internal Initialization
    
    internal init(_ base: Base) {
        self.base = base
    }
}

// MARK: - KeyedDecodingContainerProtocol Extension

extension StringlyKeyedDecodingContainerWrapper: KeyedDecodingContainerProtocol {
    // MARK: Internal Instance Interface
    
    @inlinable
    internal var allKeys: [Key] {
        base
            .allKeys
            .lazy
            .map(\.stringValue)
            .compactMap(Key.init)
    }
    
    @inlinable
    internal var codingPath: [any CodingKey] {
        base.codingPath
    }
    
    @inlinable
    internal func contains(_ key: Key) -> Bool {
        base.contains(StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    internal func decode(_ type: Bool.Type, forKey key: Key) throws -> Bool {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    internal func decode(_ type: String.Type, forKey key: Key) throws -> String {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    internal func decode(_ type: Double.Type, forKey key: Key) throws -> Double {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    internal func decode(_ type: Float.Type, forKey key: Key) throws -> Float {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    internal func decode(_ type: Int.Type, forKey key: Key) throws -> Int {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    internal func decode(_ type: Int8.Type, forKey key: Key) throws -> Int8 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    internal func decode(_ type: Int16.Type, forKey key: Key) throws -> Int16 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    internal func decode(_ type: Int32.Type, forKey key: Key) throws -> Int32 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    internal func decode(_ type: Int64.Type, forKey key: Key) throws -> Int64 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    internal func decode(_ type: UInt.Type, forKey key: Key) throws -> UInt {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    internal func decode(_ type: UInt8.Type, forKey key: Key) throws -> UInt8 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    internal func decode(_ type: UInt16.Type, forKey key: Key) throws -> UInt16 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    internal func decode(_ type: UInt32.Type, forKey key: Key) throws -> UInt32 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    internal func decode(_ type: UInt64.Type, forKey key: Key) throws -> UInt64 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    internal func decode<T>(_ type: T.Type, forKey key: Key) throws -> T where T: Decodable {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    internal func decodeNil(forKey key: Key) throws -> Bool {
        try base.decodeNil(forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    internal func nestedContainer<NestedKey>(
        keyedBy type: NestedKey.Type,
        forKey key: Key
    ) throws -> KeyedDecodingContainer<NestedKey> where NestedKey: CodingKey {
        try base.nestedContainer(keyedBy: type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    internal func nestedUnkeyedContainer(forKey key: Key) throws -> UnkeyedDecodingContainer {
        try base.nestedUnkeyedContainer(forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    @inlinable
    internal func superDecoder() throws -> Decoder {
        try base.superDecoder()
    }
    
    @inlinable
    internal func superDecoder(forKey key: Key) throws -> Decoder {
        try base.superDecoder(forKey: StringCodingKey(stringValue: key.stringValue))
    }
}

// MARK: - Extension for Stringly-Keyed Decoding Containers

extension KeyedDecodingContainerProtocol where Key == StringCodingKey {
    // MARK: Internal Instance Interface

    internal func wrapped<Key>() -> StringlyKeyedDecodingContainerWrapper<Key, Self> {
        StringlyKeyedDecodingContainerWrapper(self)
    }
}
