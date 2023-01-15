//
//  URLQueryItemDecoder+UnkeyedContainer.swift
//  URLQueryItemDecodable
//
//  Created by Kyle Hughes on 12/30/22.
//

import Foundation

@_implementationOnly import Common

extension URLQueryItemDecoder {
    internal struct UnkeyedContainer {
        internal private(set) var codingPath: [any CodingKey]
        internal private(set) var currentIndex: Int
        
        private let intermediate: ReferenceContainerProtocol
        
        // MARK: Internal Initialization
        
        internal init(from source: ReferenceContainerProtocol, scopedTo codingPath: [any CodingKey]) {
            self.codingPath = codingPath
            
            currentIndex = 0
            intermediate = source.scoped(to: codingPath)
        }
        
        // MARK: Private Instance Interface
        
        private var endIndex: Int {
            intermediate.count - 1
        }
        
        private var nextCodingPath: [any CodingKey] {
            codingPath.appending(IntCodingKey(intValue: currentIndex))
        }
        
        private mutating func incrementCurrentIndex() {
            currentIndex += 1
        }
    }
}

// MARK: - UnkeyedDecodingContainer Extension

extension URLQueryItemDecoder.UnkeyedContainer: UnkeyedDecodingContainer {
    // MARK: Internal Instance Interface
    
    internal var count: Int? {
        intermediate.count
    }
    
    internal var isAtEnd: Bool {
        endIndex < currentIndex
    }
    
    internal mutating func decode(_ type: Bool.Type) throws -> Bool {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal mutating func decode(_ type: Double.Type) throws -> Double {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal mutating func decode(_ type: Float.Type) throws -> Float {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal mutating func decode(_ type: Int.Type) throws -> Int {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal mutating func decode(_ type: Int8.Type) throws -> Int8 {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal mutating func decode(_ type: Int16.Type) throws -> Int16 {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal mutating func decode(_ type: Int32.Type) throws -> Int32 {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal mutating func decode(_ type: Int64.Type) throws -> Int64 {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal mutating func decode(_ type: String.Type) throws -> String {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decode(nextCodingPath)
    }
    
    internal mutating func decode(_ type: UInt.Type) throws -> UInt {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal mutating func decode(_ type: UInt8.Type) throws -> UInt8 {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal mutating func decode(_ type: UInt16.Type) throws -> UInt16 {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal mutating func decode(_ type: UInt32.Type) throws -> UInt32 {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal mutating func decode(_ type: UInt64.Type) throws -> UInt64 {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(nextCodingPath)
    }
    
    internal mutating func decode<Target>(_ type: Target.Type) throws -> Target where Target: Decodable {
        defer {
            incrementCurrentIndex()
        }
        
        let lowLevelDecoder = URLQueryItemDecoder.LowLevelDecoder(
            intermediate: intermediate,
            codingPath: nextCodingPath
        )
        
        return try Target(from: lowLevelDecoder)
    }
    
    internal mutating func decodeNil() throws -> Bool {
        defer {
            incrementCurrentIndex()
        }
        
        return intermediate.isNil(for: nextCodingPath)
    }
    
    internal mutating func nestedContainer<NestedKey>(
        keyedBy type: NestedKey.Type
    ) throws -> KeyedDecodingContainer<NestedKey> where NestedKey: CodingKey {
        defer {
            incrementCurrentIndex()
        }
        
        return KeyedDecodingContainer(
            URLQueryItemDecoder.KeyedContainer(from: intermediate, scopedTo: nextCodingPath)
        )
    }
    
    internal mutating func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        defer {
            incrementCurrentIndex()
        }
        
        return Self(from: intermediate, scopedTo: nextCodingPath)
    }
    
    internal mutating func superDecoder() throws -> Decoder {
        // TODO: really no clue how this should be implemented? This seems like the only thing I can do?
        return URLQueryItemDecoder.LowLevelDecoder(intermediate: intermediate, codingPath: codingPath)
    }
}
