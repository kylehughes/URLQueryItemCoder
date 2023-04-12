//
//  NonConformingFloatEncodingStrategy.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 3/17/23.
//

/// The strategy to use for non-conforming floating-point values (IEEE 754 infinity and NaN).
public enum NonConformingFloatEncodingStrategy {
    /// Encode the values using the given representation strings.
    case convertToString(positiveInfinity: String, negativeInfinity: String, nan: String)
    
    /// Throw upon encountering non-conforming values. This is the default strategy.
    case `throw`
    
    // MARK: Public Static Interface
    
    /// The default encoding strategy.
    ///
    /// Equals `.throw`.
    public static let `default`: Self = .throw
    
    // MARK: Internal Instance Interface
    
    internal func encode<F>(
        _ float: F,
        at codingPath: [any CodingKey],
        using configuration: EncodingStrategies
    ) throws -> EncodingPrimitiveValue where F: CustomStringConvertible & FloatingPoint {
        guard !float.isNaN, !float.isInfinite else {
            switch self {
            case let .convertToString(posInf, negInf, nan):
                return .string(
                    {
                        switch float {
                        case .infinity:
                            return posInf
                        case -.infinity:
                            return negInf
                        default:
                            return nan
                        }
                    }()
                )
            case .throw:
                throw EncodingError.invalidValue(
                    float,
                    EncodingError.Context(
                        codingPath: codingPath,
                        debugDescription: "Unable to encode \(F.self).\(float) directly."
                    )
                )
            }
        }

        var string = float.description
        
        if string.hasSuffix(".0") {
            string.removeLast(2)
        }
        
        return .string(string)
    }
}
