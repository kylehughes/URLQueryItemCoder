//
//  URLQueryItemEncoder+UnkeyedContainer.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 12/27/22.
//

import Foundation

extension URLQueryItemEncoder {
    internal struct UnkeyedContainer {
        internal private(set) var codingPath: [any CodingKey]
        internal private(set) var count: Int
        
        private let partial: Partial
        
        // MARK: Internal Initialization
        
        internal init(partial: Partial, codingPath: [any CodingKey]) {
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
}

// MARK: - UnkeyedEncodingContainer Extension

extension URLQueryItemEncoder.UnkeyedContainer: UnkeyedEncodingContainer {
    // MARK: Internal Instance Interface
    
    mutating internal func encode(_ value: Bool) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: String) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encode(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: Double) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: Float) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: Int) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: Int8) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: Int16) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: Int32) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: Int64) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: UInt) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: UInt8) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: UInt16) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: UInt32) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        partial.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: UInt64) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)

        partial.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode<T>(_ value: T) throws where T : Encodable {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let lowLevelEncoder = URLQueryItemEncoder.LowLevelEncoder(partial: partial, codingPath: nextCodingPath)
        
        try value.encode(to: lowLevelEncoder)
    }
    
    mutating internal func encodeNil() throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        partial.encode(nextCodingPath, as: nil)
    }
    
    mutating internal func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = URLQueryItemEncoder.KeyedContainer<NestedKey>(
            partial: partial,
            codingPath: nextCodingPath
        )
        
        return KeyedEncodingContainer(container)
    }
    
    mutating internal func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        return Self(partial: partial, codingPath: nextCodingPath)
    }
    
    mutating internal func superEncoder() -> Encoder {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        return URLQueryItemEncoder.LowLevelEncoder(partial: partial, codingPath: nextCodingPath)
    }
}

// MARK: - URLQueryItemEncoder.UnkeyedContainer.IndexCodingKey Definition

extension URLQueryItemEncoder.UnkeyedContainer {
    private struct IndexCodingKey: CodingKey {
        internal let intValue: Int?
        internal let stringValue: String
        
        // MARK: Internal Initialization

        internal init(intValue: Int) {
            self.intValue = intValue
            self.stringValue = String(intValue)
        }

        internal init?(stringValue: String) {
            assertionFailure("Should only use integer initializer.")
            
            return nil
        }
    }
}
