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
    
    func test_rawValue() throws {
        try assert(
            URLQueryItemEncoder(),
            encodes: 1
        ) {
            [
                URLQueryItem(name: String(), value: String($0)),
            ]
        }
    }
    
    func test_complexType_oneProperty() throws {
        try assert(
            URLQueryItemEncoder(),
            encodes: TestTypes.SingleProperty(one: "value")
        ) {
            [
                URLQueryItem(name: "one", value: String($0.one)),
            ]
        }
    }
    
    func test_complexType_multipleProperties() throws {
        try assert(
            URLQueryItemEncoder(),
            encodes: TestTypes.MultipleProperties(one: "value", two: 123, three: true)
        ) {
            [
                URLQueryItem(name: "one", value: String($0.one)),
                URLQueryItem(name: "three", value: String($0.three)),
                URLQueryItem(name: "two", value: String($0.two)),
            ]
        }
    }
    
    func test_complexType_nestedProperties() throws {
        try assert(
            URLQueryItemEncoder(),
            encodes: TestTypes.NestedProperties(
                one: TestTypes.SingleProperty(one: "value"),
                two: TestTypes.MultipleProperties(one: "value", two: 123, three: true)
            )
        ) {
            [
                URLQueryItem(name: "one.one", value: String($0.one.one)),
                URLQueryItem(name: "two.one", value: String($0.two.one)),
                URLQueryItem(name: "two.three", value: String($0.two.three)),
                URLQueryItem(name: "two.two", value: String($0.two.two)),
            ]
        }
    }
    
    // MARK: Private Instance Interface
    
    private func assert<Encoder, Input>(
        _ encoder: Encoder,
        encodes value: Input,
        as expectation: (Input) -> Encoder.Output,
        file: StaticString = #filePath,
        line: UInt = #line
    ) throws where Encoder: TopLevelEncoder, Encoder.Output: Equatable, Input: Encodable {
        let encodedValue = try encoder.encode(value)
        
        XCTAssertEqual(encodedValue, expectation(value), file: file, line: line)
    }
}

// MARK: - TestTypes Definition

private enum TestTypes {
    // NO-OP
}

// MARK: - TestTypes.MultipleProperties

extension TestTypes {
    struct MultipleProperties: Encodable {
        let one: String
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
        let one: String
    }
}
