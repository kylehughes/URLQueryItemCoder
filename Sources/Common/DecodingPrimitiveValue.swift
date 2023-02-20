//
//  DecodingPrimitiveValue.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/19/23.
//

public protocol DecodingPrimitiveValue {
    func decode(_ type: Bool.Type) -> Bool?
    func decode(_ type: Double.Type) -> Double?
    func decode(_ type: Float.Type) -> Float?
    func decode(_ type: Int.Type) -> Int?
    func decode(_ type: Int8.Type) -> Int8?
    func decode(_ type: Int16.Type) -> Int16?
    func decode(_ type: Int32.Type) -> Int32?
    func decode(_ type: Int64.Type) -> Int64?
    func decode(_ type: String.Type) -> String?
    func decode(_ type: UInt.Type) -> UInt?
    func decode(_ type: UInt8.Type) -> UInt8?
    func decode(_ type: UInt16.Type) -> UInt16?
    func decode(_ type: UInt32.Type) -> UInt32?
    func decode(_ type: UInt64.Type) -> UInt64?
    func decodeNil() -> Bool
}

// MARK: - Conformance for String

extension String: DecodingPrimitiveValue {
    // MARK: Public Instance Interface
    
    public func decode(_ type: Bool.Type) -> Bool? {
        type.init(self)
    }
    
    public func decode(_ type: Double.Type) -> Double? {
        type.init(self)
    }
    
    public func decode(_ type: Float.Type) -> Float? {
        type.init(self)
    }
    
    public func decode(_ type: Int.Type) -> Int? {
        type.init(self)
    }
    
    public func decode(_ type: Int8.Type) -> Int8? {
        type.init(self)
    }
    
    public func decode(_ type: Int16.Type) -> Int16? {
        type.init(self)
    }
    
    public func decode(_ type: Int32.Type) -> Int32? {
        type.init(self)
    }
    
    public func decode(_ type: Int64.Type) -> Int64? {
        type.init(self)
    }
    
    public func decode(_ type: String.Type) -> String? {
        self
    }
    
    public func decode(_ type: UInt.Type) -> UInt? {
        type.init(self)
    }
    
    public func decode(_ type: UInt8.Type) -> UInt8? {
        type.init(self)
    }
    
    public func decode(_ type: UInt16.Type) -> UInt16? {
        type.init(self)
    }
    
    public func decode(_ type: UInt32.Type) -> UInt32? {
        type.init(self)
    }
    
    public func decode(_ type: UInt64.Type) -> UInt64? {
        type.init(self)
    }
    
    public func decodeNil() -> Bool {
        false
    }
}
