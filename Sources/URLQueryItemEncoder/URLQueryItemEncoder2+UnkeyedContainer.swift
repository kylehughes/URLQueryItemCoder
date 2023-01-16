//
//  URLQueryItemEncoder+UnkeyedContainer.swift
//  URLQueryItemEncoder
//
//  Created by Kyle Hughes on 1/15/23.
//

import Foundation

@_implementationOnly import Common

extension URLQueryItemEncoder2 {
    internal struct UnkeyedContainer {
        internal private(set) var codingPath: [any CodingKey]
        internal private(set) var count: Int
        internal private(set) var storage: [Container]
        
        // MARK: Internal Initialization
        
        internal init(codingPath: [any CodingKey]) {
            self.codingPath = codingPath
            
            count = 0
            storage = []
        }
        
        // MARK: Private Instance Interface
        
        private mutating func nextCodingKey() -> IntCodingKey {
            defer {
                count += 1
            }
            
            return IntCodingKey(intValue: count)
        }
    }
}

// MARK: - UnkeyedEncodingContainer Extension

extension URLQueryItemEncoder2.UnkeyedContainer: UnkeyedEncodingContainer {
    // MARK: Internal Instance Interface
    
    internal mutating func encode(_ value: Bool) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.single(container))
    }
    
    internal mutating func encode(_ value: String) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.single(container))
    }
    
    internal mutating func encode(_ value: Double) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.single(container))
    }
    
    internal mutating func encode(_ value: Float) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.single(container))
    }
    
    internal mutating func encode(_ value: Int) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.single(container))
    }
    
    internal mutating func encode(_ value: Int8) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.single(container))
    }
    
    internal mutating func encode(_ value: Int16) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.single(container))
    }
    
    internal mutating func encode(_ value: Int32) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.single(container))
    }
    
    internal mutating func encode(_ value: Int64) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.single(container))
    }
    
    internal mutating func encode(_ value: UInt) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.single(container))
    }
    
    internal mutating func encode(_ value: UInt8) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.single(container))
    }
    
    internal mutating func encode(_ value: UInt16) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.single(container))
    }
    
    internal mutating func encode(_ value: UInt32) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.single(container))
    }
    
    internal mutating func encode(_ value: UInt64) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        
        try container.encode(value)
        
        storage.append(.single(container))
    }
    
    internal mutating func encode<T>(_ value: T) throws where T : Encodable {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let lowLevelEncoder = URLQueryItemEncoder2.LowLevelEncoder(codingPath: nextCodingPath)
        
        try value.encode(to: lowLevelEncoder)
        
        guard let nestedStorage = lowLevelEncoder.storage else {
            fatalError("IDK is this possuble?")
        }
        
        storage.append(nestedStorage)
    }
    
    internal mutating func encodeNil() throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = URLQueryItemEncoder2.SingleValueContainer(codingPath: nextCodingPath)
        
        try container.encodeNil()
        
        storage.append(.single(container))
    }
    
    internal mutating func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = URLQueryItemEncoder2.StringlyKeyedContainer(codingPath: nextCodingPath)

        storage.append(.keyed(container))
        
        return KeyedEncodingContainer(URLQueryItemEncoder2.KeyedContainer(container))
    }
    
    internal mutating func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = URLQueryItemEncoder2.UnkeyedContainer(codingPath: nextCodingPath)
        
        storage.append(.unkeyed(container))
        
        return container
    }
    
    internal mutating func superEncoder() -> Encoder {
        fatalError("No clue how to implement this? Or what it wants?")
    }
}
