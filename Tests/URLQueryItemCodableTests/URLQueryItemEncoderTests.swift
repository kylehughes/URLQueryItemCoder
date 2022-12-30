//
//  URLQueryItemEncoderTests.swift
//  URLQueryItemCodableTests
//
//  Created by Kyle Hughes on 12/27/22.
//

import Combine
import XCTest

@testable import URLQueryItemCodable

final class URLQueryItemEncoderTests: XCTestCase {
    // MARK: XCTestCase Implementation
    
    override func setUp() {
        // NO-OP
    }
    
    override func tearDown() {
        // NO-OP
    }
}

// MARK: - Single Value Tests

extension URLQueryItemEncoderTests {
    // MARK: Internal Instance Interface
    
    func test_singleValue_bool(){
        XCTAssertURLQueryItemEncoder(encodesSingleValue: Bool.random())
    }
    
    func test_singleValue_double(){
        XCTAssertURLQueryItemEncoder(encodesSingleValue: Double.random(in: 0 ... .greatestFiniteMagnitude))
    }
    
    func test_singleValue_float(){
        XCTAssertURLQueryItemEncoder(encodesSingleValue: Float.random(in: 0 ... .greatestFiniteMagnitude))
    }
    
    func test_singleValue_int(){
        XCTAssertURLQueryItemEncoder(encodesSingleValue: Int.random(in: 0 ... .max))
    }
    
    func test_singleValue_int8(){
        XCTAssertURLQueryItemEncoder(encodesSingleValue: Int8.random(in: 0 ... .max))
    }
    
    func test_singleValue_int16(){
        XCTAssertURLQueryItemEncoder(encodesSingleValue: Int16.random(in: 0 ... .max))
    }
    
    func test_singleValue_int32(){
        XCTAssertURLQueryItemEncoder(encodesSingleValue: Int32.random(in: 0 ... .max))
    }
    
    func test_singleValue_int64(){
        XCTAssertURLQueryItemEncoder(encodesSingleValue: Int64.random(in: 0 ... .max))
    }
}

// MARK: - Complex Value Tests

extension URLQueryItemEncoderTests {
    // MARK: Internal Instance Interface
    
    func test_complexType_oneProperty_notNil() {
        XCTAssertEncoder(
            URLQueryItemEncoder(),
            encodes: TestTypes.SingleProperty(one: "value")
        ) {
            [
                URLQueryItem(name: "one", value: $0.one),
            ]
        }
    }
    
    func test_complexType_oneProperty_nil() {
        XCTAssertEncoder(
            URLQueryItemEncoder(),
            encodes: TestTypes.SingleProperty(one: nil),
            as: []
        )
    }
    
    func test_complexType_multipleProperties_withoutNil() {
        XCTAssertEncoder(
            URLQueryItemEncoder(),
            encodes: TestTypes.MultipleProperties(one: "value", two: 123, three: true)
        ) {
            [
                URLQueryItem(name: "one", value: $0.one),
                URLQueryItem(name: "three", value: $0.three),
                URLQueryItem(name: "two", value: $0.two),
            ]
        }
    }
    
    func test_complexType_multipleProperties_withNil() {
        XCTAssertEncoder(
            URLQueryItemEncoder(),
            encodes: TestTypes.MultipleProperties(one: nil, two: 123, three: true)
        ) {
            [
                URLQueryItem(name: "three", value: $0.three),
                URLQueryItem(name: "two", value: $0.two),
            ]
        }
    }
    
    func test_complexType_nestedProperties_withoutNil() {
        XCTAssertEncoder(
            URLQueryItemEncoder(),
            encodes: TestTypes.NestedProperties(
                one: TestTypes.SingleProperty(one: "value"),
                two: TestTypes.MultipleProperties(one: "value", two: 123, three: true)
            )
        ) {
            [
                URLQueryItem(name: "one.one", value: $0.one.one),
                URLQueryItem(name: "two.one", value: $0.two.one),
                URLQueryItem(name: "two.three", value: $0.two.three),
                URLQueryItem(name: "two.two", value: $0.two.two),
            ]
        }
    }
    
    func test_complexType_nestedProperties_withNil() {
        XCTAssertEncoder(
            URLQueryItemEncoder(),
            encodes: TestTypes.NestedProperties(
                one: TestTypes.SingleProperty(one: nil),
                two: TestTypes.MultipleProperties(one: nil, two: 123, three: true)
            )
        ) {
            [
                URLQueryItem(name: "two.three", value: $0.two.three),
                URLQueryItem(name: "two.two", value: $0.two.two),
            ]
        }
    }
}

// MARK: - TestTypes Definition

private enum TestTypes {
    // NO-OP
}

// MARK: - TestTypes.MultipleProperties

extension TestTypes {
    struct MultipleProperties: Encodable {
        let one: String?
        let two: Int
        let three: Bool
    }
}

// MARK: - TestTypes.NestedProperties

extension TestTypes {
    struct NestedProperties: Encodable {
        let one: SingleProperty
        let two: MultipleProperties
    }
}

// MARK: - TestTypes.SingleProperty

extension TestTypes {
    struct SingleProperty: Encodable {
        let one: String?
    }
}
