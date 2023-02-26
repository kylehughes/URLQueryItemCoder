//
//  EncodingContainer+Unkeyed.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/15/23.
//

import Common

extension EncodingContainer {
    public final class Unkeyed {
        public private(set) var children: [EncodingContainer]
        public private(set) var codingPath: [any CodingKey]
        public private(set) var count: Int
        public private(set) var currentIndex: Int
        
        // MARK: Public Initialization
        
        public init(codingPath: [any CodingKey]) {
            self.codingPath = codingPath
            
            count = 0
            children = []
            currentIndex = children.startIndex
        }
        
        // MARK: Private Instance Interface
        
        private func nextDecodingKey() -> IntCodingKey {
            defer {
                currentIndex += 1
            }
            
            return IntCodingKey(intValue: currentIndex)
        }
        
        private func nextEncodingKey() -> IntCodingKey {
            defer {
                count += 1
            }
            
            return IntCodingKey(intValue: count)
        }
    }
}

// MARK: - UnkeyedEncodingContainer Extension

extension EncodingContainer.Unkeyed: UnkeyedEncodingContainer {
    // MARK: Public Instance Interface

    public func encode(_ value: Bool) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children.append(.singleValue(singleValueContainer))
    }
    
    public func encode(_ value: String) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children.append(.singleValue(singleValueContainer))
    }
    
    public func encode(_ value: Double) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children.append(.singleValue(singleValueContainer))
    }
    
    public func encode(_ value: Float) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children.append(.singleValue(singleValueContainer))
    }
    
    public func encode(_ value: Int) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children.append(.singleValue(singleValueContainer))
    }
    
    public func encode(_ value: Int8) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children.append(.singleValue(singleValueContainer))
    }
    
    public func encode(_ value: Int16) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children.append(.singleValue(singleValueContainer))
    }
    
    public func encode(_ value: Int32) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children.append(.singleValue(singleValueContainer))
    }
    
    public func encode(_ value: Int64) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children.append(.singleValue(singleValueContainer))
    }
    
    public func encode(_ value: UInt) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children.append(.singleValue(singleValueContainer))
    }
    
    public func encode(_ value: UInt8) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children.append(.singleValue(singleValueContainer))
    }
    
    public func encode(_ value: UInt16) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children.append(.singleValue(singleValueContainer))
    }
    
    public func encode(_ value: UInt32) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children.append(.singleValue(singleValueContainer))
    }
    
    public func encode(_ value: UInt64) throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encode(value)
        
        children.append(.singleValue(singleValueContainer))
    }
    
    public func encode<T>(_ value: T) throws where T : Encodable {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let lowLevelEncoder = LowLevelEncoder(codingPath: nextCodingPath)
        
        try value.encode(to: lowLevelEncoder)
        
        guard let container = lowLevelEncoder.container else {
            preconditionFailure("Encodable type \(T.self) was not encoded by low level encoder.")
        }
        
        children.append(container)
    }
    
    public func encodeNil() throws {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: nextCodingPath)
        
        try singleValueContainer.encodeNil()
        
        children.append(.singleValue(singleValueContainer))
    }
    
    public func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let keyedContainer = EncodingContainer.Keyed(codingPath: nextCodingPath)

        children.append(.keyed(keyedContainer))
        
        return KeyedEncodingContainer(keyedContainer.wrapped())
    }
    
    public func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        let nextCodingKey = nextEncodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let unkeyedContainer = EncodingContainer.Unkeyed(codingPath: nextCodingPath)
        
        children.append(.unkeyed(unkeyedContainer))
        
        return unkeyedContainer
    }
    
    public func superEncoder() -> Encoder {
        fatalError("No clue how to implement this? Or what it wants?")
    }
}
