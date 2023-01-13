//
//  URLQueryItemDecoder+UnkeyedContainer.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 12/30/22.
//

import Foundation

extension URLQueryItemDecoder {
    internal struct UnkeyedContainer {
        internal private(set) var codingPath: [any CodingKey]
        internal private(set) var currentIndex: Int
        
        private let intermediate: Intermediate
        
        // MARK: Internal Initialization
        
        /// No need to scope intermediate beforehand
        internal init(from source: Intermediate, scopedTo codingPath: [any CodingKey]) {
            self.codingPath = codingPath
            
            currentIndex = 0
            intermediate = source.scoped(to: codingPath)
        }
        
        // MARK: Private Instance Interface
        
        private var endIndex: Int {
            intermediate.childrenCount - 1
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
        intermediate.childrenCount
    }
    
    internal var isAtEnd: Bool {
        endIndex <= currentIndex
    }
    
    internal mutating func decode(_ type: Bool.Type) throws -> Bool {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(codingPath, at: currentIndex)
    }
    
    internal mutating func decode(_ type: Double.Type) throws -> Double {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(codingPath, at: currentIndex)
    }
    
    internal mutating func decode(_ type: Float.Type) throws -> Float {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(codingPath, at: currentIndex)
    }
    
    internal mutating func decode(_ type: Int.Type) throws -> Int {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(codingPath, at: currentIndex)
    }
    
    internal mutating func decode(_ type: Int8.Type) throws -> Int8 {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(codingPath, at: currentIndex)
    }
    
    internal mutating func decode(_ type: Int16.Type) throws -> Int16 {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(codingPath, at: currentIndex)
    }
    
    internal mutating func decode(_ type: Int32.Type) throws -> Int32 {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(codingPath, at: currentIndex)
    }
    
    internal mutating func decode(_ type: Int64.Type) throws -> Int64 {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(codingPath, at: currentIndex)
    }
    
    internal mutating func decode(_ type: String.Type) throws -> String {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decode(codingPath, at: currentIndex)
    }
    
    internal mutating func decode(_ type: UInt.Type) throws -> UInt {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(codingPath, at: currentIndex)
    }
    
    internal mutating func decode(_ type: UInt8.Type) throws -> UInt8 {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(codingPath, at: currentIndex)
    }
    
    internal mutating func decode(_ type: UInt16.Type) throws -> UInt16 {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(codingPath, at: currentIndex)
    }
    
    internal mutating func decode(_ type: UInt32.Type) throws -> UInt32 {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(codingPath, at: currentIndex)
    }
    
    internal mutating func decode(_ type: UInt64.Type) throws -> UInt64 {
        defer {
            incrementCurrentIndex()
        }
        
        return try intermediate.decodeLosslessly(codingPath, at: currentIndex)
    }
    
    internal mutating func decode<Target>(_ type: Target.Type) throws -> Target where Target: Decodable {
        // TODO: does this work? this is the same coding path… I need to be able to somehow… build a coding path with the idnex appended on? idk
        // can I make my own CodingKey implementation and append that? But then wouldnt that make this KEYED, and not UNKEYED. IDK.
        
        // TODO: ok this is my attempt to do that lol
        let nextCodingPath = codingPath.appending(Index(intValue: currentIndex))
        let lowLevelDecoder = URLQueryItemDecoder.LowLevelDecoder(
            intermediate: intermediate,
            codingPath: nextCodingPath
        )
        
        return try Target(from: lowLevelDecoder)
    }
    
    internal mutating func decodeNil() throws -> Bool {
        !intermediate.contains(codingPath, at: currentIndex)
    }
    
    internal mutating func nestedContainer<NestedKey>(
        keyedBy type: NestedKey.Type
    ) throws -> KeyedDecodingContainer<NestedKey> where NestedKey: CodingKey {
        defer {
            incrementCurrentIndex()
        }
        
        let nextCodingPath = codingPath.appending(Index(intValue: currentIndex))
        
        return KeyedDecodingContainer(
            URLQueryItemDecoder.KeyedContainer(intermediate: intermediate, codingPath: nextCodingPath)
        )
    }
    
    internal mutating func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        defer {
            incrementCurrentIndex()
        }
        
        let nextCodingPath = codingPath.appending(Index(intValue: currentIndex))
        
        return Self(from: intermediate, scopedTo: nextCodingPath)
    }
    
    internal mutating func superDecoder() throws -> Decoder {
        // TODO: really no clue how this should be implemented? This seems like the only thing I can do?
        return URLQueryItemDecoder.LowLevelDecoder(intermediate: intermediate, codingPath: codingPath)
    }
}

extension URLQueryItemDecoder.UnkeyedContainer {
    struct Index {
        let intValue: Int?
        let stringValue: String
    }
}

extension URLQueryItemDecoder.UnkeyedContainer.Index: CodingKey {
    // MARK: Internal Initialization
    
    init(intValue: Int) {
        self.intValue = intValue
        
        stringValue = String(intValue)
    }
    
    init?(stringValue: String) {
        guard let intValue = Int(stringValue) else {
            return nil
        }
        
        self.intValue = intValue
        self.stringValue = stringValue
    }
}
