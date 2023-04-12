//
//  DataDecodingStrategy.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 4/8/23.
//

import Foundation

/// The strategy to use for decoding `Data` values.
public enum DataDecodingStrategy {
    /// Decode the `Data` from a Base64-encoded string.
    ///
    /// This is the default strategy.
    case base64
    
    /// Decode the `Data` as a custom value decoded by the given closure.
    case custom(@Sendable (Decoder) throws -> Data)
    
    /// Defer to `Data` for decoding.
    case deferredToData
    
    // MARK: Public Static Interface
    
    /// The default decoding strategy.
    ///
    /// Equals `.base64`.
    public static let `default`: Self = .base64
    
    // MARK: Internal Instance Interface
    
    internal func decode<PrimitiveValue>(insideOf lowLevelDecoder: LowLevelDecoder<PrimitiveValue>) throws -> Data {
        switch self {
        case .base64:
            switch lowLevelDecoder.container {
            case .multiValue:
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: lowLevelDecoder.codingPath,
                        debugDescription: "Expected data to be encoded as a single value conatiner."
                    )
                )
            case let .singleValue(singleValueContainer):
                let stringValue = try singleValueContainer.decode(String.self)
                
                guard let data = Data(base64Encoded: stringValue) else {
                    throw DecodingError.dataCorrupted(
                        DecodingError.Context(
                            codingPath: singleValueContainer.codingPath,
                            debugDescription: "Data unable to be decoded from base64 string."
                        )
                    )
                }
                
                return data
            }
        case let .custom(closure):
            return try closure(lowLevelDecoder)
        case .deferredToData:
            return try Data(from: lowLevelDecoder)
        }
    }
}
