//
//  AbstractTopLevelDecoderTests.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 1/12/23.
//

import Combine
import XCTest

@testable import URLQueryItemCodable

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

        return XCTestSuite(name: "Empty Suite for \(AbstractTopLevelDecoderTests.self)")
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
    
    // TODO: Rest of tests
    
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
