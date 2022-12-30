//
//  AbstractTopLevelEncoderTests.swift
//  CodableSkeleton
//
//  Created by Kyle Hughes on 12/29/22.
//

import Combine
import XCTest

@testable import URLQueryItemCodable

public class AbstractTopLevelEncoderTests<Target>: XCTestCase where Target: TopLevelEncoder, Target.Output: Equatable {
    // MARK: Public Abstract Interface

    public var target: Target {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    public func expectedOutputForSingleBool(_ value: Bool) -> Target.Output {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    public func expectedOutputForSingleDouble(_ value: Double) -> Target.Output {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    public func expectedOutputForSingleFloat(_ value: Float) -> Target.Output {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    public func expectedOutputForSingleInt(_ value: Int) -> Target.Output {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    public func expectedOutputForSingleInt8(_ value: Int8) -> Target.Output {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    public func expectedOutputForSingleInt16(_ value: Int16) -> Target.Output {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    public func expectedOutputForSingleInt32(_ value: Int32) -> Target.Output {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    public func expectedOutputForSingleInt64(_ value: Int64) -> Target.Output {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    public func expectedOutputForSingleNil(_ value: String?) -> Target.Output {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    public func expectedOutputForSingleString(_ value: String) -> Target.Output {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    public func expectedOutputForSingleUInt(_ value: UInt) -> Target.Output {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    public func expectedOutputForSingleUInt8(_ value: UInt8) -> Target.Output {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    public func expectedOutputForSingleUInt16(_ value: UInt16) -> Target.Output {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    public func expectedOutputForSingleUInt32(_ value: UInt32) -> Target.Output {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    public func expectedOutputForSingleUInt64(_ value: UInt64) -> Target.Output {
        fatalErrorForUnimplementedAbstractInterface()
    }
    
    // MARK: XCTestCase Implementation
    
    override class public var defaultTestSuite: XCTestSuite {
        guard self == AbstractTopLevelEncoderTests.self else {
            return super.defaultTestSuite
        }

        return XCTestSuite(name: "Empty Suite for \(AbstractTopLevelEncoderTests.self)")
    }
    
    // MARK: Single Value Tests
    
    public func test_singleValue_bool() throws {
        try XCTSkipIf(type(of: self) == AbstractTopLevelEncoderTests.self)
        
        XCTAssertEncoder(
            target,
            encodes: .random(),
            as: expectedOutputForSingleBool
        )
    }
    
    public func test_singleValue_double() throws {
        try XCTSkipIf(type(of: self) == AbstractTopLevelEncoderTests.self)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .greatestFiniteMagnitude),
            as: expectedOutputForSingleDouble
        )
    }
    
    public func test_singleValue_float() throws {
        try XCTSkipIf(type(of: self) == AbstractTopLevelEncoderTests.self)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .greatestFiniteMagnitude),
            as: expectedOutputForSingleFloat
        )
    }
    
    public func test_singleValue_int() throws {
        try XCTSkipIf(type(of: self) == AbstractTopLevelEncoderTests.self)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .max),
            as: expectedOutputForSingleInt
        )
    }
    
    public func test_singleValue_int8() throws {
        try XCTSkipIf(type(of: self) == AbstractTopLevelEncoderTests.self)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .max),
            as: expectedOutputForSingleInt8
        )
    }
    
    public func test_singleValue_int16() throws {
        try XCTSkipIf(type(of: self) == AbstractTopLevelEncoderTests.self)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .max),
            as: expectedOutputForSingleInt16
        )
    }
    
    public func test_singleValue_int32() throws {
        try XCTSkipIf(type(of: self) == AbstractTopLevelEncoderTests.self)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .max),
            as: expectedOutputForSingleInt32
        )
    }
    
    public func test_singleValue_int64() throws {
        try XCTSkipIf(type(of: self) == AbstractTopLevelEncoderTests.self)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .max),
            as: expectedOutputForSingleInt64
        )
    }
    
    public func test_singleValue_nil() throws {
        try XCTSkipIf(type(of: self) == AbstractTopLevelEncoderTests.self)
        
        XCTAssertEncoder(
            target,
            encodes: nil,
            as: expectedOutputForSingleNil
        )
    }
    
    public func test_singleValue_string() throws {
        try XCTSkipIf(type(of: self) == AbstractTopLevelEncoderTests.self)
        
        XCTAssertEncoder(
            target,
            encodes: "Test",
            as: expectedOutputForSingleString
        )
    }
    
    public func test_singleValue_uint() throws {
        try XCTSkipIf(type(of: self) == AbstractTopLevelEncoderTests.self)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .max),
            as: expectedOutputForSingleUInt
        )
    }
    
    public func test_singleValue_uint8() throws {
        try XCTSkipIf(type(of: self) == AbstractTopLevelEncoderTests.self)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .max),
            as: expectedOutputForSingleUInt8
        )
    }
    
    public func test_singleValue_uint16() throws {
        try XCTSkipIf(type(of: self) == AbstractTopLevelEncoderTests.self)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .max),
            as: expectedOutputForSingleUInt16
        )
    }
    
    public func test_singleValue_uint32() throws {
        try XCTSkipIf(type(of: self) == AbstractTopLevelEncoderTests.self)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .max),
            as: expectedOutputForSingleUInt32
        )
    }
    
    public func test_singleValue_uint64() throws {
        try XCTSkipIf(type(of: self) == AbstractTopLevelEncoderTests.self)
        
        XCTAssertEncoder(
            target,
            encodes: .random(in: 0 ... .max),
            as: expectedOutputForSingleUInt64
        )
    }
}