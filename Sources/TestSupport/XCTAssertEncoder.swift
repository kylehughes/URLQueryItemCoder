//
//  XCTAssertEncodable.swift
//  TestSupport
//
//  Created by Kyle Hughes on 12/29/22.
//

import Combine
import XCTest

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
    _ encoder: Encoder,
    encodes value: Input,
    as expectation: (Input) -> Encoder.Output,
    file: StaticString = #filePath,
    line: UInt = #line
) where Encoder: TopLevelEncoder, Encoder.Output: Equatable, Input: Encodable {
    do {
        let encodedValue = try encoder.encode(value)
        
        XCTAssertEqual(encodedValue, expectation(value), file: file, line: line)
    } catch {
        XCTFail(error.localizedDescription)
    }
}
