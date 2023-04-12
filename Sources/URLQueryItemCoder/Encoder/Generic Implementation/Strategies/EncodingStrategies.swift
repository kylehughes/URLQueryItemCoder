//
//  EncodingStrategies.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 3/9/23.
//

/// The strategies for encoding `Encodable` values.
public struct EncodingStrategies {
    /// The collection initialized to all default values.
    public static let `default` = Self()
    
    /// The strategy to use for encoding `Data` values.
    public var dataStrategy: DataEncodingStrategy
    
    /// The strategy to use for encoding `Date` values.
    public var dateStrategy: DateEncodingStrategy
    
    /// The strategy to use for automatically changing the value of keys before encoding.
    public var keyStrategy: KeyEncodingStrategy
    
    /// The strategy to use for non-conforming floating-point values (IEEE 754 infinity and NaN).
    public var nonConformingFloatStrategy: NonConformingFloatEncodingStrategy
    
    // MARK: Public Initialization

    /// Creates a new collection of encoding strategies for encoding `Encodable` values.
    ///
    /// The default encoding strategies are used if none are supplied.
    ///
    /// - Parameter dataStrategy: The strategy to use for encoding `Data` values.
    /// - Parameter dateStrategy: The strategy to use for encoding `Date` values.
    /// - Parameter keyStrategy: The strategy to use for encoding keys on keyed containers.
    /// - Parameter nonConformingFloatStrategy: The strategy to use for encoding non-conforming floating-point values
    ///   (IEEE 754 infinity and NaN).
    /// - Returns: Encoding strategies for encoding `Encodable` values.
    public init(
        dataStrategy: DataEncodingStrategy = .default,
        dateStrategy: DateEncodingStrategy = .default,
        keyStrategy: KeyEncodingStrategy = .default,
        nonConformingFloatStrategy: NonConformingFloatEncodingStrategy = .default
    ) {
        self.dataStrategy = dataStrategy
        self.dateStrategy = dateStrategy
        self.keyStrategy = keyStrategy
        self.nonConformingFloatStrategy = nonConformingFloatStrategy
    }
}
