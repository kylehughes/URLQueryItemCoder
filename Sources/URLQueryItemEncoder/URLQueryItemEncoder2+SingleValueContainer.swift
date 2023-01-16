//
//  URLQueryItemEncoder2+SingleValueContainer.swift
//  URLQueryItemEncoder
//
//  Created by Kyle Hughes on 1/15/23.
//

import Foundation

@_implementationOnly import Common

extension URLQueryItemEncoder2 {
    internal final class SingleValueContainer {
        internal let codingPath: [any CodingKey]
        
        internal private(set) var storage: Storage?
                
        // MARK: Internal Initialization
        
        internal init(codingPath: [any CodingKey]) {
            self.codingPath = codingPath
            
            storage = nil
        }
    }
}

// MARK: - SingleValueEncodingContainer Extension

extension URLQueryItemEncoder2.SingleValueContainer: SingleValueEncodingContainer {
    // MARK: Internal Instance Interface
    
    internal func encode(_ value: Bool) throws {
        storage = .primitive(.bool(value))
    }
    
    internal func encode(_ value: Double) throws {
        storage = .primitive(.double(value))
    }
    
    internal func encode(_ value: Float) throws {
        storage = .primitive(.float(value))
    }
    
    internal func encode(_ value: Int) throws {
        storage = .primitive(.int(value))
    }
    
    internal func encode(_ value: Int8) throws {
        storage = .primitive(.int8(value))
    }
    
    internal func encode(_ value: Int16) throws {
        storage = .primitive(.int16(value))
    }
    
    internal func encode(_ value: Int32) throws {
        storage = .primitive(.int32(value))
    }
    
    internal func encode(_ value: Int64) throws {
        storage = .primitive(.int64(value))
    }
    
    internal func encode(_ value: String) throws {
        storage = .primitive(.string(value))
    }
    
    internal func encode(_ value: UInt) throws {
        storage = .primitive(.uint(value))
    }
    
    internal func encode(_ value: UInt8) throws {
        storage = .primitive(.uint8(value))
    }
    
    internal func encode(_ value: UInt16) throws {
        storage = .primitive(.uint16(value))
    }
    
    internal func encode(_ value: UInt32) throws {
        storage = .primitive(.uint32(value))
    }
    
    internal func encode(_ value: UInt64) throws {
        storage = .primitive(.uint64(value))
    }
    
    internal func encode<T>(_ value: T) throws where T: Encodable {
        let lowLevelEncoder = URLQueryItemEncoder2.LowLevelEncoder(codingPath: codingPath)
        try value.encode(to: lowLevelEncoder)
        
        guard let nestedStorage = lowLevelEncoder.storage else {
            fatalError("IDK is this possuble?")
        }
        
        storage = .container(nestedStorage)
    }
    
    internal func encodeNil() throws {
        storage = nil
    }
}

extension URLQueryItemEncoder2.SingleValueContainer {
    internal enum Storage {
        case container(URLQueryItemEncoder2.Container)
        case primitive(PrimitiveContainerValue)
    }
}
