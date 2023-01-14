//
//  URLQueryItemDecoder+SingleValueContainer.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 12/30/22.
//

import Foundation

extension URLQueryItemDecoder {
    internal struct SingleValueContainer {
        internal private(set) var codingPath: [any CodingKey]
        
        private let intermediate: Intermediate
        
        // MARK: Internal Initialization
        
        /// No need to scope intermediate beforehand
        internal init(intermediate: Intermediate, codingPath: [any CodingKey]) {
            self.intermediate = intermediate.scoped(to: codingPath)
            self.codingPath = codingPath
        }
    }
}

// MARK: - SingleValueEncodingContainer Extension

extension URLQueryItemDecoder.SingleValueContainer: SingleValueDecodingContainer {
    // MARK: Internal Instance Interface
    
    func decode(_ type: Bool.Type) throws -> Bool {
        try intermediate.decodeLosslessly(codingPath)
    }
    
    func decode(_ type: Double.Type) throws -> Double {
        try intermediate.decodeLosslessly(codingPath)
    }
    
    func decode(_ type: Float.Type) throws -> Float {
        try intermediate.decodeLosslessly(codingPath)
    }
    
    func decode(_ type: Int.Type) throws -> Int {
        try intermediate.decodeLosslessly(codingPath)
    }
    
    func decode(_ type: Int8.Type) throws -> Int8 {
        try intermediate.decodeLosslessly(codingPath)
    }
    
    func decode(_ type: Int16.Type) throws -> Int16 {
        try intermediate.decodeLosslessly(codingPath)
    }
    
    func decode(_ type: Int32.Type) throws -> Int32 {
        try intermediate.decodeLosslessly(codingPath)
    }
    
    func decode(_ type: Int64.Type) throws -> Int64 {
        try intermediate.decodeLosslessly(codingPath)
    }
    
    func decode(_ type: String.Type) throws -> String {
        try intermediate.decode(codingPath)
    }
    
    func decode(_ type: UInt.Type) throws -> UInt {
        try intermediate.decodeLosslessly(codingPath)
    }
    
    func decode(_ type: UInt8.Type) throws -> UInt8 {
        try intermediate.decodeLosslessly(codingPath)
    }
    
    func decode(_ type: UInt16.Type) throws -> UInt16 {
        try intermediate.decodeLosslessly(codingPath)
    }
    
    func decode(_ type: UInt32.Type) throws -> UInt32 {
        try intermediate.decodeLosslessly(codingPath)
    }
    
    func decode(_ type: UInt64.Type) throws -> UInt64 {
        try intermediate.decodeLosslessly(codingPath)
    }
    
    func decode<Target>(_ type: Target.Type) throws -> Target where Target: Decodable {
        let lowLevelDecoder = URLQueryItemDecoder.LowLevelDecoder(intermediate: intermediate, codingPath: codingPath)
        
        return try Target(from: lowLevelDecoder)
    }
    
    func decodeNil() -> Bool {
        intermediate.isNil(for: codingPath)
    }
}
