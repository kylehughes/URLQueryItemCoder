//
//  URLQueryItemEncoder.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 12/27/22.
//

import Foundation

public struct URLQueryItemEncoder {
    // MARK: Public Instance Interface
    
    public func encode<T: Encodable>(_ value: T) throws -> [URLQueryItem] {
        let partial = URLQueryItemEncoderPartial()
        let lowLevelEncoder = URLQueryItemLowLevelEncoder(partial: partial, codingPath: [])
        
        try value.encode(to: lowLevelEncoder)
        
        return partial.finalize()
    }
}

// MARK: - URLQueryItemLowLevelEncoder Definition

private struct URLQueryItemLowLevelEncoder {
    public let userInfo: [CodingUserInfoKey: Any]
    
    public private(set) var codingPath: [any CodingKey]
    
    private let partial: URLQueryItemEncoderPartial
    
    // MARK: Public Initialization
    
    public init(partial: URLQueryItemEncoderPartial, codingPath: [any CodingKey]) {
        self.partial = partial
        self.codingPath = codingPath
        
        userInfo = [:]
    }
}

// MARK: - Encoder Extension

extension URLQueryItemLowLevelEncoder: Encoder {
    // MARK: Public Instance Interface
    
    func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key: CodingKey {
        let container = URLQueryItemEncoderKeyedEncodingContainer<Key>(partial: partial, codingPath: codingPath)
        
        return KeyedEncodingContainer(container)
    }
    
    func singleValueContainer() -> SingleValueEncodingContainer {
        URLQueryItemEncoderSingleValueEncodingContainer(partial: partial, codingPath: codingPath)
    }
    
    func unkeyedContainer() -> UnkeyedEncodingContainer {
        URLQueryItemEncoderUnkeyedEncodingContainer(partial: partial, codingPath: codingPath)
    }
}

// MARK: - URLQueryItemEncoderPartial Definition

private class URLQueryItemEncoderPartial {
    private var storage: [String: String?]
    
    // MARK: Public Initialization
    
    public init() {
        storage = [:]
    }
    
    // MARK: Public Instance Interface
    
    public func encode(_ codingPath: [CodingKey], losslesslyAs value: (some LosslessStringConvertible)?) {
        guard let value else {
            encode(codingPath, as: nil)
            return
        }
        
        encode(codingPath, as: String(value))
    }
    
    public func encode(_ codingPath: [CodingKey], as value: String?) {
        let key = codingPath.map(\.stringValue).joined(separator: ".")
        storage[key] = value
    }
    
    public func finalize() -> [URLQueryItem] {
        storage
            .keys
            .sorted()
            .map { key in
                URLQueryItem(name: key, value: storage[key] ?? nil)
            }
    }
}

// MARK: - URLQueryItemEncoderKeyedEncodingContainer Definition

private struct URLQueryItemEncoderKeyedEncodingContainer<Key> where Key: CodingKey {
    public private(set) var codingPath: [any CodingKey]
    
    private let partial: URLQueryItemEncoderPartial
    
    // MARK: Public Initialization
    
    public init(partial: URLQueryItemEncoderPartial, codingPath: [any CodingKey]) {
        self.partial = partial
        self.codingPath = codingPath
    }
}

// MARK: - KeyedEncodingContainerProtocol Extension

extension URLQueryItemEncoderKeyedEncodingContainer: KeyedEncodingContainerProtocol {
    // MARK: Public Instance Interface
    
    mutating public func encode(_ value: Bool, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: String, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, as: value)
    }
    
    mutating public func encode(_ value: Double, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Float, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Int, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Int8, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Int16, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Int32, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Int64, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: UInt, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: UInt8, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: UInt16, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: UInt32, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: UInt64, forKey key: Key) throws {
        let nextCodingPath = codingPath.appending(key)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
        let lowLevelEncoder = URLQueryItemLowLevelEncoder(partial: partial, codingPath: codingPath.appending(key))
        
        try value.encode(to: lowLevelEncoder)
    }
    
    mutating public func encodeNil(forKey key: Key) throws {
        partial.encode(codingPath.appending(key), as: nil)
    }
    
    mutating public func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type,
        forKey key: Key
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey: CodingKey {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemEncoderKeyedEncodingContainer<NestedKey>(
            partial: partial,
            codingPath: nextCodingPath
        )
        
        return KeyedEncodingContainer(container)
    }
    
    mutating public func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        let nextCodingPath = codingPath.appending(key)
        
        return URLQueryItemEncoderUnkeyedEncodingContainer(partial: partial, codingPath: nextCodingPath)
    }
    
    mutating public func superEncoder() -> Encoder {
        let key = Key(stringValue: "super")!
        
        return superEncoder(forKey: key)
    }
    
    mutating public func superEncoder(forKey key: Key) -> Encoder {
        let nextCodingPath = codingPath.appending(key)
        
        return URLQueryItemLowLevelEncoder(partial: partial, codingPath: nextCodingPath)
    }
}

// MARK: - URLQueryItemEncoderSingleValueEncodingContainer Definition

private struct URLQueryItemEncoderSingleValueEncodingContainer {
    public private(set) var codingPath: [any CodingKey]
    
    private let partial: URLQueryItemEncoderPartial
    
    // MARK: Public Initialization
    
    public init(partial: URLQueryItemEncoderPartial, codingPath: [any CodingKey]) {
        self.partial = partial
        self.codingPath = codingPath
    }
}

// MARK: - SingleValueEncodingContainer Extension

extension URLQueryItemEncoderSingleValueEncodingContainer: SingleValueEncodingContainer {
    // MARK: Public Instance Interface
    
    mutating public func encode(_ value: Bool) throws {
        partial.encode(codingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: String) throws {
        partial.encode(codingPath, as: value)
    }
    
    mutating public func encode(_ value: Double) throws {
        partial.encode(codingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Float) throws {
        partial.encode(codingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Int) throws {
        partial.encode(codingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Int8) throws {
        partial.encode(codingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Int16) throws {
        partial.encode(codingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Int32) throws {
        partial.encode(codingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Int64) throws {
        partial.encode(codingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: UInt) throws {
        partial.encode(codingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: UInt8) throws {
        partial.encode(codingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: UInt16) throws {
        partial.encode(codingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: UInt32) throws {
        partial.encode(codingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: UInt64) throws {
        partial.encode(codingPath, losslesslyAs: value)
    }
    
    mutating public func encode<T>(_ value: T) throws where T: Encodable {
        let lowLevelEncoder = URLQueryItemLowLevelEncoder(partial: partial, codingPath: codingPath)
        
        try value.encode(to: lowLevelEncoder)
    }
    
    mutating public func encodeNil() throws {
        partial.encode(codingPath, as: nil)
    }
}

// MARK: - URLQueryItemEncoderUnkeyedEncodingContainer Definition

private struct URLQueryItemEncoderUnkeyedEncodingContainer {
    public private(set) var codingPath: [any CodingKey]
    public private(set) var count: Int
    
    private let partial: URLQueryItemEncoderPartial
    
    // MARK: Public Initialization
    
    public init(partial: URLQueryItemEncoderPartial, codingPath: [any CodingKey]) {
        self.partial = partial
        self.codingPath = codingPath
        
        count = 0
    }
    
    // MARK: Private Instance Interface
    
    private mutating func nextCodingKey() -> IndexCodingKey {
        defer {
            count += 1
        }
        
        return IndexCodingKey(intValue: count)
    }
}

// MARK: - UnkeyedEncodingContainer Extension

extension URLQueryItemEncoderUnkeyedEncodingContainer: UnkeyedEncodingContainer {
    // MARK: Public Instance Interface
    
    mutating public func encode(_ value: Bool) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: String) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encode(nextCodingPath, as: value)
    }
    
    mutating public func encode(_ value: Double) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Float) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Int) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Int8) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Int16) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Int32) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: Int64) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: UInt) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: UInt8) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: UInt16) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: UInt32) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode(_ value: UInt64) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)

        partial.encode(nextCodingPath, losslesslyAs: value)
    }
    
    mutating public func encode<T>(_ value: T) throws where T : Encodable {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let lowLevelEncoder = URLQueryItemLowLevelEncoder(partial: partial, codingPath: nextCodingPath)
        
        try value.encode(to: lowLevelEncoder)
    }
    
    mutating public func encodeNil() throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encode(nextCodingPath, as: nil)
    }
    
    mutating public func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = URLQueryItemEncoderKeyedEncodingContainer<NestedKey>(
            partial: partial,
            codingPath: nextCodingPath
        )
        
        return KeyedEncodingContainer(container)
    }
    
    mutating public func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        return Self(partial: partial, codingPath: nextCodingPath)
    }
    
    mutating public func superEncoder() -> Encoder {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        return URLQueryItemLowLevelEncoder(partial: partial, codingPath: nextCodingPath)
    }
}

// MARK: - URLQueryItemEncoderUnkeyedEncodingContainer IndexCodingKey Definition

extension URLQueryItemEncoderUnkeyedEncodingContainer {
    private struct IndexCodingKey: CodingKey {
        public let intValue: Int?
        public let stringValue: String
        
        // MARK: Public Initialization

        public init(intValue: Int) {
            self.intValue = intValue
            self.stringValue = String(intValue)
        }

        public init?(stringValue: String) {
            assertionFailure("Should only use integer initializer.")
            
            return nil
        }
    }
}
