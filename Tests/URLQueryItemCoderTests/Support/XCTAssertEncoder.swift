//
//  XCTAssertEncodable.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 12/29/22.
//

import Combine
import XCTest

@testable import URLQueryItemCoder

public func XCTAssertEncoder<Encoder, Input>(
    _ encoder: Encoder,
    encodes value: Input,
    as expectation: @autoclosure () -> Encoder.Output,
    file: StaticString = #filePath,
    line: UInt = #line
) where Encoder: TopLevelEncoder, Encoder.Output: Equatable, Input: Encodable {
    do {
        let encodedValue = try encoder.encode(value)
        
        XCTAssertEqual(encodedValue, expectation(), file: file, line: line)
    } catch {
        XCTFail(error.localizedDescription)
    }
}

public func XCTAssertEncoder<Encoder, Input>(
    _ encoder: (EncodingStrategies) -> Encoder,
    encodes value: Input,
    using configuration: EncodingStrategies = .default,
    as expectation: (Input, EncodingStrategies) -> Encoder.Output,
    prepareForEqualityAssertion: (Encoder.Output) -> Encoder.Output = { $0 },
    file: StaticString = #filePath,
    line: UInt = #line
) where Encoder: TopLevelEncoder, Encoder.Output: Equatable, Input: Encodable {
    do {
        let encodedValue = try encoder(configuration).encode(value)
        
        XCTAssertEqual(
            prepareForEqualityAssertion(encodedValue),
            prepareForEqualityAssertion(expectation(value, configuration)),
            file: file,
            line: line
        )
    } catch {
        XCTFail(error.localizedDescription, file: file, line: line)
    }
}
