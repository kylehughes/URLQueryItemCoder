//
//  AbstractTopLevelDecoderTests.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 1/12/23.
//

import Combine
import XCTest

@testable import URLQueryItemDecodable

public class AbstractTopLevelDecoderTests<Target>: XCTestCase where Target: TopLevelDecoder, Target.Input: Equatable {
    // MARK: Public Abstract Interface
    
    public var expectedValues: CodableTestExpectation<Target.Input> {
        fatalErrorForUnimplementedAbstractInterface()
    }

    public var target: Target {
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
    
    // MARK: Single Value Tests
    
    public func test_singleValue_bool() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.boolExpectation,
            as: .random()
        )
    }
    
    public func test_singleValue_double() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.doubleExpectation,
            as: .random(in: 0 ... .greatestFiniteMagnitude)
        )
    }
    
    public func test_singleValue_float() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.floatExpectation,
            as: .random(in: 0 ... .greatestFiniteMagnitude)
        )
    }
    
    public func test_singleValue_int() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.intExpectation,
            as: .random(in: .min ... .max)
        )
    }
    
    public func test_singleValue_int8() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.int8Expectation,
            as: .random(in: .min ... .max)
        )
    }
    
    public func test_singleValue_int16() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.int16Expectation,
            as: .random(in: .min ... .max)
        )
    }
    
    public func test_singleValue_int32() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.int32Expectation,
            as: .random(in: .min ... .max)
        )
    }
    
    public func test_singleValue_int64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.int64Expectation,
            as: .random(in: .min ... .max)
        )
    }
    
    public func test_singleValue_nil() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.nilExpectation,
            as: nil
        )
    }
    
    public func test_singleValue_string() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.stringExpectation,
            as: "Test"
        )
    }
    
    public func test_singleValue_uint() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.uintExpectation,
            as: .random(in: .min ... .max)
        )
    }
    
    public func test_singleValue_uint8() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.uint8Expectation,
            as: .random(in: .min ... .max)
        )
    }
    
    public func test_singleValue_uint16() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.uint16Expectation,
            as: .random(in: .min ... .max)
        )
    }
    
    public func test_singleValue_uint32() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.uint32Expectation,
            as: .random(in: .min ... .max)
        )
    }
    
    public func test_singleValue_uint64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)

        XCTAssertDecoder(
            target,
            decodes: expectedValues.uint64Expectation,
            as: .random(in: .min ... .max)
        )
    }
    
    // TODO: Rest of sing value tests
    
    // MARK: Keyed Single Value Tests
    
    public func test_keyedValue_singleValueProperties_maximumValues() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedSingleValueExpectation,
            as: CodableTestTypes.SingleValueProperties.maximumValues
        )
    }
    
    public func test_keyedValue_singleValueProperties_minimumValues() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedSingleValueExpectation,
            as: CodableTestTypes.SingleValueProperties.minimumValues
        )
    }
    
    public func test_keyedValue_singleValueProperties_nilValues() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertDecoder(
            target,
            decodes: expectedValues.keyedSingleValueExpectation,
            as: CodableTestTypes.SingleValueProperties.nil
        )
    }
    
    // MARK: Keyed Omni-Value Tests
    
    public func test_keyedValue_omniValueProperties_maximumValues() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertDecoder(
            target,
            decodes: { output in
                expectedValues.keyedKeyedValueExpectation(
                    output,
                    expectedValues.keyedSingleValueExpectation,
                    expectedValues.unkeyedSingleValueExpectation
                )
            },
            as: CodableTestTypes.OmniValueProperties.maximumValues
        )
    }
    
    public func test_keyedValue_omniValueProperties_minimumValues() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertDecoder(
            target,
            decodes: { output in
                expectedValues.keyedKeyedValueExpectation(
                    output,
                    expectedValues.keyedSingleValueExpectation,
                    expectedValues.unkeyedSingleValueExpectation
                )
            },
            as: CodableTestTypes.OmniValueProperties.minimumValues
        )
    }
    
    public func test_keyedValue_omniValueProperties_nilValues() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertDecoder(
            target,
            decodes: { output in
                expectedValues.keyedKeyedValueExpectation(
                    output,
                    expectedValues.keyedSingleValueExpectation,
                    expectedValues.unkeyedSingleValueExpectation
                )
            },
            as: CodableTestTypes.OmniValueProperties.nil
        )
    }
    
    // MARK: Unkeyed Value Tests

    public func test_unkeyedValue_nil() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertDecoder(
            target,
            decodes: expectedValues.unkeyedSingleValueExpectation,
            as: CodableTestTypes.UnkeyedValueProperties.nil
        )
    }

    public func test_unkeyedValue_nonNil() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertDecoder(
            target,
            decodes: expectedValues.unkeyedSingleValueExpectation,
            as: CodableTestTypes.UnkeyedValueProperties.nonNil
        )
    }
}
