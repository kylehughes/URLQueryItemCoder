//
//  XCTAssertURLQueryItemEncoder.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 12/29/22.
//

import Foundation

@testable import URLQueryItemCodable

func XCTAssertURLQueryItemEncoder(
    encodesSingleValue value: some Encodable & LosslessStringConvertible,
    file: StaticString = #filePath,
    line: UInt = #line
) {
    XCTAssertEncoder(
        URLQueryItemEncoder(),
        encodes: value,
        as: {
            [
                URLQueryItem(name: String(), value: $0),
            ]
        },
        file: file,
        line: line
    )
}
