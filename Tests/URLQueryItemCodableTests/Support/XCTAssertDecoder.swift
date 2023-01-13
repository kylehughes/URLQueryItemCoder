//
//  XCTAssertDecoder.swift
//  CodableSkeletonTests
//
//  Created by Kyle Hughes on 12/29/22.
//

import Combine
import XCTest

func XCTAssertDecoder<Decoder, Output>(
    _ decoder: Decoder,
    decodes value: (Output) -> Decoder.Input,
    as expectation: Output,
    file: StaticString = #filePath,
    line: UInt = #line
) where Decoder: TopLevelDecoder, Decoder.Input: Equatable, Output: Decodable & Equatable {
    do {
        let decodedValue = try decoder.decode(Output.self, from: value(expectation))
        
        XCTAssertEqual(decodedValue, expectation, file: file, line: line)
    } catch {
        XCTFail(error.localizedDescription)
    }
}
