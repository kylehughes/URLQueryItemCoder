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

// MARK: - Tests

extension URLQueryItemEncoderTests {
    // MARK: Internal Instance Interface
    
    func test_rawValue(){
        XCTAssertEncoder(
            URLQueryItemEncoder(),
            encodes: 1
        ) {
            [
                URLQueryItem(name: String(), value: $0),
            ]
        }
    }
    
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
