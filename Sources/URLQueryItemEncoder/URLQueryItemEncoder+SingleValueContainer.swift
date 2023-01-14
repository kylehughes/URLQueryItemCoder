//
//  URLQueryItemEncoder+SingleValueContainer.swift
//  URLQueryItemEncodable
//
//  Created by Kyle Hughes on 12/27/22.
//

import Foundation

@_implementationOnly import Common

extension URLQueryItemEncoder {
    internal struct SingleValueContainer {
        internal private(set) var codingPath: [any CodingKey]
        
        private let intermediate: Intermediate
        
        // MARK: Internal Initialization
        
        internal init(intermediate: Intermediate, codingPath: [any CodingKey]) {
            self.intermediate = intermediate
            self.codingPath = codingPath
        }
    }
}

// MARK: - SingleValueEncodingContainer Extension

extension URLQueryItemEncoder.SingleValueContainer: SingleValueEncodingContainer {
    // MARK: Internal Instance Interface
    
    internal mutating func encode(_ value: Bool) throws {
        intermediate.encodeLosslessly(codingPath, as: value)
    }
    
    internal mutating func encode(_ value: String) throws {
        intermediate.encode(codingPath, as: value)
    }
    
    internal mutating func encode(_ value: Double) throws {
        intermediate.encodeLosslessly(codingPath, as: value)
    }
    
    internal mutating func encode(_ value: Float) throws {
        intermediate.encodeLosslessly(codingPath, as: value)
    }
    
    internal mutating func encode(_ value: Int) throws {
        intermediate.encodeLosslessly(codingPath, as: value)
    }
    
    internal mutating func encode(_ value: Int8) throws {
        intermediate.encodeLosslessly(codingPath, as: value)
    }
    
    internal mutating func encode(_ value: Int16) throws {
        intermediate.encodeLosslessly(codingPath, as: value)
    }
    
    internal mutating func encode(_ value: Int32) throws {
        intermediate.encodeLosslessly(codingPath, as: value)
    }
    
    internal mutating func encode(_ value: Int64) throws {
        intermediate.encodeLosslessly(codingPath, as: value)
    }
    
    internal mutating func encode(_ value: UInt) throws {
        intermediate.encodeLosslessly(codingPath, as: value)
    }
    
    internal mutating func encode(_ value: UInt8) throws {
        intermediate.encodeLosslessly(codingPath, as: value)
    }
    
    internal mutating func encode(_ value: UInt16) throws {
        intermediate.encodeLosslessly(codingPath, as: value)
    }
    
    internal mutating func encode(_ value: UInt32) throws {
        intermediate.encodeLosslessly(codingPath, as: value)
    }
    
    internal mutating func encode(_ value: UInt64) throws {
        intermediate.encodeLosslessly(codingPath, as: value)
    }
    
    internal mutating func encode<T>(_ value: T) throws where T: Encodable {
        let lowLevelEncoder = URLQueryItemEncoder.LowLevelEncoder(intermediate: intermediate, codingPath: codingPath)
        
        try value.encode(to: lowLevelEncoder)
    }
    
    internal mutating func encodeNil() throws {
        // NO-OP
    }
}
