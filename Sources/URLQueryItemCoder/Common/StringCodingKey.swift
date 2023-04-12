//
//  StringCodingKey.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/15/23.
//

/// A basic coding key implementation for stringly-keyed collections.
internal struct StringCodingKey {
    /// The value to use in an integer-indexed collection (e.g. an int-keyed dictionary).
    internal let intValue: Int?
    
    /// The string to use in a named collection (e.g. a string-keyed dictionary).
    internal let stringValue: String
    
    // MARK: Private Initialization
    
    private init(intValue: Int?, stringValue: String) {
        self.intValue = intValue
        self.stringValue = stringValue
    }
}

// MARK: - CodingKey Extension

extension StringCodingKey: CodingKey {
    // MARK: Internal Initialization
    
    /// Creates a new instance from the specified integer.
    ///
    /// - Parameter intValue: The integer value of the desired key.
    internal init(intValue: Int) {
        self.intValue = intValue
        
        stringValue = String(intValue)
    }
    
    /// Creates a new instance from the given string.
    ///
    /// - Parameter stringValue: The string value of the desired key.
    internal init(stringValue: String) {
        self.stringValue = stringValue
        
        intValue = nil
    }
}

// MARK: - ExpressibleByStringLiteral Extension

extension StringCodingKey: ExpressibleByStringLiteral {
    // MARK: Internal Initialization
    
    /// Creates an instance initialized to the given string value.
    ///
    /// - Parameter stringLiteral: The value of the new instance.
    @inlinable
    internal init(stringLiteral value: String) {
        self.init(stringValue: value)
    }
}
