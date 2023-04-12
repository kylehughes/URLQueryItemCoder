//
//  DateEncodingStrategy.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 3/6/23.
//

import Foundation

/// The strategy to use for encoding `Date` values.
public enum DateEncodingStrategy {
    /// Encode the `Date` as a custom value encoded by the given closure.
    ///
    /// If the closure fails to encode a value into the given encoder, the encoder will encode an empty automatic
    /// container in its place.
    case custom((Date, Encoder) throws -> Void)
    /// Defer to `Date` for choosing an encoding.
    ///
    /// This is the default strategy.
    case deferredToDate
    /// Encode the `Date` as a string formatted by the given formatter.
    case formatted(DateFormatter)
    /// Encode the `Date` as an ISO-8601-formatted string (in RFC 3339 format).
    case iso8601
    /// Encode the `Date` as UNIX millisecond timestamp (as a number).
    case millisecondsSince1970
    /// Encode the `Date` as a UNIX timestamp (as a number).
    case secondsSince1970
    
    // MARK: Public Static Interface
    
    /// The default encoding strategy.
    ///
    /// Equals `.deferredToDate`.
    public static let `default`: DateEncodingStrategy = .deferredToDate
    
    // MARK: Internal Instance Interface
    
    internal func encode(
        _ date: Date,
        at codingPath: [any CodingKey],
        using configuration: EncodingStrategies
    ) throws -> EncodingContainer {
        switch self {
        case let .custom(closure):
            let lowLevelEncoder = LowLevelEncoder(codingPath: codingPath, configuration: configuration)
            
            try closure(date, lowLevelEncoder)
            
            guard let container = lowLevelEncoder.container else {
                preconditionFailure("Date was not encoded by low level encoder.")
            }
            
            return container
        case let .formatted(formatter):
            let container = EncodingContainer.SingleValue(codingPath: codingPath, configuration: configuration)
            
            try container.encode(formatter.string(from: date))
            
            return .singleValue(container)
        case .iso8601:
            let formatter = ISO8601DateFormatter()
            formatter.formatOptions = .withInternetDateTime
            
            let container = EncodingContainer.SingleValue(codingPath: codingPath, configuration: configuration)
            
            try container.encode(formatter.string(from: date))
            
            return .singleValue(container)
        case .deferredToDate:
            return try .encodeByDeferringToType(date, at: codingPath, using: configuration)
        case .millisecondsSince1970:
            let container = EncodingContainer.SingleValue(codingPath: codingPath, configuration: configuration)
            
            try container.encode(date.timeIntervalSince1970 * 1_000)
            
            return .singleValue(container)
        case .secondsSince1970:
            let container = EncodingContainer.SingleValue(codingPath: codingPath, configuration: configuration)
            
            try container.encode(date.timeIntervalSince1970)
            
            return .singleValue(container)
        }
    }
}
