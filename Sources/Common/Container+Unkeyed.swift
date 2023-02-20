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
        public private(set) var storage: [Container]
        
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

// MARK: - UnkeyedEncodingContainer Extension

extension Container.Unkeyed: UnkeyedEncodingContainer {
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
