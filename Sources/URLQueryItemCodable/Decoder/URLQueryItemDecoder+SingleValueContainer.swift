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
        
        internal init(intermediate: Intermediate, codingPath: [any CodingKey]) {
            self.intermediate = intermediate
            self.codingPath = codingPath
        }
        
        // MARK: Private Instance Interface
        
        private func decodeLosslessly<Target>(
            _ type: Target.Type
        ) throws -> Target where Target: LosslessStringConvertible {
            guard let value = intermediate.decode(codingPath) else {
                throw DecodingError.valueNotFound(
                    Target.self,
                    DecodingError.Context(codingPath: codingPath, debugDescription: "Expected non-nil value.")
                )
            }
            
            guard let value = Target(value) else {
                throw DecodingError.typeMismatch(
                    Target.self,
                    DecodingError.Context(codingPath: codingPath, debugDescription: "Expected \(Target.self) value.")
                )
            }
            
            return value
        }
    }
}

// MARK: - SingleValueEncodingContainer Extension

extension URLQueryItemDecoder.SingleValueContainer: SingleValueDecodingContainer {
    // MARK: Internal Instance Interface
    
    func decode(_ type: Bool.Type) throws -> Bool {
        try decodeLosslessly(type)
    }
    
    func decode(_ type: Double.Type) throws -> Double {
        try decodeLosslessly(type)
    }
    
    func decode(_ type: Float.Type) throws -> Float {
        try decodeLosslessly(type)
    }
    
    func decode(_ type: Int.Type) throws -> Int {
        try decodeLosslessly(type)
    }
    
    func decode(_ type: Int8.Type) throws -> Int8 {
        try decodeLosslessly(type)
    }
    
    func decode(_ type: Int16.Type) throws -> Int16 {
        try decodeLosslessly(type)
    }
    
    func decode(_ type: Int32.Type) throws -> Int32 {
        try decodeLosslessly(type)
    }
    
    func decode(_ type: Int64.Type) throws -> Int64 {
        try decodeLosslessly(type)
    }
    
    func decode(_ type: String.Type) throws -> String {
        try decodeLosslessly(type)
    }
    
    func decode(_ type: UInt.Type) throws -> UInt {
        try decodeLosslessly(type)
    }
    
    func decode(_ type: UInt8.Type) throws -> UInt8 {
        try decodeLosslessly(type)
    }
    
    func decode(_ type: UInt16.Type) throws -> UInt16 {
        try decodeLosslessly(type)
    }
    
    func decode(_ type: UInt32.Type) throws -> UInt32 {
        try decodeLosslessly(type)
    }
    
    func decode(_ type: UInt64.Type) throws -> UInt64 {
        try decodeLosslessly(type)
    }
    
    func decode<Target>(_ type: Target.Type) throws -> Target where Target: Decodable {
        let lowLevelDecoder = URLQueryItemDecoder.LowLevelDecoder(intermediate: intermediate, codingPath: codingPath)
        
        return try Target(from: lowLevelDecoder)
    }
    
    func decodeNil() -> Bool {
        intermediate.decode(codingPath) == nil
    }
}
