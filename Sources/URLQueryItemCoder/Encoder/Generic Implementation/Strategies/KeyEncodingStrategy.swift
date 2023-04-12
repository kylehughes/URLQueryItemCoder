//
//  KeyEncodingStrategy.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 3/16/23.
//

/// The strategy to use for automatically changing the value of keys before encoding.
public enum KeyEncodingStrategy: Sendable {
    /// A key encoding strategy that converts camel-case keys to snake-case keys.
    ///
    /// Convert from "camelCaseKeys" to "snake_case_keys" before writing a key to the payload.
    ///
    /// Capital characters are determined by testing membership in `CharacterSet.uppercaseLetters` and
    /// `CharacterSet.lowercaseLetters` (Unicode General Categories Lu and Lt).
    ///
    /// The conversion to lower case uses `Locale.system`, also known as the ICU "root" locale. This means the result
    /// is consistent regardless of the current user's locale and language preferences.
    ///
    /// Converting from camel case to snake case:
    /// 
    /// 1. Splits words at the boundary of lower-case to upper-case
    /// 2. Inserts `_` between words
    /// 3. Lowercases the entire string
    /// 4. Preserves starting and ending `_`.
    ///
    /// For example, `oneTwoThree` becomes `one_two_three`. `_oneTwoThree_` becomes `_one_two_three_`.
    ///
    /// - Note: Using a key encoding strategy has a nominal performance cost, as each string key has to be converted.
    case convertToSnakeCase
    
    /// A key encoding strategy defined by the closure you supply.
    ///
    /// Provide a custom conversion to the key in the encoded payload from the keys specified by the encoded types.
    ///
    /// The full path to the current encoding position is provided for context (in case you need to locate this key
    /// within the payload). The returned key is used in place of the last component in the coding path before encoding.
    /// 
    /// If the result of the conversion is a duplicate key, then only one value will be present in the result.
    case custom(@Sendable (_ codingPath: [any CodingKey]) -> any CodingKey)
    
    /// A key encoding strategy that doesn’t change key names during encoding.
    ///
    /// The `KeyEncodingStrategy.useDefaultKeys` strategy is the strategy used if you don’t specify one.
    ///
    /// - Note: If you use a nested CodingKeys enumeration to define custom key names, this strategy continues to use
    /// those names rather than reverting back to the original property names.
    case useDefaultKeys
    
    // MARK: Public Static Interface
    
    /// The default encoding strategy.
    ///
    /// Equals `.useDefaultKeys`.
    public static let `default`: KeyEncodingStrategy = .useDefaultKeys
    
    // MARK: Internal Instance Interface
    
    internal func encode(_ key: any CodingKey, at codingPath: [any CodingKey]) -> any CodingKey {
        switch self {
        case .convertToSnakeCase:
            return StringCodingKey(stringValue: key.stringValue.convertToSnakeCase())
        case let .custom(encoder):
            return encoder(codingPath + [key])
        case .useDefaultKeys:
            return key
        }
    }
}
