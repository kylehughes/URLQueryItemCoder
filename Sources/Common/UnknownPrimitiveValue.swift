//
//  UnknownPrimitiveValue.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/16/23.
//

import Foundation

public struct UnknownPrimitiveValue {
    public let value: Any
    
    // MARK: Public Initialization
    
    public init(_ value: Any) {
        self.value = value
    }
}

// MARK: - PrimitiveValueRepresentation Extension

extension UnknownPrimitiveValue: PrimitiveValueRepresentation {
    // NO-OP
}
