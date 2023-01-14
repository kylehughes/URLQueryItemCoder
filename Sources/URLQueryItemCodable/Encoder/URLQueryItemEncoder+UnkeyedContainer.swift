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
        
        private let intermediate: Intermediate
        
        // MARK: Internal Initialization
        
        internal init(intermediate: Intermediate, codingPath: [any CodingKey]) {
            self.intermediate = intermediate
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
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: String) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        intermediate.encode(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: Double) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: Float) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: Int) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: Int8) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: Int16) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: Int32) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: Int64) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: UInt) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: UInt8) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: UInt16) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: UInt32) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode(_ value: UInt64) throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)

        intermediate.encodeLosslessly(nextCodingPath, as: value)
    }
    
    mutating internal func encode<T>(_ value: T) throws where T : Encodable {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let lowLevelEncoder = URLQueryItemEncoder.LowLevelEncoder(
            intermediate: intermediate,
            codingPath: nextCodingPath
        )
        
        try value.encode(to: lowLevelEncoder)
    }
    
    mutating internal func encodeNil() throws {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        intermediate.encode(nextCodingPath, as: nil)
    }
    
    mutating internal func nestedContainer<NestedKey>(
        keyedBy keyType: NestedKey.Type
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        let container = URLQueryItemEncoder.KeyedContainer<NestedKey>(
            intermediate: intermediate,
            codingPath: nextCodingPath
        )
        
        return KeyedEncodingContainer(container)
    }
    
    mutating internal func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        return Self(intermediate: intermediate, codingPath: nextCodingPath)
    }
    
    mutating internal func superEncoder() -> Encoder {
        let nextCodingKey = nextCodingKey()
        let nextCodingPath = codingPath.appending(nextCodingKey)
        
        return URLQueryItemEncoder.LowLevelEncoder(intermediate: intermediate, codingPath: nextCodingPath)
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
