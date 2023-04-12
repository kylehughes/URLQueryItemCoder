//
//  DataEncodingStrategy.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 3/10/23.
//

import Foundation

/// The strategy to use for encoding `Data` values.
public enum DataEncodingStrategy {
    /// Encoded the `Data` as a Base64-encoded string.
    ///
    /// This is the default strategy.
    case base64
    
    /// Encode the `Data` as a custom value encoded by the given closure.
    ///
    /// If the closure fails to encode a value into the given encoder, the encoder will encode an empty automatic
    /// container in its place.
    case custom(@Sendable (Data, Encoder) throws -> Void)
    
    /// Defer to `Data` for choosing an encoding.
    case deferredToData
    
    // MARK: Public Static Interface
        
    /// The default encoding strategy.
    ///
    /// Equals `.base64`.
    public static let `default`: Self = .base64
    
    // MARK: Internal Instance Interface
    
    internal func encode(
        _ data: Data,
        at codingPath: [any CodingKey],
        using configuration: EncodingStrategies
    ) throws -> EncodingContainer {
        switch self {
        case .base64:
            let container = EncodingContainer.SingleValue(codingPath: codingPath, configuration: configuration)
            
            try container.encode(data.base64EncodedString())
            
            return .singleValue(container)
        case let .custom(closure):
            let lowLevelEncoder = LowLevelEncoder(codingPath: codingPath, configuration: configuration)
            
            try closure(data, lowLevelEncoder)
            
            guard let container = lowLevelEncoder.container else {
                preconditionFailure("Date was not encoded by low level encoder.")
            }
            
            return container
        case .deferredToData:
            return try .encodeByDeferringToType(data, at: codingPath, using: configuration)
        }
    }
}
