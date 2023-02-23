//
//  DecodingContainer+MultiValue.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 2/21/23.
//

import Common

extension DecodingContainer {
    public final class MultiValue {
        public private(set) var codingPath: [any CodingKey]
        public private(set) var currentIndex: Int
        
        public var storage: [String: DecodingContainer<PrimitiveValue>]
        
        // MARK: Public Initialization
        
        public init(codingPath: [any CodingKey]) {
            self.codingPath = codingPath
            
            currentIndex = 0
            storage = [:]
        }
        
        // MARK: Public Instance Interface

        public func wrapped<Key>() -> Wrapper<Key> {
            Wrapper(self)
        }
        
        // MARK: Private Instance Interface
        
        private var endIndex: Int {
            storage.count - 1
        }
        
        private func decode(for key: StringCodingKey, orThrowFor desiredType: Any.Type) throws -> PrimitiveValue {
            guard let valueStorage = storage[key.stringValue] else {
                throw DecodingError.valueNotFound(desiredType, .obvious(codingPath))
            }
            
            switch valueStorage {
            case .empty:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: codingPath,
                        debugDescription: "Cannot decode empty as primitive value."
                    )
                )
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
}

// MARK: - KeyedDecodingContainerProtocol Extension

extension DecodingContainer.MultiValue: KeyedDecodingContainerProtocol {
    // MARK: Public Instance Interface
    
    public var allKeys: [StringCodingKey] {
        storage.keys.map(StringCodingKey.init(stringValue:))
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
        case let .empty(container):
            return container.decodeNil()
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
        case let .empty(container):
            return KeyedDecodingContainer(container.wrapped())
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
        case let .empty(container):
            return container
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

// MARK: - UnkeyedDecodingContainer Extension

extension DecodingContainer.MultiValue: UnkeyedDecodingContainer {
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
