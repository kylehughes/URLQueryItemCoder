//
//  AbstractTopLevelEncoderTests.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 12/29/22.
//

import Combine
import XCTest

@testable import URLQueryItemCoder

public class AbstractTopLevelEncoderTests<Target>: XCTestCase where
    Target: TopLevelEncoder,
    Target.Output: Equatable
{
    // MARK: Public Abstract Interface
    
    public var expectedValues: CodableTestExpectation<Target.Output> {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    public func target(using configuration: EncodingStrategies = .default) -> Target {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    // MARK: Public Class Interface
    
    public class var isAbstractTestCase: Bool {
        self == AbstractTopLevelEncoderTests.self
    }
    
    // MARK: XCTestCase Implementation
    
    override class public var defaultTestSuite: XCTestSuite {
        guard isAbstractTestCase else {
            return super.defaultTestSuite
        }

        return XCTestSuite(name: "Empty Suite for \(Self.self)")
    }
    
    // MARK: Single Value Primitive Tests
    
    public func test_singleValue_bool() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: true,
            as: expectedValues.singleValueBool
        )
    }
    
    public func test_singleValue_int() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: 10,
            as: expectedValues.singleValueInt
        )
    }
    
    public func test_singleValue_int8() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: 20,
            as: expectedValues.singleValueInt8
        )
    }
    
    public func test_singleValue_int16() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: 30,
            as: expectedValues.singleValueInt16
        )
    }
    
    public func test_singleValue_int32() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: 40,
            as: expectedValues.singleValueInt32
        )
    }
    
    public func test_singleValue_int64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: 50,
            as: expectedValues.singleValueInt64
        )
    }
    
    public func test_singleValue_nil() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue: String? = nil
        let encodedValue = try target().encode(inputValue)
        
        XCTAssertEqual(encodedValue, expectedValues.singleValueNil(inputValue, .default))
    }
    
    public func test_singleValue_string() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: "DEFAULT CONSTANT",
            as: expectedValues.singleValueString
        )
    }
    
    public func test_singleValue_uint() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: 60,
            as: expectedValues.singleValueUInt
        )
    }
    
    public func test_singleValue_uint8() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: 70,
            as: expectedValues.singleValueUInt8
        )
    }
    
    public func test_singleValue_uint16() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: 80,
            as: expectedValues.singleValueUInt16
        )
    }
    
    public func test_singleValue_uint32() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: 90,
            as: expectedValues.singleValueUInt32
        )
    }
    
    public func test_singleValue_uint64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: 100,
            as: expectedValues.singleValueUInt64
        )
    }
    
    // MARK: Single Value Data Tests
    
    public func test_singleValue_data_base64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEncoder(
            target,
            encodes: Data([0xDE, 0xAD, 0xBE, 0xEF]),
            using: EncodingStrategies(dataStrategy: .base64),
            as: expectedValues.singleValueDataBase64
        )
    }
    
    public func test_singleValue_data_custom() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        // We'll encode a number instead of data
        let encode: @Sendable (Data, Encoder) throws -> Void = { date, encoder in
            var container = encoder.singleValueContainer()
            try container.encode(42)
        }

        XCTAssertEncoder(
            target,
            encodes: Data([0xDE, 0xAD, 0xBE, 0xEF]),
            using: EncodingStrategies(dataStrategy: .custom(encode)),
            as: expectedValues.singleValueDataCustom
        )
    }
    
    public func test_singleValue_data_deferredToData() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: Data([0xDE, 0xAD, 0xBE, 0xEF]),
            using: EncodingStrategies(dataStrategy: .deferredToData),
            as: expectedValues.singleValueDataDeferredToData,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    // MARK: Single Value Date Tests
    
    public func test_singleValue_date_custom() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        // We'll encode a number instead of a date
        let encode: (Date, Encoder) throws -> Void = { date, encoder in
            var container = encoder.singleValueContainer()
            try container.encode(42)
        }

        XCTAssertEncoder(
            target,
            encodes: Date(timeIntervalSince1970: 1_000),
            using: EncodingStrategies(dateStrategy: .custom(encode)),
            as: expectedValues.singleValueDateCustom
        )
    }
    
    public func test_singleValue_date_deferredToDate() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: Date(timeIntervalSince1970: 1_000),
            using: EncodingStrategies(dateStrategy: .deferredToDate),
            as: expectedValues.singleValueDateDeferredToDate
        )
    }
    
    public func test_singleValue_date_formatted() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeStyle = .full
        formatter.timeZone = TimeZone(identifier: "UTC")

        XCTAssertEncoder(
            target,
            encodes: Date(timeIntervalSince1970: 1_000),
            using: EncodingStrategies(dateStrategy: .formatted(formatter)),
            as: expectedValues.singleValueDateFormatted
        )
    }
    
    public func test_singleValue_date_iso8601() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEncoder(
            target,
            encodes: Date(timeIntervalSince1970: 1_000),
            using: EncodingStrategies(dateStrategy: .iso8601),
            as: expectedValues.singleValueDateISO8601
        )
    }
    
    public func test_singleValue_date_millisecondsSince1970() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEncoder(
            target,
            encodes: Date(timeIntervalSince1970: 1_000),
            using: EncodingStrategies(dateStrategy: .millisecondsSince1970),
            as: expectedValues.singleValueDateMillisecondsSince1970
        )
    }
    
    public func test_singleValue_date_secondsSince1970() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: Date(timeIntervalSince1970: 1_000),
            using: EncodingStrategies(dateStrategy: .secondsSince1970),
            as: expectedValues.singleValueDateSecondsSince1970
        )
    }
    
    // MARK: Single Value Double Tests
    
    public func test_singleValue_double() throws {
        XCTAssertEncoder(
            target,
            encodes: Double(100),
            as: expectedValues.singleValueDouble
        )
    }
    
    public func test_singleValue_double_convertToString_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEncoder(
            target,
            encodes: Double.nan,
            using: EncodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            as: expectedValues.singleValueDoubleConvertToStringNaN
        )
    }
    
    public func test_singleValue_double_convertToString_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEncoder(
            target,
            encodes: -Double.infinity,
            using: EncodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            as: expectedValues.singleValueDoubleConvertToStringNegativeInfinity
        )
    }
    
    public func test_singleValue_double_convertToString_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEncoder(
            target,
            encodes: Double.infinity,
            using: EncodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            as: expectedValues.singleValueDoubleConvertToStringPositiveInfinity
        )
    }
    
    public func test_singleValue_double_throw_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = Double.nan
        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)
        let target = target(using: encodingStrategies)
        
        XCTAssertThrowsError(try target.encode(inputValue))
    }
    
    public func test_singleValue_double_throw_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = -Double.infinity
        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)
        let target = target(using: encodingStrategies)
        
        XCTAssertThrowsError(try target.encode(inputValue))
    }
    
    public func test_singleValue_double_throw_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = Double.infinity
        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)
        let target = target(using: encodingStrategies)
        
        XCTAssertThrowsError(try target.encode(inputValue))
    }
    
    // MARK: Single Value Float Tests
    
    public func test_singleValue_float() throws {
        XCTAssertEncoder(
            target,
            encodes: Float(100),
            as: expectedValues.singleValueFloat
        )
    }
    
    public func test_singleValue_float_convertToString_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEncoder(
            target,
            encodes: Float.nan,
            using: EncodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            as: expectedValues.singleValueFloatConvertToStringNaN
        )
    }
    
    public func test_singleValue_float_convertToString_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEncoder(
            target,
            encodes: -Float.infinity,
            using: EncodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            as: expectedValues.singleValueFloatConvertToStringNegativeInfinity
        )
    }
    
    public func test_singleValue_float_convertToString_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEncoder(
            target,
            encodes: Float.infinity,
            using: EncodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            as: expectedValues.singleValueFloatConvertToStringPositiveInfinity
        )
    }
    
    public func test_singleValue_float_throw_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = Float.nan
        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)
        let target = target(using: encodingStrategies)
        
        XCTAssertThrowsError(try target.encode(inputValue))
    }
    
    public func test_singleValue_float_throw_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = -Float.infinity
        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)
        let target = target(using: encodingStrategies)
        
        XCTAssertThrowsError(try target.encode(inputValue))
    }
    
    public func test_singleValue_float_throw_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = Float.infinity
        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)
        let target = target(using: encodingStrategies)
        
        XCTAssertThrowsError(try target.encode(inputValue))
    }

    // MARK: Keyed Value Tests
    
    public func test_keyedValue_default() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.default,
            as: expectedValues.keyedValueDefault,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    public func test_keyedValue_empty() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.empty,
            as: expectedValues.keyedValueEmpty,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    public func test_keyedValue_partial() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.partial,
            as: expectedValues.keyedValuePartial,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    // MARK: Keyed Value Inheritance Tests
    
    public func test_inheritance_keyedValue_default() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.Subclass.subDefault,
            as: expectedValues.inheritanceKeyedValueDefault,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    public func test_inheritance_keyedValue_empty() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.Subclass.subEmpty,
            as: expectedValues.inheritanceKeyedValueEmpty,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    public func test_inheritance_keyedValue_partial() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.Subclass.subPartial,
            as: expectedValues.inheritanceKeyedValuePartial,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    // MARK: Keyed Value Data Tests
    
    public func test_keyedValue_data_base64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.Abridged.default,
            using: EncodingStrategies(dataStrategy: .base64),
            as: expectedValues.keyedValueDataBase64,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    public func test_keyedValue_data_custom() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        // We'll encode a number instead of data
        let encode: @Sendable (Data, Encoder) throws -> Void = { date, encoder in
            var container = encoder.singleValueContainer()
            try container.encode(42)
        }
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.Abridged.default,
            using: EncodingStrategies(dataStrategy: .custom(encode)),
            as: expectedValues.keyedValueDataCustom,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    public func test_keyedValue_data_deferredToData() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.Abridged.default,
            using: EncodingStrategies(dataStrategy: .deferredToData),
            as: expectedValues.keyedValueDataDeferredToData,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    // MARK: Keyed Value Date Tests
    
    public func test_keyedValue_date_custom() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        // We'll encode a number instead of a date
        let encode: (Date, Encoder) throws -> Void = { date, encoder in
            var container = encoder.singleValueContainer()
            try container.encode(42)
        }
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.default,
            using: EncodingStrategies(dateStrategy: .custom(encode)),
            as: expectedValues.keyedValueDateCustom,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    public func test_keyedValue_date_deferredToDate() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.default,
            using: EncodingStrategies(dateStrategy: .deferredToDate),
            as: expectedValues.keyedValueDateDeferredToDate,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    public func test_keyedValue_date_formatted() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeStyle = .full
        formatter.timeZone = TimeZone(identifier: "UTC")
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.default,
            using: EncodingStrategies(dateStrategy: .formatted(formatter)),
            as: expectedValues.keyedValueDateFormatted,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    public func test_keyedValue_date_iso8601() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.default,
            using: EncodingStrategies(dateStrategy: .iso8601),
            as: expectedValues.keyedValueDateISO8601,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    public func test_keyedValue_date_millisecondsSince1970() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.default,
            using: EncodingStrategies(dateStrategy: .millisecondsSince1970),
            as: expectedValues.keyedValueDateMillisecondsSince1970,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    public func test_keyedValue_date_secondsSince1970() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.default,
            using: EncodingStrategies(dateStrategy: .secondsSince1970),
            as: expectedValues.keyedValueDateSecondsSince1970,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    // MARK: Keyed Value Double Tests
    
    public func test_keyedValue_double() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.Abridged.default,
            using: .default,
            as: expectedValues.keyedValueDouble,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    public func test_keyedValue_double_convertToString_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.Abridged.doubleNegativeInfinity,
            using: EncodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            as: expectedValues.keyedValueDoubleConvertToStringNegativeInfinity,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    public func test_keyedValue_double_convertToString_notANumber() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.Abridged.doubleNotANumber,
            using: EncodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            as: expectedValues.keyedValueDoubleConvertToStringNaN,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    public func test_keyedValue_double_convertToString_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.Abridged.doublePositiveInfinity,
            using: EncodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            as: expectedValues.keyedValueDoubleConvertToStringPositiveInfinity,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    public func test_keyedValue_double_throws_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = CodableTestTypes.SingleValueProperties.Abridged.doubleNotANumber
        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)

        XCTAssertThrowsError(try target(using: encodingStrategies).encode(inputValue))
    }
    
    public func test_keyedValue_double_throws_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = CodableTestTypes.SingleValueProperties.Abridged.doubleNegativeInfinity
        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)

        XCTAssertThrowsError(try target(using: encodingStrategies).encode(inputValue))
    }
    
    public func test_keyedValue_double_throws_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = CodableTestTypes.SingleValueProperties.Abridged.doublePositiveInfinity
        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)

        XCTAssertThrowsError(try target(using: encodingStrategies).encode(inputValue))
    }
    
    // MARK: Keyed Value Float Tests
    
    public func test_keyedValue_float() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.Abridged.default,
            using: .default,
            as: expectedValues.keyedValueFloat,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    public func test_keyedValue_float_convertToString_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.Abridged.floatNegativeInfinity,
            using: EncodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            as: expectedValues.keyedValueFloatConvertToStringNegativeInfinity,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    public func test_keyedValue_float_converToString_notANumber() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.Abridged.floatNotANumber,
            using: EncodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            as: expectedValues.keyedValueFloatConvertToStringNaN,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    public func test_keyedValue_float_converToString_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.Abridged.floatPositiveInfinity,
            using: EncodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            as: expectedValues.keyedValueFloatConvertToStringPositiveInfinity,
            prepareForEqualityAssertion: expectedValues.prepareForEqualityAssertion
        )
    }
    
    public func test_keyedValue_float_throws_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = CodableTestTypes.SingleValueProperties.Abridged.floatNotANumber
        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)

        XCTAssertThrowsError(try target(using: encodingStrategies).encode(inputValue))
    }
    
    public func test_keyedValue_float_throws_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = CodableTestTypes.SingleValueProperties.Abridged.floatNegativeInfinity
        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)

        XCTAssertThrowsError(try target(using: encodingStrategies).encode(inputValue))
    }
    
    public func test_keyedValue_float_throws_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = CodableTestTypes.SingleValueProperties.Abridged.floatPositiveInfinity
        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)

        XCTAssertThrowsError(try target(using: encodingStrategies).encode(inputValue))
    }
    
    // MARK: Keyed Value Key Tests
    
    public func test_keyedValue_key_custom() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = CodableTestTypes.KeyEncodingStrategy.default
        let encodingStrategies = EncodingStrategies(
            keyStrategy: .custom(
                {
                    guard let last = $0.last else {
                        return StringCodingKey(stringValue: String())
                    }
                    
                    return StringCodingKey(stringValue: last.stringValue.uppercased())
                }
            )
        )
        
        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.keyedValueKeyCustom(inputValue, encodingStrategies)
        
        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_keyedValue_key_convertToSnakeCase() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = CodableTestTypes.KeyEncodingStrategy.default
        let encodingStrategies = EncodingStrategies(keyStrategy: .convertToSnakeCase)
        
        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.keyedValueKeySnakeCase(inputValue, encodingStrategies)
        
        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_keyedValue_key_useDefaultKeys() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = CodableTestTypes.KeyEncodingStrategy.default
        let encodingStrategies = EncodingStrategies(keyStrategy: .useDefaultKeys)
        
        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.keyedValueKeyUseDefaultKeys(inputValue, encodingStrategies)
        
        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    // MARK: Unkeyed Value Primitive Tests

    public func test_unkeyedValue_bool() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = [true, false]
        let encodingStrategies = EncodingStrategies.default
        
        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueBool(inputValue, encodingStrategies)
        
        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }

    public func test_unkeyedValue_int() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = [Int(Int32.min), Int(Int32.max)]
        let encodingStrategies = EncodingStrategies.default
        
        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueInt(inputValue, encodingStrategies)
        
        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_unkeyedValue_int8() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = [Int8.min, Int8.max]
        let encodingStrategies = EncodingStrategies.default
        
        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueInt8(inputValue, encodingStrategies)
        
        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_unkeyedValue_int16() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = [Int16.min, Int16.max]
        let encodingStrategies = EncodingStrategies.default
        
        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueInt16(inputValue, encodingStrategies)
        
        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_unkeyedValue_int32() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = [Int32.min, Int32.max]
        let encodingStrategies = EncodingStrategies.default
        
        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueInt32(inputValue, encodingStrategies)
        
        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_unkeyedValue_int64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = [Int64.min, Int64.max]
        let encodingStrategies = EncodingStrategies.default
        
        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueInt64(inputValue, encodingStrategies)
        
        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_unkeyedValue_nil() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = Array(repeating: nil as String?, count: 2)
        let encodingStrategies = EncodingStrategies.default

        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueNil(inputValue, encodingStrategies)

        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_unkeyedValue_string() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = Array(repeating: "DEFAULT CONSTANT", count: 2)
        let encodingStrategies = EncodingStrategies.default
        
        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueString(inputValue, encodingStrategies)
        
        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_unkeyedValue_uint() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = [UInt(UInt32.min), UInt(UInt32.max)]
        let encodingStrategies = EncodingStrategies.default
        
        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueUInt(inputValue, encodingStrategies)
        
        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_unkeyedValue_uint8() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = [UInt8.min, UInt8.max]
        let encodingStrategies = EncodingStrategies.default
        
        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueUInt8(inputValue, encodingStrategies)
        
        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_unkeyedValue_uint16() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = [UInt16.min, UInt16.max]
        let encodingStrategies = EncodingStrategies.default
        
        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueUInt16(inputValue, encodingStrategies)
        
        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_unkeyedValue_uint32() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = [UInt32.min, UInt32.max]
        let encodingStrategies = EncodingStrategies.default
        
        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueUInt32(inputValue, encodingStrategies)
        
        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_unkeyedValue_uint64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = [UInt64.min, UInt64.max]
        let encodingStrategies = EncodingStrategies.default
        
        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueUInt64(inputValue, encodingStrategies)
        
        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    // MARK: Unkeyed Value Data Tests
    
    public func test_unkeyedValue_data_base64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = [
            Data([0xDE, 0xAD, 0xBE, 0xEF]),
            Data([0xAB, 0xCD, 0xEF, 0x00]),
        ]
        let encodingStrategies = EncodingStrategies(dataStrategy: .base64)

        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueDataBase64(inputValue, encodingStrategies)

        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_unkeyedValue_data_custom() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        // We'll encode a number instead of a date
        let encode: @Sendable (Data, Encoder) throws -> Void = { data, encoder in
            var container = encoder.singleValueContainer()
            try container.encode(42)
        }
        let inputValue = [
            Data([0xDE, 0xAD, 0xBE, 0xEF]),
            Data([0xAB, 0xCD, 0xEF, 0x00]),
        ]
        let encodingStrategies = EncodingStrategies(dataStrategy: .custom(encode))

        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueDataCustom(inputValue, encodingStrategies)

        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }

    public func test_unkeyedValue_data_deferredToData() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = [
            Data([0xDE, 0xAD, 0xBE, 0xEF]),
            Data([0xAB, 0xCD, 0xEF, 0x00]),
        ]
        let encodingStrategies = EncodingStrategies(dataStrategy: .deferredToData)

        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueDataDeferredToData(inputValue, encodingStrategies)

        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    // MARK: Unkeyed Value Date Tests
    
    public func test_unkeyedValue_date_custom() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        // We'll encode a number instead of a date
        let encode: (Date, Encoder) throws -> Void = { date, encoder in
            var container = encoder.singleValueContainer()
            try container.encode(42)
        }
        let inputValue = [
            Date(timeIntervalSince1970: 1_000),
            Date(timeIntervalSince1970: 1_000_000),
        ]
        let encodingStrategies = EncodingStrategies(dateStrategy: .custom(encode))

        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueDateCustom(inputValue, encodingStrategies)

        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }

    public func test_unkeyedValue_date_deferredToDate() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = [
            Date(timeIntervalSince1970: 1_000),
            Date(timeIntervalSince1970: 1_000_000),
        ]
        let encodingStrategies = EncodingStrategies(dateStrategy: .deferredToDate)

        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueDateDeferredToDate(inputValue, encodingStrategies)

        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }

    public func test_unkeyedValue_date_formatted() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeStyle = .full
        formatter.timeZone = TimeZone(identifier: "UTC")
        
        let inputValue = [
            Date(timeIntervalSince1970: 1_000),
            Date(timeIntervalSince1970: 1_000_000),
        ]
        let encodingStrategies = EncodingStrategies(dateStrategy: .formatted(formatter))

        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueDateFormatted(inputValue, encodingStrategies)

        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }

    public func test_unkeyedValue_date_iso8601() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = [
            Date(timeIntervalSince1970: 1_000),
            Date(timeIntervalSince1970: 1_000_000),
        ]
        let encodingStrategies = EncodingStrategies(dateStrategy: .iso8601)

        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueDateISO8601(inputValue, encodingStrategies)

        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }

    public func test_unkeyedValue_date_millisecondsSince1970() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = [
            Date(timeIntervalSince1970: 1_000),
            Date(timeIntervalSince1970: 1_000_000),
        ]
        let encodingStrategies = EncodingStrategies(dateStrategy: .millisecondsSince1970)

        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueDateMillisecondsSince1970(inputValue, encodingStrategies)

        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }

    public func test_unkeyedValue_date_secondsSince1970() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = [
            Date(timeIntervalSince1970: 1_000),
            Date(timeIntervalSince1970: 1_000_000),
        ]
        let encodingStrategies = EncodingStrategies(dateStrategy: .secondsSince1970)

        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueDateSecondsSince1970(inputValue, encodingStrategies)

        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    // MARK: Unkeyed Value Double Tests
    
    public func test_unkeyedValue_double() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = [
            123.45,
            678910.11,
        ]
        let encodingStrategies = EncodingStrategies.default

        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueDouble(inputValue, encodingStrategies)

        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_unkeyedValue_double_convertToString_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = [
            Double.nan,
            678910.11,
        ]
        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )

        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueDoubleConvertToStringNaN(inputValue, encodingStrategies)

        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_unkeyedValue_double_convertToString_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = [
            Double.infinity,
            678910.11,
        ]
        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )

        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueDoubleConvertToStringPositiveInfinity(
            inputValue, encodingStrategies
        )

        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_unkeyedValue_double_convertToString_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = [
            -Double.infinity,
            678910.11,
        ]
        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )

        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueDoubleConvertToStringNegativeInfinity(
            inputValue,
            encodingStrategies
        )

        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_unkeyedValue_double_throw_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue: [Double] = [
            .nan,
            678910.11,
        ]
        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)

        XCTAssertThrowsError(try target(using: encodingStrategies).encode(inputValue))
    }
    
    public func test_unkeyedValue_double_throw_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue: [Double] = [
            -.infinity,
            678910.11,
        ]
        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)

        XCTAssertThrowsError(try target(using: encodingStrategies).encode(inputValue))
    }
    
    public func test_unkeyedValue_double_throw_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue: [Double] = [
            .infinity,
            678910.11,
        ]
        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)

        XCTAssertThrowsError(try target(using: encodingStrategies).encode(inputValue))
    }
    
    // MARK: Unkeyed Value Float Tests
    
    public func test_unkeyedValue_float() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue: [Float] = [
            123.45,
            678910.11,
        ]
        let encodingStrategies = EncodingStrategies.default

        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueFloat(inputValue, encodingStrategies)

        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_unkeyedValue_float_convertToString_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue: [Float] = [
            .nan,
            678910.11,
        ]
        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )

        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueFloatConvertToStringNaN(inputValue, encodingStrategies)

        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_unkeyedValue_float_convertToString_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue: [Float] = [
            -.infinity,
            678910.11,
        ]
        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )

        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueFloatConvertToStringNegativeInfinity(
            inputValue,
            encodingStrategies
        )

        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_unkeyedValue_float_convertToString_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue: [Float] = [
            .infinity,
            678910.11,
        ]
        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )

        let encodedValue = try target(using: encodingStrategies).encode(inputValue)
        let expectedValue = expectedValues.unkeyedValueFloatConvertToStringPositiveInfinity(
            inputValue,
            encodingStrategies
        )

        XCTAssertEqual(
            expectedValues.prepareForEqualityAssertion(encodedValue),
            expectedValues.prepareForEqualityAssertion(expectedValue)
        )
    }
    
    public func test_unkeyedValue_float_throw_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue: [Float] = [
            .nan,
            678910.11,
        ]
        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)

        XCTAssertThrowsError(try target(using: encodingStrategies).encode(inputValue))
    }
    
    public func test_unkeyedValue_float_throw_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue: [Float] = [
            -.infinity,
            678910.11,
        ]
        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)

        XCTAssertThrowsError(try target(using: encodingStrategies).encode(inputValue))
    }
    
    public func test_unkeyedValue_float_throw_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue: [Float] = [
            .infinity,
            678910.11,
        ]
        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)

        XCTAssertThrowsError(try target(using: encodingStrategies).encode(inputValue))
    }
}
