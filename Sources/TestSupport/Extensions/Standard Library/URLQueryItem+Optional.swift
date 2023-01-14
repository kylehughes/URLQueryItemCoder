//
//  URLQueryItem+Optional.swift
//  TestSupport
//
//  Created by Kyle Hughes on 12/30/22.
//

import Foundation

@testable import Common

extension URLQueryItem {
    // MARK: Public Static Interface
    
    public static func nilIfValueIsNil(name: String, value: String?) -> URLQueryItem? {
        guard let value else {
            return nil
        }
        
        return URLQueryItem(name: name, value: value)
    }
    
    public static func nilIfValueIsNil(name: String, value: (some LosslessStringConvertible)?) -> URLQueryItem? {
        guard let value else {
            return nil
        }
        
        return URLQueryItem(name: name, value: value)
    }
}
