//
//  DecodingContainer.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/19/23.
//

public final class DecodingContainer<PrimitiveValue> where PrimitiveValue: DecodingPrimitiveValue {
    public private(set) var codingPath: [any CodingKey]
    public private(set) var storage: [String: Storage]
    
    // MARK: Public Initialization
    
    public init(codingPath: [any CodingKey]) {
        self.codingPath = codingPath
        
        storage = [:]
    }
}

// MARK: - SingleValueDecodingContainer Extension

extension DecodingContainer: SingleValueDecodingContainer {
    // MARK: Public Instance Interface
    
    public func decode(_ type: Bool.Type) throws -> Bool {
        guard let valueStorage = storage.first?.value else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath,
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Double.Type) throws -> Double {
        guard let valueStorage = storage.first?.value else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath,
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Float.Type) throws -> Float {
        guard let valueStorage = storage.first?.value else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath,
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Int.Type) throws -> Int {
        guard let valueStorage = storage.first?.value else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath,
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Int8.Type) throws -> Int8 {
        guard let valueStorage = storage.first?.value else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath,
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Int16.Type) throws -> Int16 {
        guard let valueStorage = storage.first?.value else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath,
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Int32.Type) throws -> Int32 {
        guard let valueStorage = storage.first?.value else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath,
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: Int64.Type) throws -> Int64 {
        guard let valueStorage = storage.first?.value else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath,
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: String.Type) throws -> String {
        guard let valueStorage = storage.first?.value else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath,
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: UInt.Type) throws -> UInt {
        guard let valueStorage = storage.first?.value else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath,
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: UInt8.Type) throws -> UInt8 {
        guard let valueStorage = storage.first?.value else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath,
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: UInt16.Type) throws -> UInt16 {
        guard let valueStorage = storage.first?.value else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath,
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: UInt32.Type) throws -> UInt32 {
        guard let valueStorage = storage.first?.value else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath,
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode(_ type: UInt64.Type) throws -> UInt64 {
        guard let valueStorage = storage.first?.value else {
            throw DecodingError.valueNotFound(type, .obvious(codingPath))
        }
        
        switch valueStorage {
        case .container:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: codingPath,
                    debugDescription: "Cannot decode container as primitive value."
                )
            )
        case let .primitiveValue(value):
            guard let value = value.decode(type) else {
                throw DecodingError.typeMismatch(type, .obvious(codingPath))
            }
            
            return value
        }
    }
    
    public func decode<T>(_ type: T.Type) throws -> T where T: Decodable {
        let lowLevelDecoder = LowLevelDecoder(codingPath: codingPath)
        
        return try T(from: lowLevelDecoder)
    }
    
    public func decodeNil() -> Bool {
        storage.first?.value == nil
    }
}

// MARK: - DecodingContainer.Storage Definition

extension DecodingContainer {
    public enum Storage {
        case container(DecodingContainer<PrimitiveValue>)
        case primitiveValue(PrimitiveValue)
    }
}
