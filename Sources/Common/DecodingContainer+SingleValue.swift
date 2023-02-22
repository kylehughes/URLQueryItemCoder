//
//  DecodingContainer+SingleValue.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 2/21/23.
//

extension DecodingContainer {
    public final class SingleValue {
        public let codingPath: [any CodingKey]
        
        public private(set) var storage: PrimitiveValue?
        
        // MARK: Public Initialization
        
        public init(codingPath: [any CodingKey]) {
            self.codingPath = codingPath
            
            storage = nil
        }
        
        // MARK: Public Instance Interface
        
        public func store(_ value: PrimitiveValue?) {
            precondition(storage == nil)
            
            storage = value
        }
    }
}

// MARK: - SingleValueDecodingContainer Extension

extension DecodingContainer.SingleValue: SingleValueDecodingContainer {
    // MARK: Public Instance Interface
    
    public func decode(_ type: Bool.Type) throws -> Bool {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: String.Type) throws -> String {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Double.Type) throws -> Double {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Float.Type) throws -> Float {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Int.Type) throws -> Int {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Int8.Type) throws -> Int8 {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Int16.Type) throws -> Int16 {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Int32.Type) throws -> Int32 {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: Int64.Type) throws -> Int64 {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: UInt.Type) throws -> UInt {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: UInt8.Type) throws -> UInt8 {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: UInt16.Type) throws -> UInt16 {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: UInt32.Type) throws -> UInt32 {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode(_ type: UInt64.Type) throws -> UInt64 {
        guard let storage else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        guard let value = storage.decode(type) else {
            throw DecodingError.typeMismatch(type, .obvious(codingPath))
        }
        
        return value
    }
    
    public func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        let lowLevelDecoder = LowLevelDecoder(container: .singleValue(self))
        
        return try T(from: lowLevelDecoder)
    }
    
    public func decodeNil() -> Bool {
        storage == nil
    }
}
