//
//  Container+Keyed+Wrapper.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/15/23.
//

extension Container.Keyed {
    public struct Wrapper<Key> where Key: CodingKey {
        private let base: Container.Keyed
                
        // MARK: public Initialization
        
        public init(_ base: Container.Keyed) {
            self.base = base
        }
    }
}

// MARK: - KeyedDecodingContainerProtocol Extension

extension Container.Keyed.Wrapper: KeyedDecodingContainerProtocol where Representation == PrimitiveValue.Unknown {
    // MARK: Public Instance Interface
    
    public var allKeys: [Key] {
        base
            .allKeys
            .lazy
            .map(\.stringValue)
            .compactMap(Key.init)
    }
    
    public var codingPath: [any CodingKey] {
        base.codingPath
    }
    
    public func contains(_ key: Key) -> Bool {
        base.contains(StringCodingKey(stringValue: key.stringValue))
    }
    
    public func decode(_ type: Bool.Type, forKey key: Key) throws -> Bool {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func decode(_ type: String.Type, forKey key: Key) throws -> String {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func decode(_ type: Double.Type, forKey key: Key) throws -> Double {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func decode(_ type: Float.Type, forKey key: Key) throws -> Float {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func decode(_ type: Int.Type, forKey key: Key) throws -> Int {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func decode(_ type: Int8.Type, forKey key: Key) throws -> Int8 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func decode(_ type: Int16.Type, forKey key: Key) throws -> Int16 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func decode(_ type: Int32.Type, forKey key: Key) throws -> Int32 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func decode(_ type: Int64.Type, forKey key: Key) throws -> Int64 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func decode(_ type: UInt.Type, forKey key: Key) throws -> UInt {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func decode(_ type: UInt8.Type, forKey key: Key) throws -> UInt8 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func decode(_ type: UInt16.Type, forKey key: Key) throws -> UInt16 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func decode(_ type: UInt32.Type, forKey key: Key) throws -> UInt32 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func decode(_ type: UInt64.Type, forKey key: Key) throws -> UInt64 {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func decode<T>(_ type: T.Type, forKey key: Key) throws -> T where T: Decodable {
        try base.decode(type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func decodeNil(forKey key: Key) throws -> Bool {
        try base.decodeNil(forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func nestedContainer<NestedKey>(
        keyedBy type: NestedKey.Type,
        forKey key: Key
    ) throws -> KeyedDecodingContainer<NestedKey> where NestedKey: CodingKey {
        try base.nestedContainer(keyedBy: type, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func nestedUnkeyedContainer(forKey key: Key) throws -> UnkeyedDecodingContainer {
        try base.nestedUnkeyedContainer(forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func superDecoder() throws -> Decoder {
        try base.superDecoder()
    }
    
    public func superDecoder(forKey key: Key) throws -> Decoder {
        try base.superDecoder(forKey: StringCodingKey(stringValue: key.stringValue))
    }
}

// MARK: - KeyedEncodingContainerProtocol Extension

extension Container.Keyed.Wrapper: KeyedEncodingContainerProtocol where Representation == PrimitiveValue.Known {
    // MARK: public Instance Interface
    
    public var codingPath: [CodingKey] {
        base.codingPath
    }
    
    public func encode(_ value: Bool, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: Double, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: Float, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: Int, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: Int8, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: Int16, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: Int32, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: Int64, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: String, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: UInt, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: UInt8, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: UInt16, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: UInt32, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode(_ value: UInt64, forKey key: Key) throws {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
        try base.encode(value, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func encodeNil(forKey key: Key) throws {
        try base.encodeNil(forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type,
        forKey key: Key
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey: CodingKey {
        base.nestedContainer(keyedBy: keyType, forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public mutating func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        base.nestedUnkeyedContainer(forKey: StringCodingKey(stringValue: key.stringValue))
    }
    
    public mutating func superEncoder() -> Encoder {
        base.superEncoder()
    }
    
    public mutating func superEncoder(forKey key: Key) -> Encoder {
        base.superEncoder(forKey: StringCodingKey(stringValue: key.stringValue))
    }
}
