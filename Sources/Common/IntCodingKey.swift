//
//  IntCodingKey.swift
//  Common
//
//  Created by Kyle Hughes on 1/13/23.
//

public struct IntCodingKey {
    public let intValue: Int?
    public let stringValue: String
    
    // MARK: Private Initialization
    
    private init(intValue: Int?, stringValue: String) {
        self.intValue = intValue
        self.stringValue = stringValue
    }
}

// MARK: - CodingKey Extension

extension IntCodingKey: CodingKey {
    // MARK: Public Initialization
    
    public init(intValue: Int) {
        self.intValue = intValue
        
        stringValue = String(intValue)
    }
    
    public init?(stringValue: String) {
        guard let intValue = Int(stringValue) else {
            return nil
        }
        
        self.intValue = intValue
        self.stringValue = stringValue
    }
}

// MARK: - ExpressibleByIntegerLiteral Extension

extension IntCodingKey: ExpressibleByIntegerLiteral {
    // MARK: Public Initialization
    
    @inlinable
    public init(integerLiteral value: Int) {
        self.init(intValue: value)
    }
}
