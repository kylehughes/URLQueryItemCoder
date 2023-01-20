//
//  DecodingContainer.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/19/23.
//

public final class DecodingContainer<PrimitiveValue> where PrimitiveValue: DecodingPrimitiveValue {
    public private(set) var codingPath: [any CodingKey]
    public private(set) var currentIndex: Int
    public var storage: [String: Storage]
    
    // MARK: Public Initialization
    
    public init(codingPath: [any CodingKey]) {
        self.codingPath = codingPath
        
        currentIndex = 0
        storage = [:]
    }
    
    // MARK: Public Instance Interface
    
    public func store(_ value: PrimitiveValue) {
        storage[String(currentIndex)] = .primitiveValue(value)
    }
    
    public func wrapped<Key>() -> DecodingContainer.Wrapper<Key> {
        DecodingContainer.Wrapper(self)
    }
    
    // MARK: Private Instance Interface
    
    private var endIndex: Int {
        count! - 1
    }
    
    private func decode(for key: StringCodingKey, orThrowFor desiredType: Any.Type) throws -> PrimitiveValue {
        guard let valueStorage = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(desiredType, .obvious(codingPath))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath,
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            return value
        }
    }
    
    private func nextUnkeyedDecodingKey() -> StringCodingKey {
        defer {
            currentIndex += 1
        }
        
        return StringCodingKey(intValue: currentIndex)
    }
}

// MARK: - KeyedDecodingContainerProtocol Extension

extension DecodingContainer: KeyedDecodingContainerProtocol {
    // MARK: Public Instance Interface
    
    public var allKeys: [StringCodingKey] {
        storage.keys.map(StringCodingKey.init)
    }
    
    public func contains(_ key: StringCodingKey) -> Bool {
        storage[key.stringValue] != nil
    }
    
    public func decode(_ type: Bool.Type, forKey key: StringCodingKey) throws -> Bool {
        let primitiveValue = try decode(for: key, orThrowFor: type)
        
        guard let value = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: String.Type, forKey key: StringCodingKey) throws -> String {
        let primitiveValue = try decode(for: key, orThrowFor: type)
        
        guard let value = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Double.Type, forKey key: StringCodingKey) throws -> Double {
        let primitiveValue = try decode(for: key, orThrowFor: type)
        
        guard let value = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Float.Type, forKey key: StringCodingKey) throws -> Float {
        let primitiveValue = try decode(for: key, orThrowFor: type)
        
        guard let value = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Int.Type, forKey key: StringCodingKey) throws -> Int {
        let primitiveValue = try decode(for: key, orThrowFor: type)
        
        guard let value = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Int8.Type, forKey key: StringCodingKey) throws -> Int8 {
        let primitiveValue = try decode(for: key, orThrowFor: type)
        
        guard let value = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Int16.Type, forKey key: StringCodingKey) throws -> Int16 {
        let primitiveValue = try decode(for: key, orThrowFor: type)
        
        guard let value = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Int32.Type, forKey key: StringCodingKey) throws -> Int32 {
        let primitiveValue = try decode(for: key, orThrowFor: type)
        
        guard let value = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Int64.Type, forKey key: StringCodingKey) throws -> Int64 {
        let primitiveValue = try decode(for: key, orThrowFor: type)
        
        guard let value = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: UInt.Type, forKey key: StringCodingKey) throws -> UInt {
        let primitiveValue = try decode(for: key, orThrowFor: type)
        
        guard let value = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: UInt8.Type, forKey key: StringCodingKey) throws -> UInt8 {
        let primitiveValue = try decode(for: key, orThrowFor: type)
        
        guard let value = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: UInt16.Type, forKey key: StringCodingKey) throws -> UInt16 {
        let primitiveValue = try decode(for: key, orThrowFor: type)
        
        guard let value = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: UInt32.Type, forKey key: StringCodingKey) throws -> UInt32 {
        let primitiveValue = try decode(for: key, orThrowFor: type)
        
        guard let value = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: UInt64.Type, forKey key: StringCodingKey) throws -> UInt64 {
        let primitiveValue = try decode(for: key, orThrowFor: type)
        
        guard let value = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode<T>(_ type: T.Type, forKey key: StringCodingKey) throws -> T where T : Decodable {
        guard let valueStorage = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(key)))
        }
        
        switch valueStorage {
        case let .container(container):
            let lowLevelDecoder = LowLevelDecoder2(container: container)
            return try T(from: lowLevelDecoder)
        case .primitiveValue:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath,
                    debugDescription: "Cannot decode primitive as container."
                )
            )
        }
    }
    
    public func decodeNil(forKey key: StringCodingKey) throws -> Bool {
        storage[key.stringValue] == nil
    }
    
    public func nestedContainer<NestedKey>(
        keyedBy type: NestedKey.Type,
        forKey key: StringCodingKey
    ) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        guard let valueStorage = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(key)))
        }

        switch valueStorage {
        case let .container(container):
            return KeyedDecodingContainer(container.wrapped())
        case .primitiveValue:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(key),
                    debugDescription: "Cannot decode primitive value as container."
                )
            )
        }
    }
    
    public func nestedUnkeyedContainer(forKey key: StringCodingKey) throws -> UnkeyedDecodingContainer {
        guard let valueStorage = storage[key.stringValue] else {
            throw DecodingError.keyNotFound(key, .obvious(codingPath))
        }

        switch valueStorage {
        case let .container(container):
            return container
        case .primitiveValue:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(key),
                    debugDescription: "Cannot decode primitive value as container."
                )
            )
        }
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

extension DecodingContainer: SingleValueDecodingContainer {
    // NO-OP
}

// MARK: - UnkeyedDecodingContainer Extension

extension DecodingContainer: UnkeyedDecodingContainer {
    // MARK: Public Instance Interface
    
    public var count: Int? {
        storage.count
    }
    
    public var isAtEnd: Bool {
        endIndex < currentIndex
    }
    
    public func decode(_ type: Bool.Type) throws -> Bool {
        let nextCodingKey = nextUnkeyedDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: Double.Type) throws -> Double {
        let nextCodingKey = nextUnkeyedDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: Float.Type) throws -> Float {
        let nextCodingKey = nextUnkeyedDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: Int.Type) throws -> Int {
        let nextCodingKey = nextUnkeyedDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: Int8.Type) throws -> Int8 {
        let nextCodingKey = nextUnkeyedDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: Int16.Type) throws -> Int16 {
        let nextCodingKey = nextUnkeyedDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: Int32.Type) throws -> Int32 {
        let nextCodingKey = nextUnkeyedDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: Int64.Type) throws -> Int64 {
        let nextCodingKey = nextUnkeyedDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: String.Type) throws -> String {
        let nextCodingKey = nextUnkeyedDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: UInt.Type) throws -> UInt {
        let nextCodingKey = nextUnkeyedDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: UInt8.Type) throws -> UInt8 {
        let nextCodingKey = nextUnkeyedDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: UInt16.Type) throws -> UInt16 {
        let nextCodingKey = nextUnkeyedDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: UInt32.Type) throws -> UInt32 {
        let nextCodingKey = nextUnkeyedDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: UInt64.Type) throws -> UInt64 {
        let nextCodingKey = nextUnkeyedDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode<Target>(_ type: Target.Type) throws -> Target where Target: Decodable {
        let nextCodingKey = nextUnkeyedDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decodeNil() -> Bool {
        let nextCodingKey = nextUnkeyedDecodingKey()
        
        return (try? decodeNil(forKey: nextCodingKey)) ?? false
    }
    
    public func nestedContainer<NestedKey>(
        keyedBy type: NestedKey.Type
    ) throws -> KeyedDecodingContainer<NestedKey> where NestedKey: CodingKey {
        let nextCodingKey = nextUnkeyedDecodingKey()
        
        return try nestedContainer(keyedBy: type, forKey: nextCodingKey)
    }
    
    public func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        let nextCodingKey = nextUnkeyedDecodingKey()
        
        return try nestedUnkeyedContainer(forKey: nextCodingKey)
    }
}

// MARK: - DecodingContainer.Storage Definition

extension DecodingContainer {
    public enum Storage {
        case container(DecodingContainer<PrimitiveValue>)
        case primitiveValue(PrimitiveValue)
    }
}

extension DecodingContainer {
    public struct Wrapper<Key> where Key: CodingKey {
        private let base: DecodingContainer
                
        // MARK: public Initialization
        
        public init(_ base: DecodingContainer) {
            self.base = base
        }
    }
}

extension DecodingContainer.Wrapper: KeyedDecodingContainerProtocol {
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

extension DecodingContainer: CustomDebugStringConvertible {
    public var debugDescription: String {
        storage.debugDescription
    }
}
