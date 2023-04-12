//
//  CodableTestExpectation.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/12/23.
//

import Foundation

@testable import URLQueryItemCoder

public struct CodableTestExpectation<Value> {
    public typealias Expectation<Other> = (Other, EncodingStrategies) -> Value
    
    public let prepareForEqualityAssertion: (Value) -> Value
    
    // MARK: Single Value Primitive Expectations
    
    public let singleValueBool: Expectation<Bool>
    public let singleValueInt: Expectation<Int>
    public let singleValueInt8: Expectation<Int8>
    public let singleValueInt16: Expectation<Int16>
    public let singleValueInt32: Expectation<Int32>
    public let singleValueInt64: Expectation<Int64>
    public let singleValueNil: Expectation<String?>
    public let singleValueString: Expectation<String>
    public let singleValueUInt: Expectation<UInt>
    public let singleValueUInt8: Expectation<UInt8>
    public let singleValueUInt16: Expectation<UInt16>
    public let singleValueUInt32: Expectation<UInt32>
    public let singleValueUInt64: Expectation<UInt64>
    
    // MARK: Single Value Data Expectations
    
    public let singleValueDataBase64: Expectation<Data>
    public let singleValueDataCustom: Expectation<Data>
    public let singleValueDataDeferredToData: Expectation<Data>
    
    // MARK: Single Value Date Expectations
    
    public let singleValueDateCustom: Expectation<Date>
    public let singleValueDateDeferredToDate: Expectation<Date>
    public let singleValueDateFormatted: Expectation<Date>
    public let singleValueDateISO8601: Expectation<Date>
    public let singleValueDateMillisecondsSince1970: Expectation<Date>
    public let singleValueDateSecondsSince1970: Expectation<Date>
    
    // MARK: Single Value Double Expectations
    
    public let singleValueDouble: Expectation<Double>
    public let singleValueDoubleConvertToStringNaN: Expectation<Double>
    public let singleValueDoubleConvertToStringNegativeInfinity: Expectation<Double>
    public let singleValueDoubleConvertToStringPositiveInfinity: Expectation<Double>
    
    // MARK: Single Value Float Expectations
    
    public let singleValueFloat: Expectation<Float>
    public let singleValueFloatConvertToStringNaN: Expectation<Float>
    public let singleValueFloatConvertToStringNegativeInfinity: Expectation<Float>
    public let singleValueFloatConvertToStringPositiveInfinity: Expectation<Float>
    
    // MARK: Keyed Value Expectations
    
    public let keyedValueDefault: Expectation<CodableTestTypes.SingleValueProperties>
    public let keyedValueEmpty: Expectation<CodableTestTypes.SingleValueProperties>
    public let keyedValuePartial: Expectation<CodableTestTypes.SingleValueProperties>
    
    // MARK: Keyed Value Inheritance Expectations
    
    public let inheritanceKeyedValueDefault: Expectation<CodableTestTypes.SingleValueProperties.Subclass>
    public let inheritanceKeyedValueEmpty: Expectation<CodableTestTypes.SingleValueProperties.Subclass>
    public let inheritanceKeyedValuePartial: Expectation<CodableTestTypes.SingleValueProperties.Subclass>
    
    // MARK: Keyed Value Data Expectations
    
    public let keyedValueDataBase64: Expectation<CodableTestTypes.SingleValueProperties.Abridged>
    public let keyedValueDataCustom: Expectation<CodableTestTypes.SingleValueProperties.Abridged>
    public let keyedValueDataDeferredToData: Expectation<CodableTestTypes.SingleValueProperties.Abridged>
    
    // MARK: Keyed Value Date Expectations
    
    public let keyedValueDateCustom: Expectation<CodableTestTypes.SingleValueProperties>
    public let keyedValueDateDeferredToDate: Expectation<CodableTestTypes.SingleValueProperties>
    public let keyedValueDateFormatted: Expectation<CodableTestTypes.SingleValueProperties>
    public let keyedValueDateISO8601: Expectation<CodableTestTypes.SingleValueProperties>
    public let keyedValueDateMillisecondsSince1970: Expectation<CodableTestTypes.SingleValueProperties>
    public let keyedValueDateSecondsSince1970: Expectation<CodableTestTypes.SingleValueProperties>
    
    // MARK: Keyed Value Double Expectations
    
    public let keyedValueDouble: Expectation<CodableTestTypes.SingleValueProperties.Abridged>
    public let keyedValueDoubleConvertToStringNaN: Expectation<CodableTestTypes.SingleValueProperties.Abridged>
    public let keyedValueDoubleConvertToStringNegativeInfinity: Expectation<CodableTestTypes.SingleValueProperties.Abridged>
    public let keyedValueDoubleConvertToStringPositiveInfinity: Expectation<CodableTestTypes.SingleValueProperties.Abridged>
    
    // MARK: Keyed Value Float Expectations
    
    public let keyedValueFloat: Expectation<CodableTestTypes.SingleValueProperties.Abridged>
    public let keyedValueFloatConvertToStringNaN: Expectation<CodableTestTypes.SingleValueProperties.Abridged>
    public let keyedValueFloatConvertToStringNegativeInfinity: Expectation<CodableTestTypes.SingleValueProperties.Abridged>
    public let keyedValueFloatConvertToStringPositiveInfinity: Expectation<CodableTestTypes.SingleValueProperties.Abridged>
    
    // MARK: Keyed Value Key Expectations
    
    public let keyedValueKeyCustom: Expectation<CodableTestTypes.KeyEncodingStrategy>
    public let keyedValueKeySnakeCase: Expectation<CodableTestTypes.KeyEncodingStrategy>
    public let keyedValueKeyUseDefaultKeys: Expectation<CodableTestTypes.KeyEncodingStrategy>
    
    // MARK: Keyed Value Output Formatting Expectations
    
    public let keyedValueSortedKeys: Expectation<CodableTestTypes.SingleValueProperties.Abridged>
    
    // MARK: Unkeyed Value Primitive Expectations
    
    public let unkeyedValueBool: Expectation<[Bool]>
    public let unkeyedValueInt: Expectation<[Int]>
    public let unkeyedValueInt8: Expectation<[Int8]>
    public let unkeyedValueInt16: Expectation<[Int16]>
    public let unkeyedValueInt32: Expectation<[Int32]>
    public let unkeyedValueInt64: Expectation<[Int64]>
    public let unkeyedValueNil: Expectation<[String?]>
    public let unkeyedValueString: Expectation<[String]>
    public let unkeyedValueUInt: Expectation<[UInt]>
    public let unkeyedValueUInt8: Expectation<[UInt8]>
    public let unkeyedValueUInt16: Expectation<[UInt16]>
    public let unkeyedValueUInt32: Expectation<[UInt32]>
    public let unkeyedValueUInt64: Expectation<[UInt64]>
    
    // MARK: Unkeyed Value Data Expectations
    
    public let unkeyedValueDataBase64: Expectation<[Data]>
    public let unkeyedValueDataCustom: Expectation<[Data]>
    public let unkeyedValueDataDeferredToData: Expectation<[Data]>
    
    // MARK: Unkeyed Value Date Expectations
    
    public let unkeyedValueDateCustom: Expectation<[Date]>
    public let unkeyedValueDateDeferredToDate: Expectation<[Date]>
    public let unkeyedValueDateFormatted: Expectation<[Date]>
    public let unkeyedValueDateISO8601: Expectation<[Date]>
    public let unkeyedValueDateMillisecondsSince1970: Expectation<[Date]>
    public let unkeyedValueDateSecondsSince1970: Expectation<[Date]>
    
    // MARK: Unkeyed Value Double Expectations
    
    public let unkeyedValueDouble: Expectation<[Double]>
    public let unkeyedValueDoubleConvertToStringNaN: Expectation<[Double]>
    public let unkeyedValueDoubleConvertToStringNegativeInfinity: Expectation<[Double]>
    public let unkeyedValueDoubleConvertToStringPositiveInfinity: Expectation<[Double]>
    
    // MARK: Unkeyed Value Float Expectations
    
    public let unkeyedValueFloat: Expectation<[Float]>
    public let unkeyedValueFloatConvertToStringNaN: Expectation<[Float]>
    public let unkeyedValueFloatConvertToStringNegativeInfinity: Expectation<[Float]>
    public let unkeyedValueFloatConvertToStringPositiveInfinity: Expectation<[Float]>
    
    // MARK: Public Initialization
    
    public init(
        prepareForEqualityAssertion: @escaping (Value) -> Value,
        singleValueBool: @escaping Expectation<Bool>,
        singleValueInt: @escaping Expectation<Int>,
        singleValueInt8: @escaping Expectation<Int8>,
        singleValueInt16: @escaping Expectation<Int16>,
        singleValueInt32: @escaping Expectation<Int32>,
        singleValueInt64: @escaping Expectation<Int64>,
        singleValueNil: @escaping Expectation<String?>,
        singleValueString: @escaping Expectation<String>,
        singleValueUInt: @escaping Expectation<UInt>,
        singleValueUInt8: @escaping Expectation<UInt8>,
        singleValueUInt16: @escaping Expectation<UInt16>,
        singleValueUInt32: @escaping Expectation<UInt32>,
        singleValueUInt64: @escaping Expectation<UInt64>,
        singleValueDataBase64: @escaping Expectation<Data>,
        singleValueDataCustom: @escaping Expectation<Data>,
        singleValueDataDeferredToData: @escaping Expectation<Data>,
        singleValueDateCustom: @escaping Expectation<Date>,
        singleValueDateDeferredToDate: @escaping Expectation<Date>,
        singleValueDateFormatted: @escaping Expectation<Date>,
        singleValueDateISO8601: @escaping Expectation<Date>,
        singleValueDateMillisecondsSince1970: @escaping Expectation<Date>,
        singleValueDateSecondsSince1970: @escaping Expectation<Date>,
        singleValueDouble: @escaping Expectation<Double>,
        singleValueDoubleConvertToStringNaN: @escaping Expectation<Double>,
        singleValueDoubleConvertToStringNegativeInfinity: @escaping Expectation<Double>,
        singleValueDoubleConvertToStringPositiveInfinity: @escaping Expectation<Double>,
        singleValueFloat: @escaping Expectation<Float>,
        singleValueFloatConvertToStringNaN: @escaping Expectation<Float>,
        singleValueFloatConvertToStringNegativeInfinity: @escaping Expectation<Float>,
        singleValueFloatConvertToStringPositiveInfinity: @escaping Expectation<Float>,
        keyedValueDefault: @escaping Expectation<CodableTestTypes.SingleValueProperties>,
        keyedValueEmpty: @escaping Expectation<CodableTestTypes.SingleValueProperties>,
        keyedValuePartial: @escaping Expectation<CodableTestTypes.SingleValueProperties>,
        inheritanceKeyedValueDefault: @escaping Expectation<CodableTestTypes.SingleValueProperties.Subclass>,
        inheritanceKeyedValueEmpty: @escaping Expectation<CodableTestTypes.SingleValueProperties.Subclass>,
        inheritanceKeyedValuePartial: @escaping Expectation<CodableTestTypes.SingleValueProperties.Subclass>,
        keyedValueDataBase64: @escaping Expectation<CodableTestTypes.SingleValueProperties.Abridged>,
        keyedValueDataCustom: @escaping Expectation<CodableTestTypes.SingleValueProperties.Abridged>,
        keyedValueDataDeferredToData: @escaping Expectation<CodableTestTypes.SingleValueProperties.Abridged>,
        keyedValueDateCustom: @escaping Expectation<CodableTestTypes.SingleValueProperties>,
        keyedValueDateDeferredToDate: @escaping Expectation<CodableTestTypes.SingleValueProperties>,
        keyedValueDateFormatted: @escaping Expectation<CodableTestTypes.SingleValueProperties>,
        keyedValueDateISO8601: @escaping Expectation<CodableTestTypes.SingleValueProperties>,
        keyedValueDateMillisecondsSince1970: @escaping Expectation<CodableTestTypes.SingleValueProperties>,
        keyedValueDateSecondsSince1970: @escaping Expectation<CodableTestTypes.SingleValueProperties>,
        keyedValueDouble: @escaping Expectation<CodableTestTypes.SingleValueProperties.Abridged>,
        keyedValueDoubleConvertToStringNaN: @escaping Expectation<CodableTestTypes.SingleValueProperties.Abridged>,
        keyedValueDoubleConvertToStringNegativeInfinity: @escaping Expectation<CodableTestTypes.SingleValueProperties.Abridged>,
        keyedValueDoubleConvertToStringPositiveInfinity: @escaping Expectation<CodableTestTypes.SingleValueProperties.Abridged>,
        keyedValueFloat: @escaping Expectation<CodableTestTypes.SingleValueProperties.Abridged>,
        keyedValueFloatConvertToStringNaN: @escaping Expectation<CodableTestTypes.SingleValueProperties.Abridged>,
        keyedValueFloatConvertToStringNegativeInfinity: @escaping Expectation<CodableTestTypes.SingleValueProperties.Abridged>,
        keyedValueFloatConvertToStringPositiveInfinity: @escaping Expectation<CodableTestTypes.SingleValueProperties.Abridged>,
        keyedValueKeyCustom: @escaping Expectation<CodableTestTypes.KeyEncodingStrategy>,
        keyedValueKeySnakeCase: @escaping Expectation<CodableTestTypes.KeyEncodingStrategy>,
        keyedValueKeyUseDefaultKeys: @escaping Expectation<CodableTestTypes.KeyEncodingStrategy>,
        keyedValueSortedKeys: @escaping Expectation<CodableTestTypes.SingleValueProperties.Abridged>,
        unkeyedValueBool: @escaping Expectation<[Bool]>,
        unkeyedValueInt: @escaping Expectation<[Int]>,
        unkeyedValueInt8: @escaping Expectation<[Int8]>,
        unkeyedValueInt16: @escaping Expectation<[Int16]>,
        unkeyedValueInt32: @escaping Expectation<[Int32]>,
        unkeyedValueInt64: @escaping Expectation<[Int64]>,
        unkeyedValueNil: @escaping Expectation<[String?]>,
        unkeyedValueString: @escaping Expectation<[String]>,
        unkeyedValueUInt: @escaping Expectation<[UInt]>,
        unkeyedValueUInt8: @escaping Expectation<[UInt8]>,
        unkeyedValueUInt16: @escaping Expectation<[UInt16]>,
        unkeyedValueUInt32: @escaping Expectation<[UInt32]>,
        unkeyedValueUInt64: @escaping Expectation<[UInt64]>,
        unkeyedValueDataBase64: @escaping Expectation<[Data]>,
        unkeyedValueDataCustom: @escaping Expectation<[Data]>,
        unkeyedValueDataDeferredToData: @escaping Expectation<[Data]>,
        unkeyedValueDateCustom: @escaping Expectation<[Date]>,
        unkeyedValueDateDeferredToDate: @escaping Expectation<[Date]>,
        unkeyedValueDateFormatted: @escaping Expectation<[Date]>,
        unkeyedValueDateISO8601: @escaping Expectation<[Date]>,
        unkeyedValueDateMillisecondsSince1970: @escaping Expectation<[Date]>,
        unkeyedValueDateSecondsSince1970: @escaping Expectation<[Date]>,
        unkeyedValueDouble: @escaping Expectation<[Double]>,
        unkeyedValueDoubleConvertToStringNaN: @escaping Expectation<[Double]>,
        unkeyedValueDoubleConvertToStringNegativeInfinity: @escaping Expectation<[Double]>,
        unkeyedValueDoubleConvertToStringPositiveInfinity: @escaping Expectation<[Double]>,
        unkeyedValueFloat: @escaping Expectation<[Float]>,
        unkeyedValueFloatConvertToStringNaN: @escaping Expectation<[Float]>,
        unkeyedValueFloatConvertToStringNegativeInfinity: @escaping Expectation<[Float]>,
        unkeyedValueFloatConvertToStringPositiveInfinity: @escaping Expectation<[Float]>
    ) {
        self.prepareForEqualityAssertion = prepareForEqualityAssertion
        self.keyedValueDefault = keyedValueDefault
        self.keyedValueEmpty = keyedValueEmpty
        self.keyedValuePartial = keyedValuePartial
        self.inheritanceKeyedValueDefault = inheritanceKeyedValueDefault
        self.inheritanceKeyedValueEmpty = inheritanceKeyedValueEmpty
        self.inheritanceKeyedValuePartial = inheritanceKeyedValuePartial
        self.singleValueBool = singleValueBool
        self.singleValueInt = singleValueInt
        self.singleValueInt8 = singleValueInt8
        self.singleValueInt16 = singleValueInt16
        self.singleValueInt32 = singleValueInt32
        self.singleValueInt64 = singleValueInt64
        self.singleValueNil = singleValueNil
        self.singleValueString = singleValueString
        self.singleValueUInt = singleValueUInt
        self.singleValueUInt8 = singleValueUInt8
        self.singleValueUInt16 = singleValueUInt16
        self.singleValueUInt32 = singleValueUInt32
        self.singleValueUInt64 = singleValueUInt64
        self.singleValueDataBase64 = singleValueDataBase64
        self.singleValueDataCustom = singleValueDataCustom
        self.singleValueDataDeferredToData = singleValueDataDeferredToData
        self.singleValueDateCustom = singleValueDateCustom
        self.singleValueDateDeferredToDate = singleValueDateDeferredToDate
        self.singleValueDateFormatted = singleValueDateFormatted
        self.singleValueDateISO8601 = singleValueDateISO8601
        self.singleValueDateMillisecondsSince1970 = singleValueDateMillisecondsSince1970
        self.singleValueDateSecondsSince1970 = singleValueDateSecondsSince1970
        self.singleValueDouble = singleValueDouble
        self.singleValueDoubleConvertToStringNaN = singleValueDoubleConvertToStringNaN
        self.singleValueDoubleConvertToStringNegativeInfinity = singleValueDoubleConvertToStringNegativeInfinity
        self.singleValueDoubleConvertToStringPositiveInfinity = singleValueDoubleConvertToStringPositiveInfinity
        self.singleValueFloat = singleValueFloat
        self.singleValueFloatConvertToStringNaN = singleValueFloatConvertToStringNaN
        self.singleValueFloatConvertToStringNegativeInfinity = singleValueFloatConvertToStringNegativeInfinity
        self.singleValueFloatConvertToStringPositiveInfinity = singleValueFloatConvertToStringPositiveInfinity
        self.keyedValueDataBase64 = keyedValueDataBase64
        self.keyedValueDataCustom = keyedValueDataCustom
        self.keyedValueDataDeferredToData = keyedValueDataDeferredToData
        self.keyedValueDateCustom = keyedValueDateCustom
        self.keyedValueDateDeferredToDate = keyedValueDateDeferredToDate
        self.keyedValueDateFormatted = keyedValueDateFormatted
        self.keyedValueDateISO8601 = keyedValueDateISO8601
        self.keyedValueDateMillisecondsSince1970 = keyedValueDateMillisecondsSince1970
        self.keyedValueDateSecondsSince1970 = keyedValueDateSecondsSince1970
        self.keyedValueDouble = keyedValueDouble
        self.keyedValueDoubleConvertToStringNaN = keyedValueDoubleConvertToStringNaN
        self.keyedValueDoubleConvertToStringNegativeInfinity = keyedValueDoubleConvertToStringNegativeInfinity
        self.keyedValueDoubleConvertToStringPositiveInfinity = keyedValueDoubleConvertToStringPositiveInfinity
        self.keyedValueFloat = keyedValueFloat
        self.keyedValueFloatConvertToStringNaN = keyedValueFloatConvertToStringNaN
        self.keyedValueFloatConvertToStringNegativeInfinity = keyedValueFloatConvertToStringNegativeInfinity
        self.keyedValueFloatConvertToStringPositiveInfinity = keyedValueFloatConvertToStringPositiveInfinity
        self.keyedValueKeyCustom = keyedValueKeyCustom
        self.keyedValueKeySnakeCase = keyedValueKeySnakeCase
        self.keyedValueKeyUseDefaultKeys = keyedValueKeyUseDefaultKeys
        self.keyedValueSortedKeys = keyedValueSortedKeys
        self.unkeyedValueBool = unkeyedValueBool
        self.unkeyedValueInt = unkeyedValueInt
        self.unkeyedValueInt8 = unkeyedValueInt8
        self.unkeyedValueInt16 = unkeyedValueInt16
        self.unkeyedValueInt32 = unkeyedValueInt32
        self.unkeyedValueInt64 = unkeyedValueInt64
        self.unkeyedValueNil = unkeyedValueNil
        self.unkeyedValueString = unkeyedValueString
        self.unkeyedValueUInt = unkeyedValueUInt
        self.unkeyedValueUInt8 = unkeyedValueUInt8
        self.unkeyedValueUInt16 = unkeyedValueUInt16
        self.unkeyedValueUInt32 = unkeyedValueUInt32
        self.unkeyedValueUInt64 = unkeyedValueUInt64
        self.unkeyedValueDataBase64 = unkeyedValueDataBase64
        self.unkeyedValueDataCustom = unkeyedValueDataCustom
        self.unkeyedValueDataDeferredToData = unkeyedValueDataDeferredToData
        self.unkeyedValueDateCustom = unkeyedValueDateCustom
        self.unkeyedValueDateDeferredToDate = unkeyedValueDateDeferredToDate
        self.unkeyedValueDateFormatted = unkeyedValueDateFormatted
        self.unkeyedValueDateISO8601 = unkeyedValueDateISO8601
        self.unkeyedValueDateMillisecondsSince1970 = unkeyedValueDateMillisecondsSince1970
        self.unkeyedValueDateSecondsSince1970 = unkeyedValueDateSecondsSince1970
        self.unkeyedValueDouble = unkeyedValueDouble
        self.unkeyedValueDoubleConvertToStringNaN = unkeyedValueDoubleConvertToStringNaN
        self.unkeyedValueDoubleConvertToStringNegativeInfinity = unkeyedValueDoubleConvertToStringNegativeInfinity
        self.unkeyedValueDoubleConvertToStringPositiveInfinity = unkeyedValueDoubleConvertToStringPositiveInfinity
        self.unkeyedValueFloat = unkeyedValueFloat
        self.unkeyedValueFloatConvertToStringNaN = unkeyedValueFloatConvertToStringNaN
        self.unkeyedValueFloatConvertToStringNegativeInfinity = unkeyedValueFloatConvertToStringNegativeInfinity
        self.unkeyedValueFloatConvertToStringPositiveInfinity = unkeyedValueFloatConvertToStringPositiveInfinity
    }
}

// MARK: Public Instance Interface

/// - SeeAlso: https://github.com/apple/swift-corelibs-foundation/blob/main/Sources/Foundation/Data.swift#L2869
public func expectedStringValue(
    for data: Data?,
    using options: EncodingStrategies
) -> String? {
    guard let data else {
        return nil
    }
    
    switch options.dataStrategy {
    case .base64:
        return data.base64EncodedString()
    case .custom:
        return "42"
    case .deferredToData:
        return String(data: data, encoding: .utf8)
    }
}

/// - SeeAlso: https://github.com/apple/swift-corelibs-foundation/blob/main/Sources/Foundation/Date.swift#L291
public func expectedStringValue(
    for date: Date?,
    using options: EncodingStrategies
) -> String? {
    guard let date else {
        return nil
    }
    
    switch options.dateStrategy {
    case .custom:
        return "42"
    case let .formatted(formatter):
        return formatter.string(from: date)
    case .iso8601:
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = .withInternetDateTime
        return formatter.string(from: date)
    case .deferredToDate:
        return date.timeIntervalSinceReferenceDate.description
    case .millisecondsSince1970:
        return (date.timeIntervalSince1970 * 1_000).description
    case .secondsSince1970:
        return date.timeIntervalSince1970.description
    }
}
