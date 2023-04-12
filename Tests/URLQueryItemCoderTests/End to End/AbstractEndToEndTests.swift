//
//  AbstractEndToEndTests.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 2/23/23.
//

import Combine
import XCTest

@testable import URLQueryItemCoder

public class AbstractEndToEndTests<Encoder, Decoder>: XCTestCase where
    Encoder: TopLevelEncoder,
    Encoder.Output: Equatable,
    Decoder: TopLevelDecoder,
    Decoder.Input == Encoder.Output
{
    // MARK: Public Abstract Interface
    
    public func decoder(using configuration: DecodingStrategies = .default) -> Decoder {
        fatalErrorForUnimplementedAbstractInterface()
    }

    public func encoder(using configuration: EncodingStrategies = .default) -> Encoder {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    // MARK: Public Class Interface
    
    public class var isAbstractTestCase: Bool {
        self == AbstractEndToEndTests.self
    }
    
    // MARK: XCTestCase Implementation
    
    override class public var defaultTestSuite: XCTestSuite {
        guard isAbstractTestCase else {
            return super.defaultTestSuite
        }

        return XCTestSuite(name: "Empty Suite for \(Self.self)")
    }
    
    // MARK: Single Value Tests
    
    public func test_singleValue_bool() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: true
        )
    }
    
    public func test_singleValue_int() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: Int.max
        )
    }
    
    public func test_singleValue_int8() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: Int8.max
        )
    }
    
    public func test_singleValue_int16() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: Int16.max
        )
    }
    
    public func test_singleValue_int32() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: Int32.max
        )
    }
    
    public func test_singleValue_int64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: Int64.max
        )
    }
        
    public func test_singleValue_nil() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: nil as String?
        )
    }
    
    public func test_singleValue_string() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: "DEFAULT CONSTANT"
        )
    }
    
    public func test_singleValue_uint() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: UInt.max
        )
    }
    
    public func test_singleValue_uint8() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: UInt8.max
        )
    }
    
    public func test_singleValue_uint16() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: UInt16.max
        )
    }
    
    public func test_singleValue_uint32() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: UInt32.max
        )
    }
    
    public func test_singleValue_uint64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: UInt64.max
        )
    }
    
    // MARK: Single Value Data Tests
    
    public func test_singleValue_data_base64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dataStrategy: .base64),
            decodedWith: DecodingStrategies(dataStrategy: .base64),
            value: Data([0xDE, 0xAD, 0xBE, 0xEF])
        )
    }
    
    public func test_singleValue_data_custom() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        // We'll encode a number instead of data
        let encode: @Sendable (Data, Swift.Encoder) throws -> Void = { date, encoder in
            var container = encoder.singleValueContainer()
            try container.encode(42)
        }
        let decode: @Sendable (Swift.Decoder) throws -> Data = { encoder in
            Data([0xDE, 0xAD, 0xBE, 0xEF])
        }

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dataStrategy: .custom(encode)),
            decodedWith: DecodingStrategies(dataStrategy: .custom(decode)),
            value: Data([0xDE, 0xAD, 0xBE, 0xEF])
        )
    }
    
    public func test_singleValue_data_deferredToData() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dataStrategy: .deferredToData),
            decodedWith: DecodingStrategies(dataStrategy: .deferredToData),
            value: Data([0xDE, 0xAD, 0xBE, 0xEF])
        )
    }
    
    // MARK: Single Value Date Tests
    
    public func test_singleValue_date_custom() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        // We'll encode a number instead of a date
        let encode: (Date, Swift.Encoder) throws -> Void = { date, encoder in
            var container = encoder.singleValueContainer()
            try container.encode(42)
        }
        let decode: @Sendable (Swift.Decoder) throws -> Date = { encoder in
            Date(timeIntervalSince1970: 1_000)
        }
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dateStrategy: .custom(encode)),
            decodedWith: DecodingStrategies(dateStrategy: .custom(decode)),
            value: Date(timeIntervalSince1970: 1_000)
        )
    }
    
    public func test_singleValue_date_deferredToDate() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dateStrategy: .deferredToDate),
            decodedWith: DecodingStrategies(dateStrategy: .deferredToDate),
            value: Date(timeIntervalSince1970: 1_000)
        )
    }
    
    public func test_singleValue_date_formatted() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeStyle = .full
        formatter.timeZone = TimeZone(identifier: "UTC")

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dateStrategy: .formatted(formatter)),
            decodedWith: DecodingStrategies(dateStrategy: .formatted(formatter)),
            value: Date(timeIntervalSince1970: 1_000)
        )
    }
    
    public func test_singleValue_date_iso8601() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dateStrategy: .iso8601),
            decodedWith: DecodingStrategies(dateStrategy: .iso8601),
            value: Date(timeIntervalSince1970: 1_000)
        )
    }
    
    public func test_singleValue_date_millisecondsSince1970() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dateStrategy: .millisecondsSince1970),
            decodedWith: DecodingStrategies(dateStrategy: .millisecondsSince1970),
            value: Date(timeIntervalSince1970: 1_000)
        )
    }
    
    public func test_singleValue_date_secondsSince1970() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dateStrategy: .secondsSince1970),
            decodedWith: DecodingStrategies(dateStrategy: .secondsSince1970),
            value: Date(timeIntervalSince1970: 1_000)
        )
    }
    
    // MARK: Single Value Double Tests
    
    public func test_singleValue_double() throws {
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(),
            decodedWith: DecodingStrategies(),
            value: Double.greatestFiniteMagnitude
        )
    }
    
    public func test_singleValue_double_convertToString_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
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
            value: Double.nan
        )
    }
    
    public func test_singleValue_double_convertToString_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
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
            value: -Double.infinity
        )
    }
    
    public func test_singleValue_double_convertToString_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
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
            value: Double.infinity
        )
    }
    
    // MARK: Single Value Float Tests
    
    public func test_singleValue_float() throws {
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(),
            decodedWith: DecodingStrategies(),
            value: Float.greatestFiniteMagnitude
        )
    }
    
    public func test_singleValue_float_convertToString_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
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
            value: Float.nan
        )
    }
    
    public func test_singleValue_float_convertToString_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
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
            value: -Float.infinity
        )
    }
    
    public func test_singleValue_float_convertToString_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
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
            value: Float.infinity
        )
    }

    // MARK: Keyed Value Tests
    
    public func test_keyedValue_default() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: CodableTestTypes.SingleValueProperties.default
        )
    }
    
    public func test_keyedValue_empty() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: CodableTestTypes.SingleValueProperties.empty
        )
    }
    
    public func test_keyedValue_partial() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: CodableTestTypes.SingleValueProperties.partial
        )
    }
    
    // MARK: Keyed Value Inheritance Tests
    
    public func test_inheritance_keyedValue_default() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: CodableTestTypes.SingleValueProperties.Subclass.subDefault
        )
    }
    
    public func test_inheritance_keyedValue_empty() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: CodableTestTypes.SingleValueProperties.Subclass.subEmpty
        )
    }
    
    public func test_inheritance_keyedValue_partial() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: CodableTestTypes.SingleValueProperties.Subclass.subPartial
        )
    }
    
    // MARK: Keyed Value Data Tests
    
    public func test_keyedValue_data_base64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dataStrategy: .base64),
            decodedWith: DecodingStrategies(dataStrategy: .base64),
            value: CodableTestTypes.SingleValueProperties.Abridged.default
        )
    }
    
    public func test_keyedValue_data_custom() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        // We'll encode a number instead of data
        let encode: @Sendable (Data, Swift.Encoder) throws -> Void = { date, encoder in
            var container = encoder.singleValueContainer()
            try container.encode(42)
        }
        let decode: @Sendable (Swift.Decoder) throws -> Data = { encoder in
            Data([0xDE, 0xAD, 0xBE, 0xEF])
        }

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dataStrategy: .custom(encode)),
            decodedWith: DecodingStrategies(dataStrategy: .custom(decode)),
            value: CodableTestTypes.SingleValueProperties.Abridged.default
        )
    }
    
    public func test_keyedValue_data_deferredToData() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dataStrategy: .deferredToData),
            decodedWith: DecodingStrategies(dataStrategy: .deferredToData),
            value: CodableTestTypes.SingleValueProperties.Abridged.default
        )
    }
    
    // MARK: Keyed Value Date Tests
    
    public func test_keyedValue_date_custom() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        // We'll encode a number instead of a date
        let encode: @Sendable (Date, Swift.Encoder) throws -> Void = { date, encoder in
            var container = encoder.singleValueContainer()
            try container.encode(42)
        }
        let decode: @Sendable (Swift.Decoder) throws -> Date = { encoder in
            Date(timeIntervalSince1970: 1_000)
        }
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dateStrategy: .custom(encode)),
            decodedWith: DecodingStrategies(dateStrategy: .custom(decode)),
            value: CodableTestTypes.SingleValueProperties.Abridged.default
        )
    }
    
    public func test_keyedValue_date_deferredToDate() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dateStrategy: .deferredToDate),
            decodedWith: DecodingStrategies(dateStrategy: .deferredToDate),
            value: CodableTestTypes.SingleValueProperties.Abridged.default
        )
    }
    
    public func test_keyedValue_date_formatted() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeStyle = .full
        formatter.timeZone = TimeZone(identifier: "UTC")
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dateStrategy: .formatted(formatter)),
            decodedWith: DecodingStrategies(dateStrategy: .formatted(formatter)),
            value: CodableTestTypes.SingleValueProperties.Abridged.default
        )
    }
    
    public func test_keyedValue_date_iso8601() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dateStrategy: .iso8601),
            decodedWith: DecodingStrategies(dateStrategy: .iso8601),
            value: CodableTestTypes.SingleValueProperties.Abridged.default
        )
    }
    
    public func test_keyedValue_date_millisecondsSince1970() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dateStrategy: .millisecondsSince1970),
            decodedWith: DecodingStrategies(dateStrategy: .millisecondsSince1970),
            value: CodableTestTypes.SingleValueProperties.Abridged.default
        )
    }
    
    public func test_keyedValue_date_secondsSince1970() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dateStrategy: .secondsSince1970),
            decodedWith: DecodingStrategies(dateStrategy: .secondsSince1970),
            value: CodableTestTypes.SingleValueProperties.Abridged.default
        )
    }
    
    // MARK: Keyed Value Double Tests
    
    public func test_keyedValue_double() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: .default,
            decodedWith: .default,
            value: CodableTestTypes.SingleValueProperties.Abridged.default
        )
    }
    
    public func test_keyedValue_double_convertToString_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
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
            value: -Double.infinity
        )
    }
    
    public func test_keyedValue_double_convertToString_notANumber() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
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
            value: Double.nan
        )
    }
    
    public func test_keyedValue_double_convertToString_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
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
            value: Double.infinity
        )
    }
    
    // MARK: Keyed Value Float Tests
    
    public func test_keyedValue_float() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: .default,
            decodedWith: .default,
            value: CodableTestTypes.SingleValueProperties.Abridged.default
        )
    }
    
    public func test_keyedValue_float_convertToString_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
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
            value: -Float.infinity
        )
    }
    
    public func test_keyedValue_float_convertToString_notANumber() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
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
            value: Float.nan
        )
    }
    
    public func test_keyedValue_float_convertToString_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
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
            value: Float.infinity
        )
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
        let decodingStrategies = DecodingStrategies(
            keyStrategy: .custom(
                {
                    guard let last = $0.last else {
                        return StringCodingKey(stringValue: String())
                    }
                    
                    return StringCodingKey(stringValue: last.stringValue.uppercased())
                }
            )
        )
        
        let encodedValue = try encoder(using: encodingStrategies).encode(inputValue)
        let decodedValue = try decoder(using: decodingStrategies).decode(type(of: inputValue), from: encodedValue)
        
        XCTAssertEqual(decodedValue, inputValue)
    }
    
    public func test_keyedValue_key_convertToSnakeCase() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = CodableTestTypes.KeyEncodingStrategy.default
        let encodingStrategies = EncodingStrategies(keyStrategy: .convertToSnakeCase)
        let decodingStrategies = DecodingStrategies(keyStrategy: .convertFromSnakeCase)
        
        let encodedValue = try encoder(using: encodingStrategies).encode(inputValue)
        let decodedValue = try decoder(using: decodingStrategies).decode(type(of: inputValue), from: encodedValue)
        
        XCTAssertEqual(decodedValue, inputValue)
    }
    
    public func test_keyedValue_key_useDefaultKeys() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = CodableTestTypes.KeyEncodingStrategy.default
        let encodingStrategies = EncodingStrategies(keyStrategy: .useDefaultKeys)
        let decodingStrategies = DecodingStrategies(keyStrategy: .useDefaultKeys)
        
        let encodedValue = try encoder(using: encodingStrategies).encode(inputValue)
        let decodedValue = try decoder(using: decodingStrategies).decode(type(of: inputValue), from: encodedValue)
        
        XCTAssertEqual(decodedValue, inputValue)
    }
    
    // MARK: Unkeyed Value Primitive Tests

    public func test_unkeyedValue_bool() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: .default,
            decodedWith: .default,
            value: [true, false]
        )
    }

    public func test_unkeyedValue_int() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: .default,
            decodedWith: .default,
            value: [Int(Int32.min), Int(Int32.max)]
        )
    }
    
    public func test_unkeyedValue_int8() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: .default,
            decodedWith: .default,
            value: [Int8.min, Int8.max]
        )
    }
    
    public func test_unkeyedValue_int16() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: .default,
            decodedWith: .default,
            value: [Int16.min, Int16.max]
        )
    }
    
    public func test_unkeyedValue_int32() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: .default,
            decodedWith: .default,
            value: [Int32.min, Int32.max]
        )
    }
    
    public func test_unkeyedValue_int64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: .default,
            decodedWith: .default,
            value: [Int64.min, Int64.max]
        )
    }
    
    public func test_unkeyedValue_nil() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: .default,
            decodedWith: .default,
            value: Array(repeating: nil as String?, count: 2)
        )
    }
    
    public func test_unkeyedValue_string() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: .default,
            decodedWith: .default,
            value: Array(repeating: "DEFAULT CONSTANT", count: 2)
        )
    }
    
    public func test_unkeyedValue_uint() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: .default,
            decodedWith: .default,
            value: [UInt(UInt32.min), UInt(UInt32.max)]
        )
    }
    
    public func test_unkeyedValue_uint8() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: .default,
            decodedWith: .default,
            value: [UInt8.min, UInt8.max]
        )
    }
    
    public func test_unkeyedValue_uint16() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: .default,
            decodedWith: .default,
            value: [UInt16.min, UInt16.max]
        )
    }
    
    public func test_unkeyedValue_uint32() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: .default,
            decodedWith: .default,
            value: [UInt32.min, UInt32.max]
        )
    }
    
    public func test_unkeyedValue_uint64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: .default,
            decodedWith: .default,
            value: [UInt64.min, UInt64.max]
        )
    }
    
    // MARK: Unkeyed Value Data Tests
    
    public func test_unkeyedValue_data_base64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dataStrategy: .base64),
            decodedWith: DecodingStrategies(dataStrategy: .base64),
            value: [
                Data([0xDE, 0xAD, 0xBE, 0xEF]),
                Data([0xAB, 0xCD, 0xEF, 0x00]),
            ]
        )
    }
    
    public func test_unkeyedValue_data_custom() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        // We'll encode a number instead of a date
        let encode: @Sendable (Data, Swift.Encoder) throws -> Void = { date, encoder in
            var container = encoder.singleValueContainer()
            try container.encode(42)
        }
        let decode: @Sendable (Swift.Decoder) throws -> Data = { encoder in
            Data([0xDE, 0xAD, 0xBE, 0xEF])
        }
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dataStrategy: .custom(encode)),
            decodedWith: DecodingStrategies(dataStrategy: .custom(decode)),
            value: [
                Data([0xDE, 0xAD, 0xBE, 0xEF]),
                Data([0xDE, 0xAD, 0xBE, 0xEF]),
            ]
        )
    }

    public func test_unkeyedValue_data_deferredToData() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dataStrategy: .deferredToData),
            decodedWith: DecodingStrategies(dataStrategy: .deferredToData),
            value: [
                Data([0xDE, 0xAD, 0xBE, 0xEF]),
                Data([0xAB, 0xCD, 0xEF, 0x00]),
            ]
        )
    }
    
    // MARK: Unkeyed Value Date Tests
    
    public func test_unkeyedValue_date_custom() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        // We'll encode a number instead of a date
        let encode: @Sendable (Date, Swift.Encoder) throws -> Void = { date, encoder in
            var container = encoder.singleValueContainer()
            try container.encode(42)
        }
        let decode: @Sendable (Swift.Decoder) throws -> Date = { encoder in
            Date(timeIntervalSince1970: 1_000)
        }
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dateStrategy: .custom(encode)),
            decodedWith: DecodingStrategies(dateStrategy: .custom(decode)),
            value: [
                Date(timeIntervalSince1970: 1_000),
                Date(timeIntervalSince1970: 1_000),
            ]
        )
    }

    public func test_unkeyedValue_date_deferredToDate() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dateStrategy: .deferredToDate),
            decodedWith: DecodingStrategies(dateStrategy: .deferredToDate),
            value: [
                Date(timeIntervalSince1970: 1_000),
                Date(timeIntervalSince1970: 1_000_000),
            ]
        )
    }

    public func test_unkeyedValue_date_formatted() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeStyle = .full
        formatter.timeZone = TimeZone(identifier: "UTC")
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dateStrategy: .formatted(formatter)),
            decodedWith: DecodingStrategies(dateStrategy: .formatted(formatter)),
            value: [
                Date(timeIntervalSince1970: 1_000),
                Date(timeIntervalSince1970: 1_000_000),
            ]
        )
    }

    public func test_unkeyedValue_date_iso8601() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dateStrategy: .iso8601),
            decodedWith: DecodingStrategies(dateStrategy: .iso8601),
            value: [
                Date(timeIntervalSince1970: 1_000),
                Date(timeIntervalSince1970: 1_000_000),
            ]
        )
    }

    public func test_unkeyedValue_date_millisecondsSince1970() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dateStrategy: .millisecondsSince1970),
            decodedWith: DecodingStrategies(dateStrategy: .millisecondsSince1970),
            value: [
                Date(timeIntervalSince1970: 1_000),
                Date(timeIntervalSince1970: 1_000_000),
            ]
        )
    }

    public func test_unkeyedValue_date_secondsSince1970() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(dateStrategy: .secondsSince1970),
            decodedWith: DecodingStrategies(dateStrategy: .secondsSince1970),
            value: [
                Date(timeIntervalSince1970: 1_000),
                Date(timeIntervalSince1970: 1_000_000),
            ]
        )
    }
    
    // MARK: Unkeyed Value Double Tests
    
    public func test_unkeyedValue_double() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(),
            decodedWith: DecodingStrategies(),
            value: [
                Double.leastNonzeroMagnitude,
                Double.greatestFiniteMagnitude,
            ]
        )
    }
    
    public func test_unkeyedValue_double_convertToString_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue: [Double] = [
            .nan,
            .greatestFiniteMagnitude,
        ]
        
        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        let encoder = encoder(using: encodingStrategies)
        let encodedRepresentation = try encoder.encode(inputValue)
        
        let decodingStrategies = DecodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        let decoder = decoder(using: decodingStrategies)
        let decodedRepresentation = try decoder.decode(type(of: inputValue), from: encodedRepresentation)
        
        for (lhs, rhs) in zip(decodedRepresentation, inputValue) {
            if lhs.isNaN {
                XCTAssertEqual(lhs.isNaN, rhs.isNaN)
            } else {
                XCTAssertEqual(lhs, rhs)
            }
        }
    }
    
    public func test_unkeyedValue_double_convertToString_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
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
            value: [
                -Double.infinity,
                Double.greatestFiniteMagnitude,
            ]
        )
    }
    
    public func test_unkeyedValue_double_convertToString_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
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
            value: [
                Double.infinity,
                Double.greatestFiniteMagnitude,
            ]
        )
    }
    
    // MARK: Unkeyed Value Float Tests
    
    public func test_unkeyedValue_float() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            encodedWith: EncodingStrategies(),
            decodedWith: DecodingStrategies(),
            value: [
                Float.leastNonzeroMagnitude,
                Float.greatestFiniteMagnitude,
            ]
        )
    }
    
    public func test_unkeyedValue_float_convertToString_nan() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue: [Float] = [
            .nan,
            .greatestFiniteMagnitude,
        ]
        
        let encodingStrategies = EncodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        let encoder = encoder(using: encodingStrategies)
        let encodedRepresentation = try encoder.encode(inputValue)
        
        let decodingStrategies = DecodingStrategies(
            nonConformingFloatStrategy: .convertToString(
                positiveInfinity: "positiveInfinity",
                negativeInfinity: "negativeInfinity",
                nan: "notANumber"
            )
        )
        let decoder = decoder(using: decodingStrategies)
        let decodedRepresentation = try decoder.decode(type(of: inputValue), from: encodedRepresentation)
        
        for (lhs, rhs) in zip(decodedRepresentation, inputValue) {
            if lhs.isNaN {
                XCTAssertEqual(lhs.isNaN, rhs.isNaN)
            } else {
                XCTAssertEqual(lhs, rhs)
            }
        }
    }
    
    public func test_unkeyedValue_float_convertToString_negativeInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
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
            value: [
                -Float.infinity,
                Float.greatestFiniteMagnitude,
            ]
        )
    }
    
    public func test_unkeyedValue_float_convertToString_positiveInfinity() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
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
            value: [
                Float.infinity,
                Float.greatestFiniteMagnitude,
            ]
        )
    }
}
