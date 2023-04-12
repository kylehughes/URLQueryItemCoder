//
//  IntCodingKey.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/13/23.
//

/// A basic coding key implementation for integer-indexed collections.
internal struct IntCodingKey {
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

extension IntCodingKey: CodingKey {
    // MARK: Internal Initialization
    
    /// Creates a new instance from the specified integer.
    ///
    /// - Parameter intValue: The integer value of the desired key.
    internal init(intValue: Int) {
        self.intValue = intValue
        
        stringValue = String(intValue)
    }
    
    /// Creates a new instance from the given string, converted to an integer.
    ///
    /// - Parameter stringValue: The string value of the desired key.
    /// - Returns: The instance, or `nil` if the string couldn't be converted.
    internal init?(stringValue: String) {
        guard let intValue = Int(stringValue) else {
            return nil
        }
        
        self.intValue = intValue
        self.stringValue = stringValue
    }
}

// MARK: - ExpressibleByIntegerLiteral Extension

extension IntCodingKey: ExpressibleByIntegerLiteral {
    // MARK: Internal Initialization
    
    /// Creates an instance initialized to the given integer value.
    ///
    /// - Parameter integerLiteral: The value of the new instance.
    @inlinable
    internal init(integerLiteral value: Int) {
        self.init(intValue: value)
    }
}
