//
//  URLQueryItemEncoderTests.swift
//  URLQueryItemCodableTests
//
//  Created by Kyle Hughes on 12/27/22.
//

import Combine
import XCTest

@testable import URLQueryItemCodable

final class URLQueryItemEncoderTests: AbstractTopLevelEncoderTests<URLQueryItemEncoder> {
    // MARK: TopLevelEncoderTest Implementation

    override var target: URLQueryItemEncoder {
        URLQueryItemEncoder()
    }
    
    override func expectedOutputForKeyedSingleValueProperties(
        _ value: CodableTestTypes.SingleValueProperties
    ) -> [URLQueryItem] {
        [
            URLQueryItem.nilIfValueIsNil(name: "bool", value: value.bool),
            URLQueryItem.nilIfValueIsNil(name: "double", value: value.double),
            URLQueryItem.nilIfValueIsNil(name: "float", value: value.float),
            URLQueryItem.nilIfValueIsNil(name: "int", value: value.int),
            URLQueryItem.nilIfValueIsNil(name: "int8", value: value.int8),
            URLQueryItem.nilIfValueIsNil(name: "int16", value: value.int16),
            URLQueryItem.nilIfValueIsNil(name: "int32", value: value.int32),
            URLQueryItem.nilIfValueIsNil(name: "int64", value: value.int64),
            URLQueryItem.nilIfValueIsNil(name: "string", value: value.string),
            URLQueryItem.nilIfValueIsNil(name: "uint", value: value.uint),
            URLQueryItem.nilIfValueIsNil(name: "uint8", value: value.uint8),
            URLQueryItem.nilIfValueIsNil(name: "uint16", value: value.uint16),
            URLQueryItem.nilIfValueIsNil(name: "uint32", value: value.uint32),
            URLQueryItem.nilIfValueIsNil(name: "uint64", value: value.uint64),
        ]
        .compactMap { $0 }
        .sorted { $0.name < $1.name }
    }
    
    override func expectedOutputForSingleBool(_ value: Bool) -> [URLQueryItem] {
        [
            URLQueryItem(name: String(), value: value)
        ]
    }
    
    override func expectedOutputForSingleDouble(_ value: Double) -> [URLQueryItem] {
        [
            URLQueryItem(name: String(), value: value)
        ]
    }
    
    override func expectedOutputForSingleFloat(_ value: Float) -> [URLQueryItem] {
        [
            URLQueryItem(name: String(), value: value)
        ]
    }
    
    override func expectedOutputForSingleInt(_ value: Int) -> [URLQueryItem] {
        [
            URLQueryItem(name: String(), value: value)
        ]
    }
    
    override func expectedOutputForSingleInt8(_ value: Int8) -> [URLQueryItem] {
        [
            URLQueryItem(name: String(), value: value)
        ]
    }
    
    override func expectedOutputForSingleInt16(_ value: Int16) -> [URLQueryItem] {
        [
            URLQueryItem(name: String(), value: value)
        ]
    }
    
    override func expectedOutputForSingleInt32(_ value: Int32) -> [URLQueryItem] {
        [
            URLQueryItem(name: String(), value: value)
        ]
    }
    
    override func expectedOutputForSingleInt64(_ value: Int64) -> [URLQueryItem] {
        [
            URLQueryItem(name: String(), value: value)
        ]
    }
    
    override func expectedOutputForSingleNil(_ value: String?) -> [URLQueryItem] {
        [
            URLQueryItem(name: String(), value: value)
        ]
    }
    
    override func expectedOutputForSingleString(_ value: String) -> [URLQueryItem] {
        [
            URLQueryItem(name: String(), value: value)
        ]
    }
    
    override func expectedOutputForSingleUInt(_ value: UInt) -> [URLQueryItem] {
        [
            URLQueryItem(name: String(), value: value)
        ]
    }
    
    override func expectedOutputForSingleUInt8(_ value: UInt8) -> [URLQueryItem] {
        [
            URLQueryItem(name: String(), value: value)
        ]
    }
    
    override func expectedOutputForSingleUInt16(_ value: UInt16) -> [URLQueryItem] {
        [
            URLQueryItem(name: String(), value: value)
        ]
    }
    
    override func expectedOutputForSingleUInt32(_ value: UInt32) -> [URLQueryItem] {
        [
            URLQueryItem(name: String(), value: value)
        ]
    }
    
    override func expectedOutputForSingleUInt64(_ value: UInt64) -> [URLQueryItem] {
        [
            URLQueryItem(name: String(), value: value)
        ]
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
