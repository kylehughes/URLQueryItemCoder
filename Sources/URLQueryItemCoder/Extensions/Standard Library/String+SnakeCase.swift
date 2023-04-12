//
//  String+SnakeCase.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 4/10/23.
//

private let snakeCaseSeparator: Character = "_"

extension String {
    /// Convert from "camelCaseKeys" to "snake_case_keys".
    /// 
    /// Capital characters are determined by testing membership in `CharacterSet.uppercaseLetters` and
    /// `CharacterSet.lowercaseLetters` (Unicode General Categories Lu and Lt).
    ///
    /// The conversion to lower case uses `Locale.system`, also known as the ICU "root" locale. This means the result
    /// is consistent regardless of the current user's locale and language preferences.
    ///
    /// Converting from camel case to snake case:
    /// 1. Splits words at the boundary of lower-case to upper-case
    /// 2. Inserts `_` between words
    /// 3. Lowercases the entire string
    /// 4. Preserves starting and ending `_`.
    ///
    /// For example, `oneTwoThree` becomes `one_two_three`. `_oneTwoThree_` becomes `_one_two_three_`.
    internal func convertToSnakeCase() -> Self {
        guard !isEmpty else {
            return String()
        }
            
        var previousCharacter: Character? = nil
        var snakeCase: [Character] = []
        
        for index in indices {
            let currentCharacter = self[index]
            
            if currentCharacter.isUppercase {
                if let previousCharacter, previousCharacter.isLowercase {
                    snakeCase.append(snakeCaseSeparator)
                } else {
                    let nextIndex = self.index(after: index)
                    
                    if nextIndex != endIndex, self[nextIndex].isLowercase {
                        snakeCase.append(snakeCaseSeparator)
                    }
                }
            }
            
            snakeCase.append(contentsOf: currentCharacter.lowercased())
            
            previousCharacter = currentCharacter
        }
        
        return String(snakeCase)
    }
}
