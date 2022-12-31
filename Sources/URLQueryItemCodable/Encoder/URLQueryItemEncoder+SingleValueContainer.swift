//
//  URLQueryItemEncoder+SingleValueContainer.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 12/27/22.
//

import Foundation

extension URLQueryItemEncoder {
    internal struct SingleValueContainer {
        internal private(set) var codingPath: [any CodingKey]
        
        private let partial: Partial
        
        // MARK: Internal Initialization
        
        internal init(partial: Partial, codingPath: [any CodingKey]) {
            self.partial = partial
            self.codingPath = codingPath
        }
    }
}

// MARK: - SingleValueEncodingContainer Extension

extension URLQueryItemEncoder.SingleValueContainer: SingleValueEncodingContainer {
    // MARK: Public Instance Interface
    
    mutating public func encode(_ value: Bool) throws {
        partial.encodeLosslessly(codingPath, as: value)
    }
    
    mutating public func encode(_ value: String) throws {
        partial.encode(codingPath, as: value)
    }
    
    mutating public func encode(_ value: Double) throws {
        partial.encodeLosslessly(codingPath, as: value)
    }
    
    mutating public func encode(_ value: Float) throws {
        partial.encodeLosslessly(codingPath, as: value)
    }
    
    mutating public func encode(_ value: Int) throws {
        partial.encodeLosslessly(codingPath, as: value)
    }
    
    mutating public func encode(_ value: Int8) throws {
        partial.encodeLosslessly(codingPath, as: value)
    }
    
    mutating public func encode(_ value: Int16) throws {
        partial.encodeLosslessly(codingPath, as: value)
    }
    
    mutating public func encode(_ value: Int32) throws {
        partial.encodeLosslessly(codingPath, as: value)
    }
    
    mutating public func encode(_ value: Int64) throws {
        partial.encodeLosslessly(codingPath, as: value)
    }
    
    mutating public func encode(_ value: UInt) throws {
        partial.encodeLosslessly(codingPath, as: value)
    }
    
    mutating public func encode(_ value: UInt8) throws {
        partial.encodeLosslessly(codingPath, as: value)
    }
    
    mutating public func encode(_ value: UInt16) throws {
        partial.encodeLosslessly(codingPath, as: value)
    }
    
    mutating public func encode(_ value: UInt32) throws {
        partial.encodeLosslessly(codingPath, as: value)
    }
    
    mutating public func encode(_ value: UInt64) throws {
        partial.encodeLosslessly(codingPath, as: value)
    }
    
    mutating public func encode<T>(_ value: T) throws where T: Encodable {
        let lowLevelEncoder = URLQueryItemEncoder.LowLevelEncoder(partial: partial, codingPath: codingPath)
        
        try value.encode(to: lowLevelEncoder)
    }
    
    mutating public func encodeNil() throws {
        // NO-OP
    }
}
