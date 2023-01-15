//
//  URLQueryItemEncoder+KeyedContainer.swift
//  URLQueryItemEncoder
//
//  Created by Kyle Hughes on 1/15/23.
//

import Foundation

@_implementationOnly import Common

extension URLQueryItemEncoder2 {
    internal final class KeyedContainer<Key> where Key: CodingKey {
        internal private(set) var codingPath: [any CodingKey]
        internal private(set) var storage: [String: ContainerStorage]
                
        // MARK: Internal Initialization
        
        internal init(codingPath: [any CodingKey]) {
            self.codingPath = codingPath
            
            storage = [:]
        }
    }
}

// MARK: - KeyedEncodingContainerProtocol Extension

extension URLQueryItemEncoder2.KeyedContainer: KeyedEncodingContainerProtocol {
    // MARK: Internal Instance Interface
    
    internal func encode(_ value: Bool, forKey key: Key) throws {
        storage[key.stringValue] = .singleValue(.primitive(.bool(value)))
    }
    
    internal func encode(_ value: Double, forKey key: Key) throws {
        storage[key.stringValue] = .singleValue(.primitive(.double(value)))
    }
    
    internal func encode(_ value: Float, forKey key: Key) throws {
        storage[key.stringValue] = .singleValue(.primitive(.float(value)))
    }
    
    internal func encode(_ value: Int, forKey key: Key) throws {
        storage[key.stringValue] = .singleValue(.primitive(.int(value)))
    }
    
    internal func encode(_ value: Int8, forKey key: Key) throws {
        storage[key.stringValue] = .singleValue(.primitive(.int8(value)))
    }
    
    internal func encode(_ value: Int16, forKey key: Key) throws {
        storage[key.stringValue] = .singleValue(.primitive(.int16(value)))
    }
    
    internal func encode(_ value: Int32, forKey key: Key) throws {
        storage[key.stringValue] = .singleValue(.primitive(.int32(value)))
    }
    
    internal func encode(_ value: Int64, forKey key: Key) throws {
        storage[key.stringValue] = .singleValue(.primitive(.int64(value)))
    }
    
    internal func encode(_ value: String, forKey key: Key) throws {
        storage[key.stringValue] = .singleValue(.primitive(.string(value)))
    }
    
    internal func encode(_ value: UInt, forKey key: Key) throws {
        storage[key.stringValue] = .singleValue(.primitive(.uint(value)))
    }
    
    internal func encode(_ value: UInt8, forKey key: Key) throws {
        storage[key.stringValue] = .singleValue(.primitive(.uint8(value)))
    }
    
    internal func encode(_ value: UInt16, forKey key: Key) throws {
        storage[key.stringValue] = .singleValue(.primitive(.uint16(value)))
    }
    
    internal func encode(_ value: UInt32, forKey key: Key) throws {
        storage[key.stringValue] = .singleValue(.primitive(.uint32(value)))
    }
    
    internal func encode(_ value: UInt64, forKey key: Key) throws {
        storage[key.stringValue] = .singleValue(.primitive(.uint64(value)))
    }
    
    internal func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
        let nextCodingPath = codingPath.appending(key)
        let lowLevelEncoder = URLQueryItemEncoder2.LowLevelEncoder(codingPath: nextCodingPath)
        try value.encode(to: lowLevelEncoder)
        
        guard let nestedStorage = lowLevelEncoder.storage() else {
            fatalError("IDK is this possuble?")
        }
        
        storage[key.stringValue] = nestedStorage
    }
    
    internal func encodeNil(forKey key: Key) throws {
        storage[key.stringValue] = nil
    }
    
    internal func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type,
        forKey key: Key
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey: CodingKey {
        let nextCodingPath = codingPath.appending(key)
        let container = URLQueryItemEncoder2.KeyedContainer<NestedKey>(codingPath: nextCodingPath)
        
        // TODO: this is why this doesn't work: I need a reference to the storage… i need that value to change over time as this
        // container gets used. even though the container is a class this doesn't capture a reference to the classes' storage.
        // this is the hurdle; i could solve it by actually capturing the container except that the leyed one is generic.
        // i could go back to passing around the Reference<whatever>...
        // I bet I could make a KeyedCOntainer that didn't have the generic but then wouldn't fit the protocol… hmmm… would that still work?
        storage[key.stringValue] = .keyedValue(container.storage)
        
        return KeyedEncodingContainer(container)
    }
    
    internal mutating func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        let nextCodingPath = codingPath.appending(key)
        
        return URLQueryItemEncoder2.UnkeyedContainer(codingPath: nextCodingPath , storage: storage)
    }
    
    internal mutating func superEncoder() -> Encoder {
        let key = Key(stringValue: "super")!
        
        return superEncoder(forKey: key)
    }
    
    internal mutating func superEncoder(forKey key: Key) -> Encoder {
        let nextCodingPath = codingPath.appending(key)
        
        return URLQueryItemEncoder2.LowLevelEncoder(codingPath: nextCodingPath, storage: storage)
    }
}

