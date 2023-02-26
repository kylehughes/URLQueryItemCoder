//
//  AbstractTopLevelEncoderTests.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 12/29/22.
//

import Combine
import XCTest

@testable import TestSupport
@testable import URLQueryItemEncoder

public class AbstractTopLevelEncoderTests<Target>: XCTestCase where
    Target: TopLevelEncoder,
    Target.Output: Equatable
{
    // MARK: Public Abstract Interface
    
    public var expectedValues: CodableTestExpectation<Target.Output> {
        fatalErrorForUnimplementedAbstractInterface()
    }

    public var target: Target {
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
    
    // MARK: Single Value Tests
    
    public func test_singleValue_bool() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: .random(),
            as: expectedValues.boolExpectation
        )
    }
    
    public func test_singleValue_double() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .greatestFiniteMagnitude),
            as: expectedValues.doubleExpectation
        )
    }
    
    public func test_singleValue_float() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .greatestFiniteMagnitude),
            as: expectedValues.floatExpectation
        )
    }
    
    public func test_singleValue_int() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .max),
            as: expectedValues.intExpectation
        )
    }
    
    public func test_singleValue_int8() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .max),
            as: expectedValues.int8Expectation
        )
    }
    
    public func test_singleValue_int16() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .max),
            as: expectedValues.int16Expectation
        )
    }
    
    public func test_singleValue_int32() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .max),
            as: expectedValues.int32Expectation
        )
    }
    
    public func test_singleValue_int64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .max),
            as: expectedValues.int64Expectation
        )
    }
    
    public func test_singleValue_nil() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue: String? = nil
        let encodedValue = try target.encode(inputValue)
        
        XCTAssertEqual(encodedValue, expectedValues.nilExpectation(inputValue))
    }
    
    public func test_singleValue_string() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: "Test",
            as: expectedValues.stringExpectation
        )
    }
    
    public func test_singleValue_uint() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .max),
            as: expectedValues.uintExpectation
        )
    }
    
    public func test_singleValue_uint8() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .max),
            as: expectedValues.uint8Expectation
        )
    }
    
    public func test_singleValue_uint16() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .max),
            as: expectedValues.uint16Expectation
        )
    }
    
    public func test_singleValue_uint32() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .max),
            as: expectedValues.uint32Expectation
        )
    }
    
    public func test_singleValue_uint64() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .max),
            as: expectedValues.uint64Expectation
        )
    }
    
    // MARK: Keyed Values Tests
    
    public func test_keyedValue_singleValueProperties_maximumValues() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.maximumValues,
            as: expectedValues.keyedSingleValueExpectation
        )
    }
    
    public func test_keyedValue_singleValueProperties_minimumValues() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.minimumValues,
            as: expectedValues.keyedSingleValueExpectation
        )
    }
    
    public func test_keyedValue_singleValueProperties_nil() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.SingleValueProperties.nil,
            as: expectedValues.keyedSingleValueExpectation
        )
    }
    
    public func test_keyedValue_omniValueProperties_maximumValues() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.OmniValueProperties.maximumValues,
            as: { input in
                expectedValues.keyedKeyedValueExpectation(
                    input,
                    expectedValues.keyedSingleValueExpectation,
                    expectedValues.unkeyedSingleValueExpectation
                )
            }
        )
    }
    
    public func test_keyedValue_omniValueProperties_minimumValues() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.OmniValueProperties.minimumValues,
            as: { input in
                expectedValues.keyedKeyedValueExpectation(
                    input,
                    expectedValues.keyedSingleValueExpectation,
                    expectedValues.unkeyedSingleValueExpectation
                )
            }
        )
    }
    
    public func test_keyedValue_omniValueProperties_nil() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
                
        XCTAssertEncoder(
            target,
            encodes: CodableTestTypes.OmniValueProperties.nil,
            as: { input in
                expectedValues.keyedKeyedValueExpectation(
                    input,
                    expectedValues.keyedSingleValueExpectation,
                    expectedValues.unkeyedSingleValueExpectation
                )
            }
        )
    }
    
    // MARK: Unkeyed Value Tests
    
    public func test_unkeyedValue_nil() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = CodableTestTypes.UnkeyedValueProperties.nil
        let encodedValue = try target.encode(inputValue)
        
        XCTAssertEqual(encodedValue, expectedValues.unkeyedSingleValueExpectation(inputValue))
    }
    
    public func test_unkeyedValue_nonNil() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = CodableTestTypes.UnkeyedValueProperties.nonNil
        let encodedValue = try target.encode(inputValue)
        
        XCTAssertEqual(encodedValue, expectedValues.unkeyedSingleValueExpectation(inputValue))
    }
    
    // MARK: Performance Tests
    
    public func test_performance_singleValue() {
        measure {
            _ = try! target.encode(Double.greatestFiniteMagnitude)
        }
    }
    
    public func test_performance_keyedValue_singleValueProperties() {
        measure {
            _ = try! target.encode(CodableTestTypes.SingleValueProperties.maximumValues)
        }
    }
    
    public func test_performance_keyedValue_omniValueProperties() {
        measure {
            _ = try! target.encode(CodableTestTypes.OmniValueProperties.maximumValues)
        }
    }
    
    public func test_performance_unkeyedValue() {
        measure {
            _ = try! target.encode(CodableTestTypes.UnkeyedValueProperties.nonNil)
        }
    }
}
