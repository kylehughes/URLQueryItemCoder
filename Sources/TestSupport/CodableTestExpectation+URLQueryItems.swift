//
//  CodableTestExpectation+URLQueryItems.swift
//  TestSupport
//
//  Created by Kyle Hughes on 1/12/23.
//

import Foundation

@testable import Common

extension CodableTestExpectation where Value == [URLQueryItem] {
    // MARK: Public Static Interface
    
    static func urlQueryItems(isEncoding: Bool) -> Self {
        CodableTestExpectation { value in
            [
                URLQueryItem.init(name: String(), value: value)
            ]
        } doubleExpectation: { value in
            [
                URLQueryItem.init(name: String(), value: value)
            ]
        } floatExpectation: { value in
            [
                URLQueryItem.init(name: String(), value: value)
            ]
        } intExpectation: { value in
            [
                URLQueryItem.init(name: String(), value: value)
            ]
        } int8Expectation: { value in
            [
                URLQueryItem.init(name: String(), value: value)
            ]
        } int16Expectation: { value in
            [
                URLQueryItem.init(name: String(), value: value)
            ]
        } int32Expectation: { value in
            [
                URLQueryItem.init(name: String(), value: value)
            ]
        } int64Expectation: { value in
            [
                URLQueryItem.init(name: String(), value: value)
            ]
        } nilExpectation: { value in
            []
        } stringExpectation: { value in
            [
                URLQueryItem.init(name: String(), value: value)
            ]
        } uintExpectation: { value in
            [
                URLQueryItem.init(name: String(), value: value)
            ]
        } uint8Expectation: { value in
            [
                URLQueryItem.init(name: String(), value: value)
            ]
        } uint16Expectation: { value in
            [
                URLQueryItem.init(name: String(), value: value)
            ]
        } uint32Expectation: { value in
            [
                URLQueryItem.init(name: String(), value: value)
            ]
        } uint64Expectation: { value in
            [
                URLQueryItem.init(name: String(), value: value)
            ]
        } keyedSingleValueExpectation: { value in
            guard let value else {
                return []
            }
            
            return { () -> [URLQueryItem?] in
                guard isEncoding else {
                    return [
                        URLQueryItem(name: "bool", value: value.bool),
                        URLQueryItem(name: "double", value: value.double),
                        URLQueryItem(name: "float", value: value.float),
                        URLQueryItem(name: "int", value: value.int),
                        URLQueryItem(name: "int8", value: value.int8),
                        URLQueryItem(name: "int16", value: value.int16),
                        URLQueryItem(name: "int32", value: value.int32),
                        URLQueryItem(name: "int64", value: value.int64),
                        URLQueryItem(name: "string", value: value.string),
                        URLQueryItem(name: "uint", value: value.uint),
                        URLQueryItem(name: "uint8", value: value.uint8),
                        URLQueryItem(name: "uint16", value: value.uint16),
                        URLQueryItem(name: "uint32", value: value.uint32),
                        URLQueryItem(name: "uint64", value: value.uint64),
                    ]
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
            }()
            .compactMap { $0 }
            .sorted { $0.name < $1.name }
        } unkeyedSingleValueExpectation: { value in
            var output: [URLQueryItem] = []
            
            guard let value else {
                return output
            }
            
            for (index, element) in zip(value.indices, value) {
//                guard let element else {
//                    continue
//                }
//
                output.append(URLQueryItem(name: String(index), value: element))
            }
            
            return output
        } keyedKeyedValueExpectation: { value, singleValueExpectation, unkeyedValueExpectation in
            let ones = singleValueExpectation(value.one)
                .map { URLQueryItem(name: "one.\($0.name)", value: $0.value) }
            
            let twos = singleValueExpectation(value.two)
                .map { URLQueryItem(name: "two.\($0.name)", value: $0.value) }
            
            let threes = unkeyedValueExpectation(value.three)
                .map { URLQueryItem(name: "three.\($0.name)", value: $0.value) }
            
            let fours = unkeyedValueExpectation(value.four)
                .map { URLQueryItem(name: "four.\($0.name)", value: $0.value) }
            
            return (ones + twos + threes + fours).sorted { $0.name < $1.name }
        }
    }
}
