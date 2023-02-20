//
//  DecodingContainer.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/19/23.
//

public enum DecodingContainerType<PrimitiveValue> where PrimitiveValue: DecodingPrimitiveValue {
    case multiValue(DecodingContainer<PrimitiveValue>)
    case singleValue(DecodingContainer<PrimitiveValue>.SingleValue)
    
    // MARK: Public Static Interface
    
    public static var singleValue: Self {
        .singleValue(at: [])
    }
    
    public static func singleValue(at codingPath: [any CodingKey]) -> Self {
        .singleValue(DecodingContainer<PrimitiveValue>.SingleValue(codingPath: codingPath))
    }
}

public final class DecodingContainer<PrimitiveValue> where PrimitiveValue: DecodingPrimitiveValue {
    public private(set) var codingPath: [any CodingKey]
    public private(set) var currentIndex: Int
    public var storage: [String: DecodingContainerType<PrimitiveValue>]
    
    // MARK: Public Initialization
    
    public init(codingPath: [any CodingKey]) {
        self.codingPath = codingPath
        
        currentIndex = 0
        storage = [:]
    }
    
    // MARK: Public Instance Interface

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
        case .multiValue:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath,
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .singleValue(container):
            guard let storage = container.storage else {
                throw DecodingError.valueNotFound(desiredType, .obvious(codingPath))
            }
            
            return storage
        }
    }
    
    private func nextDecodingKey() -> StringCodingKey {
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
        
        let lowLevelDecoder = LowLevelDecoder(container: valueStorage)
        
        return try T(from: lowLevelDecoder)
    }
    
    public func decodeNil(forKey key: StringCodingKey) throws -> Bool {
        switch storage[key.stringValue] {
        case .multiValue:
            return false
        case let .singleValue(container):
            return container.decodeNil()
        case .none:
            return true
        }
    }
    
    public func nestedContainer<NestedKey>(
        keyedBy type: NestedKey.Type,
        forKey key: StringCodingKey
    ) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        guard let valueStorage = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(key)))
        }
        
        switch valueStorage {
        case let .multiValue(container):
            return KeyedDecodingContainer(container.wrapped())
        case .singleValue:
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
        case let .multiValue(container):
            return container
        case .singleValue:
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
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: Double.Type) throws -> Double {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: Float.Type) throws -> Float {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: Int.Type) throws -> Int {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: Int8.Type) throws -> Int8 {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: Int16.Type) throws -> Int16 {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: Int32.Type) throws -> Int32 {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: Int64.Type) throws -> Int64 {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: String.Type) throws -> String {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: UInt.Type) throws -> UInt {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: UInt8.Type) throws -> UInt8 {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: UInt16.Type) throws -> UInt16 {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: UInt32.Type) throws -> UInt32 {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode(_ type: UInt64.Type) throws -> UInt64 {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    public func decode<Target>(_ type: Target.Type) throws -> Target where Target: Decodable {
        let nextCodingKey = nextDecodingKey()
        
        return try decode(type, forKey: nextCodingKey)
    }
    
    // TODO: fix this from returning true when this is used as a single value container;;;;;;;;;
    
    public func decodeNil() -> Bool {
        let nextCodingKey = nextDecodingKey()
        
        return (try? decodeNil(forKey: nextCodingKey)) ?? false
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
