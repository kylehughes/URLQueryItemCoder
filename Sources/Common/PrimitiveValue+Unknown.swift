//
//  PrimitiveValue+Unknown.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/16/23.
//

extension PrimitiveValue {
    public struct Unknown {
        public let value: Any
        
        // MARK: Public Initialization
        
        public init(_ value: Any) {
            self.value = value
        }
    }
}

// MARK: - PrimitiveValueRepresentation Extension

extension PrimitiveValue.Unknown: PrimitiveValueRepresentation {
    // NO-OP
}
