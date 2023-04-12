//
//  DateDecodingStrategy.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 4/10/23.
//

import Foundation

/// The strategy to use for decoding `Date` values.
public enum DateDecodingStrategy {
    /// Decode the `Date` as a custom value decoded by the given closure.
    case custom(@Sendable (Decoder) throws -> Date)
    /// Defer to `Date` for decoding.
    ///
    /// This is the default strategy.
    case deferredToDate
    /// Decode the `Date` as a string parsed by the given formatter.
    case formatted(DateFormatter)
    /// Decode the `Date` as an ISO-8601-formatted string (in RFC 3339 format).
    case iso8601
    /// Decode the `Date` as UNIX millisecond timestamp from a number.
    case millisecondsSince1970
    /// Decode the `Date` as a UNIX timestamp from a number.
    case secondsSince1970
    
    // MARK: Public Static Interface
    
    /// The default decoding strategy.
    ///
    /// Equals `.deferredToDate`.
    public static let `default`: Self = .deferredToDate
    
    // MARK: Internal Instance Interface
    
    internal func decode<PrimitiveValue>(insideOf lowLevelDecoder: LowLevelDecoder<PrimitiveValue>) throws -> Date {
        switch self {
        case let .custom(closure):
            return try closure(lowLevelDecoder)
        case .deferredToDate:
            return try Date(from: lowLevelDecoder)
        case let .formatted(dateFormatter):
            let singleValueContainer = try lowLevelDecoder.container.expectedSingleValueContainer(
                at: lowLevelDecoder.codingPath
            )
            let stringValue = try singleValueContainer.decode(String.self)
            
            guard let date = dateFormatter.date(from: stringValue) else {
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: singleValueContainer.codingPath,
                        debugDescription: "Date unable to be decoded from string."
                    )
                )
            }
            
            return date
        case .iso8601:
            let singleValueContainer = try lowLevelDecoder.container.expectedSingleValueContainer(
                at: lowLevelDecoder.codingPath
            )
            let dateFormatter = ISO8601DateFormatter()
            dateFormatter.formatOptions = .withInternetDateTime
            
            let stringValue = try singleValueContainer.decode(String.self)
            
            guard let date = dateFormatter.date(from: stringValue) else {
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: singleValueContainer.codingPath,
                        debugDescription: "Date unable to be decoded from string."
                    )
                )
            }
            
            return date
        case .millisecondsSince1970:
            let singleValueContainer = try lowLevelDecoder.container.expectedSingleValueContainer(
                at: lowLevelDecoder.codingPath
            )
            let doubleValue = try singleValueContainer.decode(TimeInterval.self) / 1_000
            
            return Date(timeIntervalSince1970: doubleValue)
        case .secondsSince1970:
            let singleValueContainer = try lowLevelDecoder.container.expectedSingleValueContainer(
                at: lowLevelDecoder.codingPath
            )
            let doubleValue = try singleValueContainer.decode(TimeInterval.self)
            
            return Date(timeIntervalSince1970: doubleValue)
        }
    }
}
