//
//  XCTAssertDecoder.swift
//  TestSupport
//
//  Created by Kyle Hughes on 12/29/22.
//

import Combine
import XCTest

public func XCTAssertDecoder<Decoder, Output>(
    _ decoder: Decoder,
    decodes value: (Output) -> Decoder.Input,
    as expectation: Output,
    file: StaticString = #filePath,
    line: UInt = #line
) where Decoder: TopLevelDecoder, Decoder.Input: Equatable, Output: Decodable & Equatable {
    do {
        let inputValue = value(expectation)
        let decodedValue = try decoder.decode(Output.self, from: inputValue)
        
        XCTAssertEqual(decodedValue, expectation, file: file, line: line)
    } catch {
        XCTFail(error.localizedDescription, file: file, line: line)
    }
}


public func XCTAssertEndToEndCoding<Encoder, Decoder>(
    encoder: Encoder,
    decoder: Decoder,
    value: some Codable & Equatable,
    file: StaticString = #filePath,
    line: UInt = #line
) where
    Encoder: TopLevelEncoder,
    Encoder.Output: Equatable,
    Decoder: TopLevelDecoder,
    Decoder.Input == Encoder.Output
{
    do {
        let encodedRepresentation = try encoder.encode(value)
        let decodedRepresentation = try decoder.decode(type(of: value), from: encodedRepresentation)
        
        XCTAssertEqual(value, decodedRepresentation, file: file, line: line)
    } catch {
        XCTFail(error.localizedDescription, file: file, line: line)
    }
}
