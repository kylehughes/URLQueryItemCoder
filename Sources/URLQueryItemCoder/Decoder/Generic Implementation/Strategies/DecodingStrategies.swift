//
//  DecodingStrategies.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 3/9/23.
//

/// The strategies for decoding `Decodable` values.
public struct DecodingStrategies {
    /// The collection initialized to all default values.
    public static let `default` = Self()
    
    /// The strategy to use for encoding `Data` values.
    public var dataStrategy: DataDecodingStrategy
    
    /// The strategy to use for encoding `Date` values.
    public var dateStrategy: DateDecodingStrategy
    
    /// The strategy to use for automatically changing the value of keys before decoding.
    public var keyStrategy: KeyDecodingStrategy
    
    /// The strategy to use for non-conforming floating-point values (IEEE 754 infinity and NaN).
    public var nonConformingFloatStrategy: NonConformingFloatDecodingStrategy
    
    // MARK: Public Initialization
    
    /// Creates a new collection of decoding strategies for decoding `Decodable` values.
    ///
    /// The default decoding strategies are used if none are supplied.
    ///
    /// - Parameter dataStrategy: The strategy to use for decoding `Data` values.
    /// - Parameter dateStrategy: The strategy to use for decoding `Date` values.
    /// - Parameter keyStrategy: The strategy to use for decoding keys on keyed containers.
    /// - Parameter nonConformingFloatStrategy: The strategy to use for decoding non-conforming floating-point values
    ///   (IEEE 754 infinity and NaN).
    /// - Returns: Decoding strategies for decoding `Decodable` values.
    public init(
        dataStrategy: DataDecodingStrategy = .default,
        dateStrategy: DateDecodingStrategy = .default,
        keyStrategy: KeyDecodingStrategy = .default,
        nonConformingFloatStrategy: NonConformingFloatDecodingStrategy = .default
    ) {
        self.dataStrategy = dataStrategy
        self.dateStrategy = dateStrategy
        self.keyStrategy = keyStrategy
        self.nonConformingFloatStrategy = nonConformingFloatStrategy
    }
}
