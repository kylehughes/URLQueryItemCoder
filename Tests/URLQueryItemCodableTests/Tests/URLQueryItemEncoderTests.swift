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
    // MARK: AbstractTopLevelEncoderTest Implementation

    override var target: URLQueryItemEncoder {
        URLQueryItemEncoder()
    }
    
    override func expectedOutputForKeyedKeyedValueProperties(
        _ value: CodableTestTypes.KeyedValueProperties
    ) -> [URLQueryItem] {
        let ones = expectedOutputForKeyedSingleValueProperties(value.one)
            .map { URLQueryItem(name: "one.\($0.name)", value: $0.value) }
        
        let twos = expectedOutputForKeyedSingleValueProperties(value.one)
            .map { URLQueryItem(name: "two.\($0.name)", value: $0.value) }
        
        let threes = expectedOutputForKeyedSingleValueProperties(value.one)
            .map { URLQueryItem(name: "three.\($0.name)", value: $0.value) }
        
        return (ones + twos + threes).sorted { $0.name < $1.name }
    }
    
    override func expectedOutputForKeyedSingleValueProperties(
        _ value: CodableTestTypes.SingleValueProperties?
    ) -> [URLQueryItem] {
        guard let value else {
            return []
        }
        
        return [
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
