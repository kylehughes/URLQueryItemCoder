//
//  XCTAssertEndToEndCoding.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 2/25/23.
//

import Combine
import XCTest

@testable import URLQueryItemCoder

public func XCTAssertEndToEndCoding<Encoder, Decoder>(
    encoder: (EncodingStrategies) -> Encoder,
    decoder: (DecodingStrategies) -> Decoder,
    encodedWith encodingStrategies: EncodingStrategies = .default,
    decodedWith decodingStrategies: DecodingStrategies = .default,
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
        let encoder = encoder(encodingStrategies)
        let encodedRepresentation = try encoder.encode(value)
        
        let decoder = decoder(decodingStrategies)
        let decodedRepresentation = try decoder.decode(type(of: value), from: encodedRepresentation)
        
        XCTAssertEqual(value, decodedRepresentation, file: file, line: line)
    } catch {
        XCTFail(error.localizedDescription, file: file, line: line)
    }
}

public func XCTAssertEndToEndCoding<Encoder, Decoder>(
    encoder: (EncodingStrategies) -> Encoder,
    decoder: (DecodingStrategies) -> Decoder,
    encodedWith encodingStrategies: EncodingStrategies = .default,
    decodedWith decodingStrategies: DecodingStrategies = .default,
    value: some Codable & Equatable & FloatingPoint,
    file: StaticString = #filePath,
    line: UInt = #line
) where
    Encoder: TopLevelEncoder,
    Encoder.Output: Equatable,
    Decoder: TopLevelDecoder,
    Decoder.Input == Encoder.Output
{
    do {
        let encoder = encoder(encodingStrategies)
        let encodedRepresentation = try encoder.encode(value)
        
        let decoder = decoder(decodingStrategies)
        let decodedRepresentation = try decoder.decode(type(of: value), from: encodedRepresentation)
        
        if value.isNaN {
            XCTAssertEqual(value.isNaN, decodedRepresentation.isNaN)
        } else {
            XCTAssertEqual(value, decodedRepresentation, file: file, line: line)
        }
    } catch {
        XCTFail(error.localizedDescription, file: file, line: line)
    }
}
