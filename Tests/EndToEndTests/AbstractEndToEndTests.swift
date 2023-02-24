//
//  AbstractEndToEndTests.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 2/23/23.
//

import Combine
import XCTest

@testable import TestSupport
@testable import URLQueryItemDecoder
@testable import URLQueryItemEncoder

public class AbstractEndToEndTests<Encoder, Decoder>: XCTestCase where
    Encoder: TopLevelEncoder,
    Encoder.Output: Equatable,
    Decoder: TopLevelDecoder,
    Decoder.Input == Encoder.Output
{
    // MARK: Public Abstract Interface
    
    public var decoder: Decoder {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    public var encoder: Encoder {
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
            value: Bool.random()
        )
    }
    
    public func test_singleValue_double() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: Double.random(in: 0 ... .greatestFiniteMagnitude)
        )
    }
    
    public func test_singleValue_float() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: Float.random(in: 0 ... .greatestFiniteMagnitude)
        )
    }
    
    public func test_singleValue_int() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: Int.random(in: .min ... .max)
        )
    }
    
    public func test_singleValue_int8() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: Int8.random(in: .min ... .max)
        )
    }
    
    public func test_singleValue_int16() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: Int16.random(in: .min ... .max)
        )
    }
    
    public func test_singleValue_int32() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: Int32.random(in: .min ... .max)
        )
    }
    
    public func test_singleValue_int64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: Int64.random(in: .min ... .max)
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
            value: "Test"
        )
    }
    
    public func test_singleValue_uint() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: UInt.random(in: .min ... .max)
        )
    }
    
    public func test_singleValue_uint8() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: UInt8.random(in: .min ... .max)
        )
    }
    
    public func test_singleValue_uint16() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: UInt16.random(in: .min ... .max)
        )
    }
    
    public func test_singleValue_uint32() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: UInt32.random(in: .min ... .max)
        )
    }
    
    public func test_singleValue_uint64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: UInt64.random(in: .min ... .max)
        )
    }
    
    // MARK: Keyed Single Value Tests
        
    public func test_keyedValue_singleValueProperties_maximumValues() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: CodableTestTypes.SingleValueProperties.maximumValues
        )
    }
    
    public func test_keyedValue_singleValueProperties_minimumValues() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: CodableTestTypes.SingleValueProperties.minimumValues
        )
    }
    
    public func test_keyedValue_singleValueProperties_nilValues() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: CodableTestTypes.SingleValueProperties.nil
        )
    }
    
    // MARK: Keyed Omni Value Tests
    
    public func test_keyedValue_omniValueProperties_maximumValues() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: CodableTestTypes.OmniValueProperties.maximumValues
        )
    }
    
    public func test_keyedValue_omniValueProperties_minimumValues() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: CodableTestTypes.OmniValueProperties.minimumValues
        )
    }
    
    public func test_keyedValue_omniValueProperties_nil() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: CodableTestTypes.OmniValueProperties.nil
        )
    }
    
    // MARK: Unkeyed Value Tests
    
    public func test_unkeyedValue_nil() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: CodableTestTypes.UnkeyedValueProperties.nil
        )
    }

    public func test_unkeyedValue_nonNil() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEndToEndCoding(
            encoder: encoder,
            decoder: decoder,
            value: CodableTestTypes.UnkeyedValueProperties.nonNil
        )
    }
}

