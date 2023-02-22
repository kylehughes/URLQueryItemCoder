//
//  URLQueryItem+LosslessStringConvertible.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 12/29/22.
//

import Foundation

extension URLQueryItem {
    // MARK: Public Initialization
    
    public init(name: String, value: (some LosslessStringConvertible)?) {
        guard let value else {
            self.init(name: name, value: nil)
            return
        }
        
        self.init(name: name, value: String(value))
    }
}
