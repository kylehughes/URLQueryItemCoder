//
//  DecodingContainer.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/19/23.
//

public enum DecodingContainer<PrimitiveValue> where PrimitiveValue: DecodingPrimitiveValue {
    case multiValue(MultiValue)
    case singleValue(SingleValue)
    
    // MARK: Public Static Interface
    
    @inlinable
    public static func empty(at codingPath: [any CodingKey]) -> Self {
        .multiValue(at: codingPath)
    }
    
    @inlinable
    public static func multiValue(at codingPath: [any CodingKey]) -> Self {
        .multiValue(MultiValue(codingPath: codingPath))
    }
    
    @inlinable
    public static var singleValue: Self {
        .singleValue(at: [])
    }
    
    @inlinable
    public static func singleValue(at codingPath: [any CodingKey]) -> Self {
        .singleValue(SingleValue(codingPath: codingPath))
    }
}
