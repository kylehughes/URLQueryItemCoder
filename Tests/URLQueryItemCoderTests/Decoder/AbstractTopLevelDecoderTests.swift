//
//  AbstractTopLevelDecoderTests.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/12/23.
//

import Combine
import XCTest

@testable import URLQueryItemCoder

public class AbstractTopLevelDecoderTests<Target>: XCTestCase where Target: TopLevelDecoder, Target.Input: Equatable {
    // MARK: Public Abstract Interface
    
    public var expectedValues: CodableTestExpectation<Target.Input> {
        fatalErrorForUnimplementedAbstractInterface()
    }

    public func target(using configuration: DecodingStrategies = .default) -> Target {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    // MARK: Public Class Interface
    
    public class var isAbstractTestCase: Bool {
        self == AbstractTopLevelDecoderTests.self
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

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueBool,
            encodedWith: .default,
            decodedWith: .default,
            as: true
        )
    }
    
    public func test_singleValue_int() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueInt,
            encodedWith: .default,
            decodedWith: .default,
            as: 10
        )
    }
    
    public func test_singleValue_int8() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueInt8,
            encodedWith: .default,
            decodedWith: .default,
            as: 20
        )
    }
    
    public func test_singleValue_int16() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueInt16,
            encodedWith: .default,
            decodedWith: .default,
            as: 30
        )
    }
    
    public func test_singleValue_int32() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueInt32,
            encodedWith: .default,
            decodedWith: .default,
            as: 40
        )
    }
    
    public func test_singleValue_int64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueInt64,
            encodedWith: .default,
            decodedWith: .default,
            as: 50
        )
    }
        
    public func test_singleValue_nil() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = expectedValues.singleValueNil(nil, .default)
        let decodedValue = try target(using: .default).decode(String?.self, from: inputValue)
        
        XCTAssertEqual(decodedValue, nil as String?)
    }
    
    public func test_singleValue_string() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueString,
            encodedWith: .default,
            decodedWith: .default,
            as: "DEFAULT CONSTANT"
        )
    }
    
    public func test_singleValue_uint() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueUInt,
            encodedWith: .default,
            decodedWith: .default,
            as: 60
        )
    }
    
    public func test_singleValue_uint8() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueUInt8,
            encodedWith: .default,
            decodedWith: .default,
            as: 70
        )
    }
    
    public func test_singleValue_uint16() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueUInt16,
            encodedWith: .default,
            decodedWith: .default,
            as: 80
        )
    }
    
    public func test_singleValue_uint32() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueUInt32,
            encodedWith: .default,
            decodedWith: .default,
            as: 90
        )
    }
    
    public func test_singleValue_uint64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueUInt64,
            encodedWith: .default,
            decodedWith: .default,
            as: 100
        )
    }
    
    // MARK: Single Value Data Tests
    
    public func test_singleValue_data_base64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueDataBase64,
            encodedWith: EncodingStrategies(dataStrategy: .base64),
            decodedWith: DecodingStrategies(dataStrategy: .base64),
            as: Data([0xDE, 0xAD, 0xBE, 0xEF])
        )
    }
    
    public func test_singleValue_data_custom() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        // We'll encode a number instead of data
        let encode: @Sendable (Data, Encoder) throws -> Void = { date, encoder in
            var container = encoder.singleValueContainer()
            try container.encode(42)
        }
        let decode: @Sendable (Decoder) throws -> Data = { encoder in
            Data([0xDE, 0xAD, 0xBE, 0xEF])
        }

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueDataCustom,
            encodedWith: EncodingStrategies(dataStrategy: .custom(encode)),
            decodedWith: DecodingStrategies(dataStrategy: .custom(decode)),
            as: Data([0xDE, 0xAD, 0xBE, 0xEF])
        )
    }
    
    public func test_singleValue_data_deferredToData() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueDataDeferredToData,
            encodedWith: EncodingStrategies(dataStrategy: .deferredToData),
            decodedWith: DecodingStrategies(dataStrategy: .deferredToData),
            as: Data([0xDE, 0xAD, 0xBE, 0xEF])
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
        let decode: @Sendable (Decoder) throws -> Date = { encoder in
            Date(timeIntervalSince1970: 1_000)
        }

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueDateDeferredToDate,
            encodedWith: EncodingStrategies(dateStrategy: .custom(encode)),
            decodedWith: DecodingStrategies(dateStrategy: .custom(decode)),
            as: Date(timeIntervalSince1970: 1_000)
        )
    }

    public func test_singleValue_date_deferredToDate() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueDateDeferredToDate,
            encodedWith: EncodingStrategies(dateStrategy: .deferredToDate),
            decodedWith: DecodingStrategies(dateStrategy: .deferredToDate),
            as: Date(timeIntervalSince1970: 1_000)
        )
    }

    public func test_singleValue_date_formatted() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeStyle = .full
        formatter.timeZone = TimeZone(identifier: "UTC")

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueDateFormatted,
            encodedWith: EncodingStrategies(dateStrategy: .formatted(formatter)),
            decodedWith: DecodingStrategies(dateStrategy: .formatted(formatter)),
            as: Date(timeIntervalSince1970: 1_000)
        )
    }

    public func test_singleValue_date_iso8601() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueDateISO8601,
            encodedWith: EncodingStrategies(dateStrategy: .iso8601),
            decodedWith: DecodingStrategies(dateStrategy: .iso8601),
            as: Date(timeIntervalSince1970: 1_000)
        )
    }

    public func test_singleValue_date_millisecondsSince1970() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueDateMillisecondsSince1970,
            encodedWith: EncodingStrategies(dateStrategy: .millisecondsSince1970),
            decodedWith: DecodingStrategies(dateStrategy: .millisecondsSince1970),
            as: Date(timeIntervalSince1970: 1_000)
        )
    }

    public func test_singleValue_date_secondsSince1970() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueDateSecondsSince1970,
            encodedWith: EncodingStrategies(dateStrategy: .secondsSince1970),
            decodedWith: DecodingStrategies(dateStrategy: .secondsSince1970),
            as: Date(timeIntervalSince1970: 1_000)
        )
    }

    // MARK: Single Value Double Tests

    public func test_singleValue_double() throws {
        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueDouble,
            encodedWith: .default,
            decodedWith: .default,
            as: Double(100)
        )
    }

    public func test_singleValue_double_convertToString_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        let decodingStrategies = DecodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        
        let expectation = Double.nan
        let inputValue = expectedValues.singleValueDoubleConvertToStringNaN(expectation, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(Double.self, from: inputValue)
        
        XCTAssertEqual(decodedValue.isNaN, expectation.isNaN)
    }

    public func test_singleValue_double_convertToString_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueDoubleConvertToStringNegativeInfinity,
            encodedWith: EncodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            decodedWith: DecodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            as: -.infinity
        )
    }

    public func test_singleValue_double_convertToString_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueDoubleConvertToStringPositiveInfinity,
            encodedWith: EncodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            decodedWith: DecodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            as: .infinity
        )
    }
    
    // TODO: Make the floating point throwing code path throw the appropriate error.
    // The error that is thrown is an error about being unable to decode a number from (e.g.) "notANumber". That is
    // because… we need a way to represent the number in the format we are saying it cannot be represented in. May
    // just be unable to test the decoding side because the implication is the value couldn't be encoded. Regardless,
    // all observed behavior is correct.

    public func test_singleValue_double_throw_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = Double.nan
        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        let decodingStrategies = DecodingStrategies(nonConformingFloatStrategy: .throw)
        let target = target(using: decodingStrategies)

        XCTAssertThrowsError(
            try target.decode(
                Double.self,
                from: expectedValues.singleValueDoubleConvertToStringNaN(inputValue, encodingStrategies)
            )
        )
    }

    public func test_singleValue_double_throw_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = -Double.infinity
        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        let decodingStrategies = DecodingStrategies(nonConformingFloatStrategy: .throw)
        let target = target(using: decodingStrategies)

        XCTAssertThrowsError(
            try target.decode(
                Double.self,
                from: expectedValues.singleValueDoubleConvertToStringNegativeInfinity(inputValue, encodingStrategies)
            )
        )
    }

    public func test_singleValue_double_throw_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = Double.infinity
        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        let decodingStrategies = DecodingStrategies(nonConformingFloatStrategy: .throw)
        let target = target(using: decodingStrategies)

        XCTAssertThrowsError(
            try target.decode(
                Double.self,
                from: expectedValues.singleValueDoubleConvertToStringPositiveInfinity(inputValue, encodingStrategies)
            )
        )
    }

    // MARK: Single Value Float Tests

    public func test_singleValue_float() throws {
        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueFloat,
            encodedWith: .default,
            decodedWith: .default,
            as: Float(100)
        )
    }

    public func test_singleValue_float_convertToString_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        let decodingStrategies = DecodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        
        let expectation = Float.nan
        let inputValue = expectedValues.singleValueFloatConvertToStringNaN(expectation, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(Double.self, from: inputValue)
        
        XCTAssertEqual(decodedValue.isNaN, expectation.isNaN)
    }

    public func test_singleValue_float_convertToString_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueFloatConvertToStringNegativeInfinity,
            encodedWith: EncodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            decodedWith: DecodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            as: -.infinity
        )
    }

    public func test_singleValue_float_convertToString_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.singleValueFloatConvertToStringPositiveInfinity,
            encodedWith: EncodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            decodedWith: DecodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            as: .infinity
        )
    }

    public func test_singleValue_float_throw_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = Float.nan
        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        let decodingStrategies = DecodingStrategies(nonConformingFloatStrategy: .throw)
        let target = target(using: decodingStrategies)

        XCTAssertThrowsError(
            try target.decode(
                Double.self,
                from: expectedValues.singleValueFloatConvertToStringNaN(inputValue, encodingStrategies)
            )
        )
    }

    public func test_singleValue_float_throw_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = -Float.infinity
        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        let decodingStrategies = DecodingStrategies(nonConformingFloatStrategy: .throw)
        let target = target(using: decodingStrategies)

        XCTAssertThrowsError(
            try target.decode(
                Double.self,
                from: expectedValues.singleValueFloatConvertToStringNegativeInfinity(inputValue, encodingStrategies)
            )
        )
    }

    public func test_singleValue_float_throw_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let inputValue = Float.infinity
        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        let decodingStrategies = DecodingStrategies(nonConformingFloatStrategy: .throw)
        let target = target(using: decodingStrategies)

        XCTAssertThrowsError(
            try target.decode(
                Double.self,
                from: expectedValues.singleValueFloatConvertToStringPositiveInfinity(inputValue, encodingStrategies)
            )
        )
    }
    
    // MARK: Keyed Value Tests

    public func test_keyedValue_default() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValueDefault,
            encodedWith: EncodingStrategies(),
            decodedWith: DecodingStrategies(),
            as: CodableTestTypes.SingleValueProperties.default
        )
    }

    public func test_keyedValue_empty() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValueEmpty,
            encodedWith: EncodingStrategies(),
            decodedWith: DecodingStrategies(),
            as: CodableTestTypes.SingleValueProperties.empty
        )
    }

    public func test_keyedValue_partial() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValuePartial,
            encodedWith: EncodingStrategies(),
            decodedWith: DecodingStrategies(),
            as: CodableTestTypes.SingleValueProperties.partial
        )
    }

    // MARK: Keyed Value Inheritance Tests

    public func test_inheritance_keyedValue_default() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertDecoder(
            target,
            decodes: expectedValues.inheritanceKeyedValueDefault,
            encodedWith: EncodingStrategies(),
            decodedWith: DecodingStrategies(),
            as: .subDefault
        )
    }

    public func test_inheritance_keyedValue_empty() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertDecoder(
            target,
            decodes: expectedValues.inheritanceKeyedValueEmpty,
            encodedWith: EncodingStrategies(),
            decodedWith: DecodingStrategies(),
            as: .subEmpty
        )
    }

    public func test_inheritance_keyedValue_partial() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.inheritanceKeyedValuePartial,
            encodedWith: EncodingStrategies(),
            decodedWith: DecodingStrategies(),
            as: .subPartial
        )
    }

    // MARK: Keyed Value Data Tests

    public func test_keyedValue_data_base64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValueDataBase64,
            encodedWith: EncodingStrategies(dataStrategy: .base64),
            decodedWith: DecodingStrategies(dataStrategy: .base64),
            as: CodableTestTypes.SingleValueProperties.Abridged.default
        )
    }

    public func test_keyedValue_data_custom() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        // We'll encode a number instead of data
        let encode: @Sendable (Data, Encoder) throws -> Void = { date, encoder in
            var container = encoder.singleValueContainer()
            try container.encode(42)
        }
        let decode: @Sendable (Decoder) throws -> Data = { encoder in
            Data([0xDE, 0xAD, 0xBE, 0xEF])
        }

        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValueDataCustom,
            encodedWith: EncodingStrategies(dataStrategy: .custom(encode)),
            decodedWith: DecodingStrategies(dataStrategy: .custom(decode)),
            as: CodableTestTypes.SingleValueProperties.Abridged.default
        )
    }

    public func test_keyedValue_data_deferredToData() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValueDataDeferredToData,
            encodedWith: EncodingStrategies(dataStrategy: .deferredToData),
            decodedWith: DecodingStrategies(dataStrategy: .deferredToData),
            as: CodableTestTypes.SingleValueProperties.Abridged.default
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
        let decode: @Sendable (Decoder) throws -> Date = { encoder in
            Date(timeIntervalSince1970: 1_000)
        }

        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValueDateCustom,
            encodedWith: EncodingStrategies(dateStrategy: .custom(encode)),
            decodedWith: DecodingStrategies(dateStrategy: .custom(decode)),
            as: CodableTestTypes.SingleValueProperties.default
        )
    }

    public func test_keyedValue_date_deferredToDate() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValueDateDeferredToDate,
            encodedWith: EncodingStrategies(dateStrategy: .deferredToDate),
            decodedWith: DecodingStrategies(dateStrategy: .deferredToDate),
            as: CodableTestTypes.SingleValueProperties.default
        )
    }

    public func test_keyedValue_date_formatted() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeStyle = .full
        formatter.timeZone = TimeZone(identifier: "UTC")

        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValueDateFormatted,
            encodedWith: EncodingStrategies(dateStrategy: .formatted(formatter)),
            decodedWith: DecodingStrategies(dateStrategy: .formatted(formatter)),
            as: CodableTestTypes.SingleValueProperties.default
        )
    }

    public func test_keyedValue_date_iso8601() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValueDateISO8601,
            encodedWith: EncodingStrategies(dateStrategy: .iso8601),
            decodedWith: DecodingStrategies(dateStrategy: .iso8601),
            as: CodableTestTypes.SingleValueProperties.default
        )
    }

    public func test_keyedValue_date_millisecondsSince1970() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValueDateMillisecondsSince1970,
            encodedWith: EncodingStrategies(dateStrategy: .millisecondsSince1970),
            decodedWith: DecodingStrategies(dateStrategy: .millisecondsSince1970),
            as: CodableTestTypes.SingleValueProperties.default
        )
    }

    public func test_keyedValue_date_secondsSince1970() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValueDateSecondsSince1970,
            encodedWith: EncodingStrategies(dateStrategy: .secondsSince1970),
            decodedWith: DecodingStrategies(dateStrategy: .secondsSince1970),
            as: CodableTestTypes.SingleValueProperties.default
        )
    }

    // MARK: Keyed Value Double Tests

    public func test_keyedValue_double() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValueDouble,
            encodedWith: EncodingStrategies(nonConformingFloatStrategy: .default),
            decodedWith: DecodingStrategies(nonConformingFloatStrategy: .default),
            as: CodableTestTypes.SingleValueProperties.Abridged.default
        )
    }

    public func test_keyedValue_double_convertToString_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValueDoubleConvertToStringNegativeInfinity,
            encodedWith: EncodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            decodedWith: DecodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            as: CodableTestTypes.SingleValueProperties.Abridged.doubleNegativeInfinity
        )
    }

    public func test_keyedValue_double_convertToString_notANumber() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        let decodingStrategies = DecodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        
        let expectation = CodableTestTypes.SingleValueProperties.Abridged.doubleNotANumber
        let inputValue = expectedValues.keyedValueDoubleConvertToStringNaN(expectation, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(
            CodableTestTypes.SingleValueProperties.Abridged.self,
            from: inputValue
        )
        
        XCTAssertEqual(decodedValue.bool, expectation.bool)
        XCTAssertEqual(decodedValue.data, expectation.data)
        XCTAssertEqual(decodedValue.date, expectation.date)
        XCTAssertEqual(decodedValue.double.isNaN, expectation.double.isNaN)
        XCTAssertEqual(decodedValue.float, expectation.float)
        XCTAssertEqual(decodedValue.int, expectation.int)
        XCTAssertEqual(decodedValue.string, expectation.string)
        XCTAssertEqual(decodedValue.uint, expectation.uint)
    }

    public func test_keyedValue_double_convertToString_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValueDoubleConvertToStringPositiveInfinity,
            encodedWith: EncodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            decodedWith: DecodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            as: CodableTestTypes.SingleValueProperties.Abridged.doublePositiveInfinity
        )
    }
    
    public func test_keyedValue_double_throw_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)
        let decodingStrategies = DecodingStrategies(nonConformingFloatStrategy: .throw)
        
        let expectedValue = CodableTestTypes.SingleValueProperties.Abridged.doubleNotANumber
        let encodedValue = expectedValues.keyedValueDoubleConvertToStringNaN(
            expectedValue,
            encodingStrategies
        )
        
        XCTAssertThrowsError(
            try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)
        )
    }
    
    public func test_keyedValue_double_throw_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)
        let decodingStrategies = DecodingStrategies(nonConformingFloatStrategy: .throw)
        
        let expectedValue = CodableTestTypes.SingleValueProperties.Abridged.doubleNotANumber
        let encodedValue = expectedValues.keyedValueDoubleConvertToStringNegativeInfinity(
            expectedValue,
            encodingStrategies
        )
        
        XCTAssertThrowsError(
            try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)
        )
    }
    
    public func test_keyedValue_double_throw_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)
        let decodingStrategies = DecodingStrategies(nonConformingFloatStrategy: .throw)
        
        let expectedValue = CodableTestTypes.SingleValueProperties.Abridged.doubleNotANumber
        let encodedValue = expectedValues.keyedValueDoubleConvertToStringPositiveInfinity(
            expectedValue,
            encodingStrategies
        )
        
        XCTAssertThrowsError(
            try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)
        )
    }

    // MARK: Keyed Value Float Tests

    public func test_keyedValue_float() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValueFloat,
            encodedWith: EncodingStrategies(nonConformingFloatStrategy: .default),
            decodedWith: DecodingStrategies(nonConformingFloatStrategy: .default),
            as: CodableTestTypes.SingleValueProperties.Abridged.default
        )
    }

    public func test_keyedValue_float_convertToString_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValueFloatConvertToStringNegativeInfinity,
            encodedWith: EncodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            decodedWith: DecodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            as: CodableTestTypes.SingleValueProperties.Abridged.floatNegativeInfinity
        )
    }

    public func test_keyedValue_float_convertToString_notANumber() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        let decodingStrategies = DecodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        
        let expectation = CodableTestTypes.SingleValueProperties.Abridged.floatNotANumber
        let encodedValue = expectedValues.keyedValueFloatConvertToStringNaN(expectation, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(
            CodableTestTypes.SingleValueProperties.Abridged.self,
            from: encodedValue
        )
        
        XCTAssertEqual(decodedValue.bool, expectation.bool)
        XCTAssertEqual(decodedValue.data, expectation.data)
        XCTAssertEqual(decodedValue.date, expectation.date)
        XCTAssertEqual(decodedValue.double, expectation.double)
        XCTAssertEqual(decodedValue.float.isNaN, expectation.float.isNaN)
        XCTAssertEqual(decodedValue.int, expectation.int)
        XCTAssertEqual(decodedValue.string, expectation.string)
        XCTAssertEqual(decodedValue.uint, expectation.uint)
    }

    public func test_keyedValue_float_convertToString_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValueFloatConvertToStringPositiveInfinity,
            encodedWith: EncodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            decodedWith: DecodingStrategies(
                nonConformingFloatStrategy: .convertToString(
                    positiveInfinity: "positiveInfinity",
                    negativeInfinity: "negativeInfinity",
                    nan: "notANumber"
                )
            ),
            as: CodableTestTypes.SingleValueProperties.Abridged.floatPositiveInfinity
        )
    }
    
    public func test_keyedValue_float_throw_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)
        let decodingStrategies = DecodingStrategies(nonConformingFloatStrategy: .throw)
        
        let expectedValue = CodableTestTypes.SingleValueProperties.Abridged.floatNotANumber
        let encodedValue = expectedValues.keyedValueFloatConvertToStringNaN(
            expectedValue,
            encodingStrategies
        )
        
        XCTAssertThrowsError(
            try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)
        )
    }
    
    public func test_keyedValue_float_throw_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)
        let decodingStrategies = DecodingStrategies(nonConformingFloatStrategy: .throw)
        
        let expectedValue = CodableTestTypes.SingleValueProperties.Abridged.floatNotANumber
        let encodedValue = expectedValues.keyedValueFloatConvertToStringNegativeInfinity(
            expectedValue,
            encodingStrategies
        )
        
        XCTAssertThrowsError(
            try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)
        )
    }
    
    public func test_keyedValue_float_throw_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)
        let decodingStrategies = DecodingStrategies(nonConformingFloatStrategy: .throw)
        
        let expectedValue = CodableTestTypes.SingleValueProperties.Abridged.floatNotANumber
        let encodedValue = expectedValues.keyedValueFloatConvertToStringPositiveInfinity(
            expectedValue,
            encodingStrategies
        )
        
        XCTAssertThrowsError(
            try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)
        )
    }

    // MARK: Keyed Value Key Tests

    public func test_keyedValue_key_custom() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let keyEncoder: @Sendable ([CodingKey]) -> CodingKey = {
            guard let last = $0.last else {
                return StringCodingKey(stringValue: String())
            }

            return StringCodingKey(stringValue: last.stringValue.uppercased())
        }
        
        let encodingStrategies = EncodingStrategies(keyStrategy: .custom(keyEncoder))
        let decodingStrategies = DecodingStrategies(keyStrategy: .custom(keyEncoder))
        
        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValueKeyCustom,
            encodedWith: encodingStrategies,
            decodedWith: decodingStrategies,
            as: .default
        )
    }

    public func test_keyedValue_key_convertToSnakeCase() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValueKeySnakeCase,
            encodedWith: EncodingStrategies(keyStrategy: .convertToSnakeCase),
            decodedWith: DecodingStrategies(keyStrategy: .convertFromSnakeCase),
            as: .default
        )
    }

    public func test_keyedValue_key_useDefaultKeys() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedValueDefault,
            encodedWith: EncodingStrategies(keyStrategy: .useDefaultKeys),
            decodedWith: DecodingStrategies(keyStrategy: .useDefaultKeys),
            as: .default
        )
    }

    // MARK: Unkeyed Value Primitive Tests

    public func test_unkeyedValue_bool() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let encodingStrategies = EncodingStrategies.default
        let decodingStrategies = DecodingStrategies.default
        
        let expectedValue = [true, false]
        let encodedValue = expectedValues.unkeyedValueBool(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_int() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let encodingStrategies = EncodingStrategies.default
        let decodingStrategies = DecodingStrategies.default
        
        let expectedValue = [Int(Int32.min), Int(Int32.max)]
        let encodedValue = expectedValues.unkeyedValueInt(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_int8() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let encodingStrategies = EncodingStrategies.default
        let decodingStrategies = DecodingStrategies.default
        
        let expectedValue = [Int8.min, Int8.max]
        let encodedValue = expectedValues.unkeyedValueInt8(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_int16() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies.default
        let decodingStrategies = DecodingStrategies.default
        
        let expectedValue = [Int16.min, Int16.max]
        let encodedValue = expectedValues.unkeyedValueInt16(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_int32() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies.default
        let decodingStrategies = DecodingStrategies.default
        
        let expectedValue = [Int32.min, Int32.max]
        let encodedValue = expectedValues.unkeyedValueInt32(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_int64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies.default
        let decodingStrategies = DecodingStrategies.default
        
        let expectedValue = [Int64.min, Int64.max]
        let encodedValue = expectedValues.unkeyedValueInt64(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_nil() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies.default
        let decodingStrategies = DecodingStrategies.default
        
        let expectedValue = [String?.none, String?.none]
        let encodedValue = expectedValues.unkeyedValueNil(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_string() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies.default
        let decodingStrategies = DecodingStrategies.default
        
        let expectedValue = Array(repeating: "DEFAULT CONSTANT", count: 2)
        let encodedValue = expectedValues.unkeyedValueString(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_uint() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let encodingStrategies = EncodingStrategies.default
        let decodingStrategies = DecodingStrategies.default
        
        let expectedValue = [UInt(UInt32.min), UInt(UInt32.max)]
        let encodedValue = expectedValues.unkeyedValueUInt(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_uint8() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let encodingStrategies = EncodingStrategies.default
        let decodingStrategies = DecodingStrategies.default
        
        let expectedValue = [UInt8.min, UInt8.max]
        let encodedValue = expectedValues.unkeyedValueUInt8(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_uint16() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies.default
        let decodingStrategies = DecodingStrategies.default
        
        let expectedValue = [UInt16.min, UInt16.max]
        let encodedValue = expectedValues.unkeyedValueUInt16(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_uint32() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies.default
        let decodingStrategies = DecodingStrategies.default
        
        let expectedValue = [UInt32.min, UInt32.max]
        let encodedValue = expectedValues.unkeyedValueUInt32(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_uint64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies.default
        let decodingStrategies = DecodingStrategies.default
        
        let expectedValue = [UInt64.min, UInt64.max]
        let encodedValue = expectedValues.unkeyedValueUInt64(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    // MARK: Unkeyed Value Data Tests

    public func test_unkeyedValue_data_base64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let encodingStrategies = EncodingStrategies(dataStrategy: .base64)
        let decodingStrategies = DecodingStrategies(dataStrategy: .base64)
        
        let expectedValue = [
            Data([0xDE, 0xAD, 0xBE, 0xEF]),
            Data([0xAB, 0xCD, 0xEF, 0x00]),
        ]
        let encodedValue = expectedValues.unkeyedValueDataBase64(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_data_custom() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        // We'll encode a number instead of a date
        let encode: @Sendable (Data, Encoder) throws -> Void = { data, encoder in
            var container = encoder.singleValueContainer()
            try container.encode(42)
        }
        let decode: @Sendable (Decoder) throws -> Data = { _ in
            Data([0xDE, 0xAD, 0xBE, 0xEF])
        }
        let encodingStrategies = EncodingStrategies(dataStrategy: .custom(encode))
        let decodingStrategies = DecodingStrategies(dataStrategy: .custom(decode))
        
        let expectedValue = [
            Data([0xDE, 0xAD, 0xBE, 0xEF]),
            Data([0xDE, 0xAD, 0xBE, 0xEF]),
        ]
        let encodedValue = expectedValues.unkeyedValueDataCustom(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_data_deferredToData() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies(dataStrategy: .deferredToData)
        let decodingStrategies = DecodingStrategies(dataStrategy: .deferredToData)
        
        let expectedValue = [
            Data([0xDE, 0xAD, 0xBE, 0xEF]),
            Data([0xAB, 0xCD, 0xEF, 0x00]),
        ]
        let encodedValue = expectedValues.unkeyedValueDataDeferredToData(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    // MARK: Unkeyed Value Date Tests

    public func test_unkeyedValue_date_custom() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        // We'll encode a number instead of a date
        let encode: @Sendable (Date, Encoder) throws -> Void = { data, encoder in
            var container = encoder.singleValueContainer()
            try container.encode(42)
        }
        let decode: @Sendable (Decoder) throws -> Date = { _ in
            Date(timeIntervalSince1970: 1_000)
        }
        let encodingStrategies = EncodingStrategies(dateStrategy: .custom(encode))
        let decodingStrategies = DecodingStrategies(dateStrategy: .custom(decode))
        
        let expectedValue = [
            Date(timeIntervalSince1970: 1_000),
            Date(timeIntervalSince1970: 1_000),
        ]
        let encodedValue = expectedValues.unkeyedValueDateCustom(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_date_deferredToDate() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let encodingStrategies = EncodingStrategies(dateStrategy: .deferredToDate)
        let decodingStrategies = DecodingStrategies(dateStrategy: .deferredToDate)
        
        let expectedValue = [
            Date(timeIntervalSince1970: 1_000),
            Date(timeIntervalSince1970: 1_000_000),
        ]
        let encodedValue = expectedValues.unkeyedValueDateDeferredToDate(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_date_formatted() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeStyle = .full
        formatter.timeZone = TimeZone(identifier: "UTC")

        let encodingStrategies = EncodingStrategies(dateStrategy: .formatted(formatter))
        let decodingStrategies = DecodingStrategies(dateStrategy: .formatted(formatter))
        
        let expectedValue = [
            Date(timeIntervalSince1970: 1_000),
            Date(timeIntervalSince1970: 1_000_000),
        ]
        let encodedValue = expectedValues.unkeyedValueDateFormatted(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_date_iso8601() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies(dateStrategy: .iso8601)
        let decodingStrategies = DecodingStrategies(dateStrategy: .iso8601)
        
        let expectedValue = [
            Date(timeIntervalSince1970: 1_000),
            Date(timeIntervalSince1970: 1_000_000),
        ]
        let encodedValue = expectedValues.unkeyedValueDateISO8601(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_date_millisecondsSince1970() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies(dateStrategy: .millisecondsSince1970)
        let decodingStrategies = DecodingStrategies(dateStrategy: .millisecondsSince1970)
        
        let expectedValue = [
            Date(timeIntervalSince1970: 1_000),
            Date(timeIntervalSince1970: 1_000_000),
        ]
        let encodedValue = expectedValues.unkeyedValueDateMillisecondsSince1970(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_date_secondsSince1970() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies(dateStrategy: .secondsSince1970)
        let decodingStrategies = DecodingStrategies(dateStrategy: .secondsSince1970)
        
        let expectedValue = [
            Date(timeIntervalSince1970: 1_000),
            Date(timeIntervalSince1970: 1_000_000),
        ]
        let encodedValue = expectedValues.unkeyedValueDateSecondsSince1970(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    // MARK: Unkeyed Value Double Tests

    public func test_unkeyedValue_double() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .default)
        let decodingStrategies = DecodingStrategies(nonConformingFloatStrategy: .default)
        
        let expectedValue = [
            123.45,
            678910.11,
        ]
        let encodedValue = expectedValues.unkeyedValueDouble(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_double_convertToString_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        let decodingStrategies = DecodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        
        let expectedValue = [
            Double.nan,
            678910.11,
        ]
        let encodedValue = expectedValues.unkeyedValueDoubleConvertToStringNaN(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        for (lhs, rhs) in zip(decodedValue, expectedValue) {
            XCTAssert(lhs.isNaN && rhs.isNaN || lhs == rhs)
        }
    }

    public func test_unkeyedValue_double_convertToString_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        let decodingStrategies = DecodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        
        let expectedValue = [
            Double.infinity,
            678910.11,
        ]
        let encodedValue = expectedValues.unkeyedValueDoubleConvertToStringPositiveInfinity(
            expectedValue,
            encodingStrategies
        )
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_double_convertToString_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        let decodingStrategies = DecodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        
        let expectedValue = [
            -Double.infinity,
            678910.11,
        ]
        let encodedValue = expectedValues.unkeyedValueDoubleConvertToStringNegativeInfinity(
            expectedValue,
            encodingStrategies
        )
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }
    
    public func test_unkeyedValue_double_throw_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)
        let decodingStrategies = DecodingStrategies(nonConformingFloatStrategy: .throw)
        
        let expectedValue: [Double] = [
            .nan,
            678910.11,
        ]
        let encodedValue = expectedValues.unkeyedValueDoubleConvertToStringNaN(
            expectedValue,
            encodingStrategies
        )
        
        XCTAssertThrowsError(
            try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)
        )
    }
    
    public func test_unkeyedValue_double_throw_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)
        let decodingStrategies = DecodingStrategies(nonConformingFloatStrategy: .throw)
        
        let expectedValue: [Double] = [
            -.infinity,
            678910.11,
        ]
        let encodedValue = expectedValues.unkeyedValueDoubleConvertToStringNegativeInfinity(
            expectedValue,
            encodingStrategies
        )
        
        XCTAssertThrowsError(
            try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)
        )
    }
    
    public func test_unkeyedValue_double_throw_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)
        let decodingStrategies = DecodingStrategies(nonConformingFloatStrategy: .throw)
        
        let expectedValue: [Double] = [
            .infinity,
            678910.11,
        ]
        let encodedValue = expectedValues.unkeyedValueDoubleConvertToStringPositiveInfinity(
            expectedValue,
            encodingStrategies
        )
        
        XCTAssertThrowsError(
            try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)
        )
    }

    // MARK: Unkeyed Value Float Tests

    public func test_unkeyedValue_float() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .default)
        let decodingStrategies = DecodingStrategies(nonConformingFloatStrategy: .default)
        
        let expectedValue: [Float] = [
            123.45,
            678910.11,
        ]
        let encodedValue = expectedValues.unkeyedValueFloat(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_float_convertToString_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        let decodingStrategies = DecodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        
        let expectedValue: [Float] = [
            .nan,
            678910.11,
        ]
        let encodedValue = expectedValues.unkeyedValueFloatConvertToStringNaN(expectedValue, encodingStrategies)
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        for (lhs, rhs) in zip(decodedValue, expectedValue) {
            XCTAssert(lhs.isNaN && rhs.isNaN || lhs == rhs)
        }
    }

    public func test_unkeyedValue_float_convertToString_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        let decodingStrategies = DecodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        
        let expectedValue: [Float] = [
            .infinity,
            678910.11,
        ]
        let encodedValue = expectedValues.unkeyedValueFloatConvertToStringPositiveInfinity(
            expectedValue,
            encodingStrategies
        )
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }

    public func test_unkeyedValue_float_convertToString_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        let decodingStrategies = DecodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        
        let expectedValue: [Float] = [
            -.infinity,
            678910.11,
        ]
        let encodedValue = expectedValues.unkeyedValueFloatConvertToStringNegativeInfinity(
            expectedValue,
            encodingStrategies
        )
        let decodedValue = try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)

        XCTAssertEqual(
            expectedValue,
            decodedValue
        )
    }
    
    public func test_unkeyedValue_float_throw_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)
        let decodingStrategies = DecodingStrategies(nonConformingFloatStrategy: .throw)
        
        let expectedValue: [Float] = [
            .nan,
            678910.11,
        ]
        let encodedValue = expectedValues.unkeyedValueFloatConvertToStringNaN(
            expectedValue,
            encodingStrategies
        )
        
        XCTAssertThrowsError(
            try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)
        )
    }
    
    public func test_unkeyedValue_float_throw_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)
        let decodingStrategies = DecodingStrategies(nonConformingFloatStrategy: .throw)
        
        let expectedValue: [Float] = [
            -.infinity,
            678910.11,
        ]
        let encodedValue = expectedValues.unkeyedValueFloatConvertToStringNegativeInfinity(
            expectedValue,
            encodingStrategies
        )
        
        XCTAssertThrowsError(
            try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)
        )
    }
    
    public func test_unkeyedValue_float_throw_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let encodingStrategies = EncodingStrategies(nonConformingFloatStrategy: .throw)
        let decodingStrategies = DecodingStrategies(nonConformingFloatStrategy: .throw)
        
        let expectedValue: [Float] = [
            .infinity,
            678910.11,
        ]
        let encodedValue = expectedValues.unkeyedValueFloatConvertToStringPositiveInfinity(
            expectedValue,
            encodingStrategies
        )
        
        XCTAssertThrowsError(
            try target(using: decodingStrategies).decode(type(of: expectedValue), from: encodedValue)
        )
    }
}
