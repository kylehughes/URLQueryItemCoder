//
//  EncodingContainer+SingleValue.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/15/23.
//

import Foundation

extension EncodingContainer {
    internal final class SingleValue {
        internal let codingPath: [any CodingKey]
        
        internal private(set) var storage: Storage?
        
        private let configuration: EncodingStrategies
                
        // MARK: Internal Initialization
        
        internal init(codingPath: [any CodingKey], configuration: EncodingStrategies) {
            self.codingPath = codingPath
            self.configuration = configuration
            
            storage = nil
        }
        
        // MARK: Private Instance Interface
        
        private func preconditionCanEncodeNewValue() {
            precondition(
                storage == nil,
                "A value was already encoded through the single value container."
            )
        }
    }
}

// MARK: - SingleValueEncodingContainer Extension

extension EncodingContainer.SingleValue: SingleValueEncodingContainer {
    // MARK: Internal Instance Interface
    
    internal func encode(_ value: Bool) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.bool(value))
    }
    
    internal func encode(_ value: Double) throws {
        preconditionCanEncodeNewValue()
        
        storage = try .primitive(
            configuration.nonConformingFloatStrategy.encode(value, at: codingPath, using: configuration)
        )
    }
    
    internal func encode(_ value: Float) throws {
        preconditionCanEncodeNewValue()
        
        storage = try .primitive(
            configuration.nonConformingFloatStrategy.encode(value, at: codingPath, using: configuration)
        )
    }
    
    internal func encode(_ value: Int) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.int(value))
    }
    
    internal func encode(_ value: Int8) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.int8(value))
    }
    
    internal func encode(_ value: Int16) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.int16(value))
    }
    
    internal func encode(_ value: Int32) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.int32(value))
    }
    
    internal func encode(_ value: Int64) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.int64(value))
    }
    
    internal func encode(_ value: String) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.string(value))
    }
    
    internal func encode(_ value: UInt) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.uint(value))
    }
    
    internal func encode(_ value: UInt8) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.uint8(value))
    }
    
    internal func encode(_ value: UInt16) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.uint16(value))
    }
    
    internal func encode(_ value: UInt32) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.uint32(value))
    }
    
    internal func encode(_ value: UInt64) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.uint64(value))
    }
    
    internal func encode<T>(_ value: T) throws where T: Encodable {
        preconditionCanEncodeNewValue()
        
        let container  = try EncodingContainer.encodeWithSpecialTreatment(value, at: codingPath, using: configuration)
        
        storage = .container(container)
    }
    
    internal func encodeNil() throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(nil)
    }
}

// MARK: - Container.SingleValue.Storage Definition

extension EncodingContainer.SingleValue {
    internal enum Storage {
        case container(EncodingContainer)
        case primitive(EncodingPrimitiveValue?)
    }
}
