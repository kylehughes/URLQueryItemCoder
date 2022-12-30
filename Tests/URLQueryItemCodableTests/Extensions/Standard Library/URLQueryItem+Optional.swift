//
//  URLQueryItem+Optional.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 12/30/22.
//

import Foundation

@testable import URLQueryItemCodable

extension URLQueryItem {
    // MARK: Internal Static Interface
    
    internal static func nilIfValueIsNil(name: String, value: String?) -> URLQueryItem? {
        guard let value else {
            return nil
        }
        
        return URLQueryItem(name: name, value: value)
    }
    
    internal static func nilIfValueIsNil(name: String, value: (some LosslessStringConvertible)?) -> URLQueryItem? {
        guard let value else {
            return nil
        }
        
        return URLQueryItem(name: name, value: value)
    }
}
