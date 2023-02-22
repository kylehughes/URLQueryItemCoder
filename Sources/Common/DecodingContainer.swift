//
//  DecodingContainer.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/19/23.
//

public enum DecodingContainerType<PrimitiveValue> where PrimitiveValue: DecodingPrimitiveValue {
    case multiValue(DecodingContainer<PrimitiveValue>)
    case singleValue(DecodingContainer<PrimitiveValue>.SingleValue)
    
    // MARK: Public Static Interface
    
    @inlinable
    public static var singleValue: Self {
        .singleValue(at: [])
    }
    
    @inlinable
    public static func singleValue(at codingPath: [any CodingKey]) -> Self {
        .singleValue(DecodingContainer<PrimitiveValue>.SingleValue(codingPath: codingPath))
    }
}
