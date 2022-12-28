//
//  URLQueryItemEncoderTests.swift
//  URLQueryItemCodableTests
//
//  Created by Kyle Hughes on 12/27/22.
//

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
    // MARK: Public Instance Interface
    
    public func test_rawValue() throws {
        let target = 1
        
        let instance = URLQueryItemEncoder()
        let queryItems = try instance.encode(target)
        
        XCTAssertEqual(queryItems.count, 1)
        XCTAssertEqual(queryItems[0].name, String())
        XCTAssertEqual(queryItems[0].value, String(target))
    }
    
    public func test_complexType_oneProperty() throws {
        let target = TestTypes.SingleProperty(one: "value")

        let instance = URLQueryItemEncoder()
        let queryItems = try instance.encode(target)
        
        XCTAssertEqual(queryItems.count, 1)
        XCTAssertEqual(queryItems[0].name, "one")
        XCTAssertEqual(queryItems[0].value, String(target.one))
    }
    
    public func test_complexType_multipleProperties() throws {
        let target = TestTypes.MultipleProperties(one: "value", two: 123, three: true)

        let instance = URLQueryItemEncoder()
        let queryItems = try instance.encode(target)
        
        XCTAssertEqual(queryItems.count, 3)
        XCTAssertEqual(queryItems[0].name, "one")
        XCTAssertEqual(queryItems[0].value, String(target.one))
        XCTAssertEqual(queryItems[1].name, "three")
        XCTAssertEqual(queryItems[1].value, String(target.three))
        XCTAssertEqual(queryItems[2].name, "two")
        XCTAssertEqual(queryItems[2].value, String(target.two))
    }
    
    public func test_complexType_nestedProperties() throws {
        let target = TestTypes.NestedProperties(
            one: TestTypes.SingleProperty(one: "value"),
            two: TestTypes.MultipleProperties(one: "value", two: 123, three: true)
        )

        let instance = URLQueryItemEncoder()
        let queryItems = try instance.encode(target)
        
        XCTAssertEqual(queryItems.count, 4)
        XCTAssertEqual(queryItems[0].name, "one.one")
        XCTAssertEqual(queryItems[0].value, String(target.one.one))
        XCTAssertEqual(queryItems[1].name, "two.one")
        XCTAssertEqual(queryItems[1].value, String(target.two.one))
        XCTAssertEqual(queryItems[2].name, "two.three")
        XCTAssertEqual(queryItems[2].value, String(target.two.three))
        XCTAssertEqual(queryItems[3].name, "two.two")
        XCTAssertEqual(queryItems[3].value, String(target.two.two))
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
