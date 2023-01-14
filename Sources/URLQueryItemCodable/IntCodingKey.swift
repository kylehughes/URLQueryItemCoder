//
//  IntCodingKey.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 1/13/23.
//

internal struct IntCodingKey {
    internal let intValue: Int?
    internal let stringValue: String
    
    // MARK: Private Initialization
    
    private init(intValue: Int?, stringValue: String) {
        self.intValue = intValue
        self.stringValue = stringValue
    }
}

// MARK: - CodingKey Extension

extension IntCodingKey: CodingKey {
    // MARK: Internal Initialization
    
    internal init(intValue: Int) {
        self.intValue = intValue
        
        stringValue = String(intValue)
    }
    
    internal init?(stringValue: String) {
        guard let intValue = Int(stringValue) else {
            return nil
        }
        
        self.intValue = intValue
        self.stringValue = stringValue
    }
}
