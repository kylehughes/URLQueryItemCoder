//
//  KeyDecodingStrategy.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 4/10/23.
//

/// The strategy to use for automatically changing the value of keys before decoding.
public enum KeyDecodingStrategy: Sendable {
    /// Convert from "snake_case_keys" to "camelCaseKeys" before attempting to match a key with the one specified by
    /// each type.
    ///
    /// The conversion to upper case uses `Locale.system`, also known as the ICU "root" locale. This means the result
    /// is consistent regardless of the current user's locale and language preferences.
    ///
    /// Converting from snake case to camel case:
    ///
    /// 1. Capitalizes the word starting after each `_`
    /// 2. Removes all `_`
    /// 3. Preserves starting and ending `_` (as these are often used to indicate private variables or other metadata).
    ///
    /// For example, `one_two_three` becomes `oneTwoThree`. `_one_two_three_` becomes `_oneTwoThree_`.
    ///
    /// - Note: Using a key decoding strategy has a nominal performance cost, as each string key has to be inspected
    ///   for the `_` character.
    case convertFromSnakeCase
    
    /// Provide a custom conversion from the key in the encoded JSON to the keys specified by the decoded types.
    ///
    /// The full path to the current decoding position is provided for context (in case you need to locate this key
    /// within the payload). The returned key is used in place of the last component in the coding path before decoding.
    /// 
    /// If the result of the conversion is a duplicate key, then only one value will be present in the container for
    /// the type to decode from.
    case custom(@Sendable (_ codingPath: [CodingKey]) -> CodingKey)

    /// Use the keys specified by each type.
    ///
    /// This is the default strategy.
    case useDefaultKeys
    
    // MARK: Public Static Interface
    
    /// The default decoding strategy.
    ///
    /// Equals `.useDefaultKeys`.
    public static let `default`: Self = .useDefaultKeys
    
    // MARK: Internal Instance Interface
    
    internal func encode(_ key: any CodingKey, at codingPath: [any CodingKey]) -> any CodingKey {
        switch self {
        case .convertFromSnakeCase:
            return StringCodingKey(stringValue: key.stringValue.convertToSnakeCase())
        case let .custom(encoder):
            return encoder(codingPath + [key])
        case .useDefaultKeys:
            return key
        }
    }
}

