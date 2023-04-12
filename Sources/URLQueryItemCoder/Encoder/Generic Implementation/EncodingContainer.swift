//
//  EncodingContainer.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/15/23.
//

import Foundation

internal enum EncodingContainer {
    case keyed(Keyed)
    case lowLevelEncoder(LowLevelEncoder)
    case singleValue(SingleValue)
    case unkeyed(Unkeyed)
    
    // MARK: Internal Static Interface
    
    internal static func encodeByDeferringToType<Value>(
        _ value: Value,
        at codingPath: [any CodingKey],
        using configuration: EncodingStrategies
    ) throws -> Self where Value: Encodable {
        let lowLevelEncoder = LowLevelEncoder(codingPath: codingPath, configuration: configuration)
        
        try value.encode(to: lowLevelEncoder)
        
        guard let container = lowLevelEncoder.container else {
            preconditionFailure("Encodable type \(Value.self) was not encoded by low level encoder.")
        }
        
        return container
    }
    
    internal static func encodeWithSpecialTreatment<Value>(
        _ value: Value,
        at codingPath: [any CodingKey],
        using configuration: EncodingStrategies
    ) throws -> Self where Value: Encodable {
        if let data = value as? Data {
            return try configuration.dataStrategy.encode(data, at: codingPath, using: configuration)
        } else if let date = value as? Date {
            return try configuration.dateStrategy.encode(date, at: codingPath, using: configuration)
        } else {
            return try .encodeByDeferringToType(value, at: codingPath, using: configuration)
        }
    }
}
