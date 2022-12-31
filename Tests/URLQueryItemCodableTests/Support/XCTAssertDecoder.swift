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
    decodes value: Decoder.Input,
    as expectation: @autoclosure () -> Output,
    file: StaticString = #filePath,
    line: UInt = #line
) where Decoder: TopLevelDecoder, Decoder.Input: Equatable, Output: Decodable & Equatable {
    do {
        let decodedValue = try decoder.decode(Output.self, from: value)
        
        XCTAssertEqual(decodedValue, expectation(), file: file, line: line)
    } catch {
        XCTFail(error.localizedDescription)
    }
}

func XCTAssertDecoder<Decoder, Output>(
    _ decoder: Decoder,
    decodes value: Decoder.Input,
    as expectation: (Decoder.Input) -> Output,
    file: StaticString = #filePath,
    line: UInt = #line
) where Decoder: TopLevelDecoder, Decoder.Input: Equatable, Output: Decodable & Equatable {
    do {
        let decodedValue = try decoder.decode(Output.self, from: value)
        
        XCTAssertEqual(decodedValue, expectation(value), file: file, line: line)
    } catch {
        XCTFail(error.localizedDescription)
    }
}
