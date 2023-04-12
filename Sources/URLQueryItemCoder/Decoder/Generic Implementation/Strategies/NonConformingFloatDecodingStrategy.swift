//
//  NonConformingFloatDecodingStrategy.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 4/10/23.
//

/// The strategy to use for non-conforming floating-point values (IEEE 754 infinity and NaN).
public enum NonConformingFloatDecodingStrategy {
    /// Decode the values from the given representation strings.
    case convertToString(positiveInfinity: String, negativeInfinity: String, nan: String)
    
    /// Throw upon encountering non-conforming values.
    ///
    /// This is the default strategy.
    case `throw`
    
    // MARK: Public Static Interface
    
    /// The default decoding strategy.
    ///
    /// Equals `.throw`.
    public static let `default`: Self = .throw
    
    // MARK: Internal Instance Interface
    
    internal func decode<Number, PrimitiveValue>(
        insideOf lowLevelDecoder: LowLevelDecoder<PrimitiveValue>
    ) throws -> Number where Number: LosslessStringConvertible & FloatingPoint {
        let singleValueContainer = try lowLevelDecoder.container.expectedSingleValueContainer(
            at: lowLevelDecoder.codingPath
        )
        let stringValue = try singleValueContainer.decode(String.self)
        
        switch self {
        case let .convertToString(positiveInfinity, negativeInfinity, nan):
            switch stringValue {
            case nan:
                return .nan
            case negativeInfinity:
                return -.infinity
            case positiveInfinity:
                return .infinity
            default:
                guard let doubleValue = Number(stringValue) else {
                    throw DecodingError.dataCorrupted(
                        DecodingError.Context(
                            codingPath: singleValueContainer.codingPath,
                            debugDescription: "\(Number.self) unable to be decoded from string."
                        )
                    )
                }
                
                return doubleValue
            }
        case .throw:
            guard let doubleValue = Number(stringValue) else {
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: singleValueContainer.codingPath,
                        debugDescription: "\(Number.self) unable to be decoded from string."
                    )
                )
            }
            
            guard doubleValue.isFinite else {
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: singleValueContainer.codingPath,
                        debugDescription: "Parsed floating point number does not fit in \(Number.self)."
                    )
                )
            }
            
            return doubleValue
        }
    }
}
