//
//  XCTAssertDecoder.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 12/29/22.
//

import Combine
import XCTest

@testable import URLQueryItemCoder

public func XCTAssertDecoder<Decoder, Output>(
    _ decoder: (DecodingStrategies) -> Decoder,
    decodes value: (Output, EncodingStrategies) -> Decoder.Input,
    encodedWith encodingStrategies: EncodingStrategies,
    decodedWith decodingStrategies: DecodingStrategies,
    as expectation: Output,
    file: StaticString = #filePath,
    line: UInt = #line
) where Decoder: TopLevelDecoder, Decoder.Input: Equatable, Output: Decodable & Equatable {
    do {
        let inputValue = value(expectation, encodingStrategies)
        let decodedValue = try decoder(decodingStrategies).decode(Output.self, from: inputValue)
        
        XCTAssertEqual(decodedValue, expectation, file: file, line: line)
    } catch {
        XCTFail(error.localizedDescription, file: file, line: line)
    }
}
