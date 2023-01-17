//
//  Container+Unkeyed.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/15/23.
//

extension Container {
    public final class Unkeyed {
        public private(set) var codingPath: [any CodingKey]
        public private(set) var currentIndex: Int
        public private(set) var storage: [Container<Representation>]
        
        private var _count: Int
        
        // MARK: public Initialization
        
        public init(codingPath: [any CodingKey]) {
            self.codingPath = codingPath
            
            _count = 0
            storage = []
            currentIndex = storage.startIndex
        }
        
        // MARK: Private Instance Interface
        
        private var endIndex: Int {
            storage.endIndex
        }
        
        private func nextDecodingKey() -> IntCodingKey {
            defer {
                currentIndex += 1
            }
            
            return IntCodingKey(intValue: currentIndex)
        }
        
        private func nextEncodingKey() -> IntCodingKey {
            defer {
                _count += 1
            }
            
            return IntCodingKey(intValue: _count)
        }
    }
}

// MARK: - UnkeyedDecodingContainer Extension

extension Container.Unkeyed: UnkeyedDecodingContainer where Representation == PrimitiveValue.Unknown {
    // MARK: Public Instance Interface
    
    public var count: Int? {
        _count
    }
    
    public var isAtEnd: Bool {
        endIndex < currentIndex
    }
    
    public func decode(_ type: Bool.Type) throws -> Bool {
        let container = storage[currentIndex]
        let nextCodingKey = nextDecodingKey()
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: StringCodingKey(stringValue: nextCodingKey.stringValue))
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: Double.Type) throws -> Double {
        let container = storage[currentIndex]
        let nextCodingKey = nextDecodingKey()
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: StringCodingKey(stringValue: nextCodingKey.stringValue))
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: Float.Type) throws -> Float {
        let container = storage[currentIndex]
        let nextCodingKey = nextDecodingKey()
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: StringCodingKey(stringValue: nextCodingKey.stringValue))
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: Int.Type) throws -> Int {
        let container = storage[currentIndex]
        let nextCodingKey = nextDecodingKey()
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: StringCodingKey(stringValue: nextCodingKey.stringValue))
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: Int8.Type) throws -> Int8 {
        let container = storage[currentIndex]
        let nextCodingKey = nextDecodingKey()
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: StringCodingKey(stringValue: nextCodingKey.stringValue))
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: Int16.Type) throws -> Int16 {
        let container = storage[currentIndex]
        let nextCodingKey = nextDecodingKey()
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: StringCodingKey(stringValue: nextCodingKey.stringValue))
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: Int32.Type) throws -> Int32 {
        let container = storage[currentIndex]
        let nextCodingKey = nextDecodingKey()
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: StringCodingKey(stringValue: nextCodingKey.stringValue))
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: Int64.Type) throws -> Int64 {
        let container = storage[currentIndex]
        let nextCodingKey = nextDecodingKey()
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: StringCodingKey(stringValue: nextCodingKey.stringValue))
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: String.Type) throws -> String {
        let container = storage[currentIndex]
        let nextCodingKey = nextDecodingKey()
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: StringCodingKey(stringValue: nextCodingKey.stringValue))
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: UInt.Type) throws -> UInt {
        let container = storage[currentIndex]
        let nextCodingKey = nextDecodingKey()
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: StringCodingKey(stringValue: nextCodingKey.stringValue))
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: UInt8.Type) throws -> UInt8 {
        let container = storage[currentIndex]
        let nextCodingKey = nextDecodingKey()
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: StringCodingKey(stringValue: nextCodingKey.stringValue))
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: UInt16.Type) throws -> UInt16 {
        let container = storage[currentIndex]
        let nextCodingKey = nextDecodingKey()
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: StringCodingKey(stringValue: nextCodingKey.stringValue))
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: UInt32.Type) throws -> UInt32 {
        let container = storage[currentIndex]
        let nextCodingKey = nextDecodingKey()
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: StringCodingKey(stringValue: nextCodingKey.stringValue))
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
        }
    }
    
    public func decode(_ type: UInt64.Type) throws -> UInt64 {
        let container = storage[currentIndex]
        let nextCodingKey = nextDecodingKey()
        
        switch container {
        case let .keyed(container):
            return try container.decode(type, forKey: StringCodingKey(stringValue: nextCodingKey.stringValue))
        case let .singleValue(container):
            return try container.decode(type)
        case let .unkeyed(container):
            return try container.decode(type)
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
    
    public func decodeNil() throws -> Bool {
        let container = storage[currentIndex]
        let nextCodingKey = nextDecodingKey()
        
        switch container {
        case let .keyed(container):
            return try container.decodeNil(forKey: StringCodingKey(stringValue: nextCodingKey.stringValue))
        case let .singleValue(container):
            return container.decodeNil()
        case let .unkeyed(container):
            return try container.decodeNil()
        }
    }
    
    public func nestedContainer<NestedKey>(
        keyedBy type: NestedKey.Type
    ) throws -> KeyedDecodingContainer<NestedKey> where NestedKey: CodingKey {
        let container = storage[currentIndex]
        let nextCodingKey = nextDecodingKey()
        
        switch container {
        case let .keyed(container):
            return KeyedDecodingContainer(container.wrapped())
        case .singleValue:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(nextCodingKey),
                    debugDescription: "Cannot decode single value container as keyed container."
                )
            )
        case .unkeyed:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(nextCodingKey),
                    debugDescription: "Cannot decode unkeyed container as keyed container."
                )
            )
        }
    }
    
    public func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        let container = storage[currentIndex]
        let nextCodingKey = nextDecodingKey()
        
        switch container {
        case .keyed:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(nextCodingKey),
                    debugDescription: "Cannot decode keyed container as unkeyed container."
                )
            )
        case .singleValue:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath.appending(nextCodingKey),
                    debugDescription: "Cannot decode single value container as unkeyed container."
                )
            )
        case let .unkeyed(container):
            return container
        }
    }
    
    public func superDecoder() throws -> Decoder {
        // TODO: really no clue how this should be implemented? This seems like the only thing I can do?
        // this can't possibly be correct
        LowLevelDecoder(codingPath: codingPath)
    }
}

// MARK: - UnkeyedEncodingContainer Extension

extension Container.Unkeyed: UnkeyedEncodingContainer where Representation == PrimitiveValue.Known {
    // MARK: Public Instance Interface
    
    public var count: Int {
        _count
    }
    
    public func encode(_ value: Bool) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.singleValue(container))
    }
    
    public func encode(_ value: String) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.singleValue(container))
    }
    
    public func encode(_ value: Double) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.singleValue(container))
    }
    
    public func encode(_ value: Float) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.singleValue(container))
    }
    
    public func encode(_ value: Int) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.singleValue(container))
    }
    
    public func encode(_ value: Int8) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.singleValue(container))
    }
    
    public func encode(_ value: Int16) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.singleValue(container))
    }
    
    public func encode(_ value: Int32) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.singleValue(container))
    }
    
    public func encode(_ value: Int64) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.singleValue(container))
    }
    
    public func encode(_ value: UInt) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.singleValue(container))
    }
    
    public func encode(_ value: UInt8) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.singleValue(container))
    }
    
    public func encode(_ value: UInt16) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.singleValue(container))
    }
    
    public func encode(_ value: UInt32) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.singleValue(container))
    }
    
    public func encode(_ value: UInt64) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.singleValue(container))
    }
    
    public func encode<T>(_ value: T) throws where T : Encodable {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let lowLevelEncoder = LowLevelEncoder(codingPath: nextCodingPath)
        
        try value.encode(to: lowLevelEncoder)
        
        guard let nestedStorage = lowLevelEncoder.storage else {
            fatalError("IDK is this possuble?")
        }
        
        storage.append(nestedStorage)
    }
    
    public func encodeNil() throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = Container.SingleValue(codingPath: nextCodingPath)
        
        try container.encodeNil()
        
        storage.append(.singleValue(container))
    }
    
    public func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = Container.Keyed(codingPath: nextCodingPath)

        storage.append(.keyed(container))
        
        return KeyedEncodingContainer(container.wrapped())
    }
    
    public func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = Container.Unkeyed(codingPath: nextCodingPath)
        
        storage.append(.unkeyed(container))
        
        return container
    }
    
    public func superEncoder() -> Encoder {
        fatalError("No clue how to implement this? Or what it wants?")
    }
}
