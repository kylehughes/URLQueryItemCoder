//
//  DecodingError+Context+Predefined.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 2/26/23.
//

extension DecodingError.Context {
    // MARK: Internal Instance Interface
    
    @inlinable
    internal static func foundNilInsteadOfPrimitiveValue(at codingPath: [any CodingKey]) -> Self {
        DecodingError.Context(
            codingPath: codingPath,
            debugDescription: "Cannot decode primitive value – found nil value instead."
        )
    }
    
    @inlinable
    internal static func noValueAssociatedWithKey(at codingPath: [any CodingKey]) -> Self {
        DecodingError.Context(
            codingPath: codingPath,
            debugDescription: "No value associated with with key."
        )
    }
    
    @inlinable
    internal static func primitiveValueMismatch(at codingPath: [any CodingKey], for type: Any.Type) -> Self {
        DecodingError.Context(
            codingPath: codingPath,
            debugDescription: "Expected to decode type \(type) as primitive value."
        )
    }
    
    @inlinable
    internal static func singleValueContainerCanOnlyActAsEmptyKeyedContainer(at codingPath: [any CodingKey]) -> Self {
        DecodingError.Context(
            codingPath: codingPath,
            debugDescription: "Single value container can only act as an empty keyed container."
        )
    }
}
