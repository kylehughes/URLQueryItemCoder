//
//  DecodingContainer.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/19/23.
//

public final class DecodingContainer<PrimitiveValue> where PrimitiveValue: DecodingPrimitiveValue {
    public private(set) var codingPath: [any CodingKey]
    public private(set) var count: Int?
    public private(set) var currentIndex: Int
    public var storage: [String: Storage]
    
    // MARK: Public Initialization
    
    public init(codingPath: [any CodingKey]) {
        self.codingPath = codingPath
        
        count = 0
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
        (count ?? 0) - 1
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
        guard let valueStorage = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
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
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: String.Type, forKey key: StringCodingKey) throws -> String {
        guard let valueStorage = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
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
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Double.Type, forKey key: StringCodingKey) throws -> Double {
        guard let valueStorage = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
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
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Float.Type, forKey key: StringCodingKey) throws -> Float {
        guard let valueStorage = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
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
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Int.Type, forKey key: StringCodingKey) throws -> Int {
        guard let valueStorage = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
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
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Int8.Type, forKey key: StringCodingKey) throws -> Int8 {
        guard let valueStorage = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
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
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Int16.Type, forKey key: StringCodingKey) throws -> Int16 {
        guard let valueStorage = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
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
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Int32.Type, forKey key: StringCodingKey) throws -> Int32 {
        guard let valueStorage = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
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
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Int64.Type, forKey key: StringCodingKey) throws -> Int64 {
        guard let valueStorage = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
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
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: UInt.Type, forKey key: StringCodingKey) throws -> UInt {
        guard let valueStorage = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
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
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: UInt8.Type, forKey key: StringCodingKey) throws -> UInt8 {
        guard let valueStorage = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
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
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: UInt16.Type, forKey key: StringCodingKey) throws -> UInt16 {
        guard let valueStorage = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
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
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: UInt32.Type, forKey key: StringCodingKey) throws -> UInt32 {
        guard let valueStorage = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
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
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: UInt64.Type, forKey key: StringCodingKey) throws -> UInt64 {
        guard let valueStorage = storage[key.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
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
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode<T>(_ type: T.Type, forKey key: StringCodingKey) throws -> T where T : Decodable {
        let nextCodingPath = codingPath.appending(key)
        let lowLevelDecoder = LowLevelDecoder(codingPath: nextCodingPath)
        
        // TODO: I feel like I'm doing something wrong here… not reaching for the container? what storage does this
        // decoder have? should I be giving it the container that I have at my index? probably. I'll probably have to
        // modify the initializer
        
        return try T(from: lowLevelDecoder)
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
        
        // TODO: I feel like there's other stuff to do here… do i need to check what type of container? no ig uess not
        // if it's wrong it will fail

        switch valueStorage {
        case let .container(container):
            return KeyedDecodingContainer(
                container.wrapped()
            )
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
        
        // TODO: I feel like there's other stuff to do here… do i need to check what type of container? no ig uess not
        // if it's wrong it will fail

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
    
    public var isAtEnd: Bool {
        endIndex < currentIndex
    }
    
    public func decode(_ type: Bool.Type) throws -> Bool {
        let nextCodingKey = nextDecodingKey()
        
        guard let valueStorage = storage[nextCodingKey.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(nextCodingKey)))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(nextCodingKey),
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Double.Type) throws -> Double {
        let nextCodingKey = nextDecodingKey()
        
        guard let valueStorage = storage[nextCodingKey.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(nextCodingKey)))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(nextCodingKey),
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Float.Type) throws -> Float {
        let nextCodingKey = nextDecodingKey()
        
        guard let valueStorage = storage[nextCodingKey.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(nextCodingKey)))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(nextCodingKey),
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Int.Type) throws -> Int {
        let nextCodingKey = nextDecodingKey()
        
        guard let valueStorage = storage[nextCodingKey.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(nextCodingKey)))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(nextCodingKey),
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Int8.Type) throws -> Int8 {
        let nextCodingKey = nextDecodingKey()
        
        guard let valueStorage = storage[nextCodingKey.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(nextCodingKey)))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(nextCodingKey),
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Int16.Type) throws -> Int16 {
        let nextCodingKey = nextDecodingKey()
        
        guard let valueStorage = storage[nextCodingKey.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(nextCodingKey)))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(nextCodingKey),
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Int32.Type) throws -> Int32 {
        let nextCodingKey = nextDecodingKey()
        
        guard let valueStorage = storage[nextCodingKey.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(nextCodingKey)))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(nextCodingKey),
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Int64.Type) throws -> Int64 {
        let nextCodingKey = nextDecodingKey()
        
        guard let valueStorage = storage[nextCodingKey.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(nextCodingKey)))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(nextCodingKey),
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: String.Type) throws -> String {
        let nextCodingKey = nextDecodingKey()
        
        guard let valueStorage = storage[nextCodingKey.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(nextCodingKey)))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(nextCodingKey),
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: UInt.Type) throws -> UInt {
        let nextCodingKey = nextDecodingKey()
        
        guard let valueStorage = storage[nextCodingKey.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(nextCodingKey)))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(nextCodingKey),
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: UInt8.Type) throws -> UInt8 {
        let nextCodingKey = nextDecodingKey()
        
        guard let valueStorage = storage[nextCodingKey.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(nextCodingKey)))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(nextCodingKey),
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: UInt16.Type) throws -> UInt16 {
        let nextCodingKey = nextDecodingKey()
        
        guard let valueStorage = storage[nextCodingKey.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(nextCodingKey)))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(nextCodingKey),
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: UInt32.Type) throws -> UInt32 {
        let nextCodingKey = nextDecodingKey()
        
        guard let valueStorage = storage[nextCodingKey.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(nextCodingKey)))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(nextCodingKey),
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: UInt64.Type) throws -> UInt64 {
        let nextCodingKey = nextDecodingKey()
        
        guard let valueStorage = storage[nextCodingKey.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(nextCodingKey)))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(nextCodingKey),
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode<Target>(_ type: Target.Type) throws -> Target where Target: Decodable {
        let nextCodingKey = nextDecodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        // TODO: I feel like I'm doing something wrong here… not reaching for the container? what storage does this
        // decoder have? should I be giving it the container that I have at my index? probably. I'll probably have to
        // modify the initializer
        
        let lowLevelDecoder = LowLevelDecoder(codingPath: nextCodingPath)
        
        return try Target(from: lowLevelDecoder)
    }
    
    public func decodeNil() -> Bool {
        let nextCodingKey = nextDecodingKey()
        
        return storage[nextCodingKey.stringValue] == nil
    }
    
    public func nestedContainer<NestedKey>(
        keyedBy type: NestedKey.Type
    ) throws -> KeyedDecodingContainer<NestedKey> where NestedKey: CodingKey {
        let nextCodingKey = nextDecodingKey()
        
        guard let valueStorage = storage[nextCodingKey.stringValue] else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath.appending(nextCodingKey)))
        }
        
        switch valueStorage {
        case let .container(container):
            return KeyedDecodingContainer(
                container.wrapped()
            )
        case .primitiveValue:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(nextCodingKey),
                    debugDescription: "Cannot decode primitive value as container."
                )
            )
        }
    }
    
    public func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        let nextCodingKey = nextDecodingKey()

        guard let valueStorage = storage[nextCodingKey.stringValue] else {
            throw DecodingError.keyNotFound(nextCodingKey, .obvious(codingPath))
        }
        
        switch valueStorage {
        case let .container(container):
            return container
        case .primitiveValue:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(nextCodingKey),
                    debugDescription: "Cannot decode primitive value as container."
                )
            )
        }
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
