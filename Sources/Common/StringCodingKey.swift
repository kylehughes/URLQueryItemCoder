//
//  StringCodingKey.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/15/23.
//

public struct StringCodingKey {
    public let intValue: Int?
    public let stringValue: String
    
    // MARK: Private Initialization
    
    private init(intValue: Int?, stringValue: String) {
        self.intValue = intValue
        self.stringValue = stringValue
    }
}

// MARK: - CodingKey Extension

extension StringCodingKey: CodingKey {
    // MARK: Public Initialization
    
    public init(intValue: Int) {
        self.intValue = intValue
        
        stringValue = String(intValue)
    }
    
    public init(stringValue: String) {
        self.stringValue = stringValue
        
        intValue = nil
    }
}

// MARK: - ExpressibleByStringLiteral Extension

extension StringCodingKey: ExpressibleByStringLiteral {
    // MARK: Public Initialization
    
    @inlinable
    public init(stringLiteral value: String) {
        self.init(stringValue: value)
    }
}
