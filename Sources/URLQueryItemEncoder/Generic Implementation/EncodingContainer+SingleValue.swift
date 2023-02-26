//
//  EncodingContainer+SingleValue.swift
//  Common
//
//  Created by Kyle Hughes on 1/15/23.
//

extension EncodingContainer {
    public final class SingleValue {
        public let codingPath: [any CodingKey]
        
        public private(set) var storage: Storage?
                
        // MARK: Public Initialization
        
        public init(codingPath: [any CodingKey]) {
            self.codingPath = codingPath
            
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
    // MARK: Public Instance Interface
    
    public func encode(_ value: Bool) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.bool(value))
    }
    
    public func encode(_ value: Double) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.double(value))
    }
    
    public func encode(_ value: Float) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.float(value))
    }
    
    public func encode(_ value: Int) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.int(value))
    }
    
    public func encode(_ value: Int8) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.int8(value))
    }
    
    public func encode(_ value: Int16) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.int16(value))
    }
    
    public func encode(_ value: Int32) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.int32(value))
    }
    
    public func encode(_ value: Int64) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.int64(value))
    }
    
    public func encode(_ value: String) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.string(value))
    }
    
    public func encode(_ value: UInt) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.uint(value))
    }
    
    public func encode(_ value: UInt8) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.uint8(value))
    }
    
    public func encode(_ value: UInt16) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.uint16(value))
    }
    
    public func encode(_ value: UInt32) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.uint32(value))
    }
    
    public func encode(_ value: UInt64) throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(.uint64(value))
    }
    
    public func encode<T>(_ value: T) throws where T: Encodable {
        preconditionCanEncodeNewValue()
        
        let lowLevelEncoder = LowLevelEncoder(codingPath: codingPath)
        
        try value.encode(to: lowLevelEncoder)
        
        precondition(
            lowLevelEncoder.storage != nil,
            "Encodable type \(T.self) was not properly encoded by low level encoder."
        )

        storage = .container(lowLevelEncoder.storage!)
    }
    
    public func encodeNil() throws {
        preconditionCanEncodeNewValue()
        
        storage = .primitive(nil)
    }
}

// MARK: - Container.SingleValue.Storage Definition

extension EncodingContainer.SingleValue {
    public enum Storage {
        case container(EncodingContainer)
        case primitive(EncodingPrimitiveValue?)
    }
}
