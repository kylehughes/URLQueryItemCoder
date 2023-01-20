//
//  URLQueryItemDecoderTests.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 1/12/23.
//

import XCTest

@testable import TestSupport
@testable import URLQueryItemDecoder

final class URLQueryItemDecoderTests: AbstractTopLevelDecoderTests<URLQueryItemDecoder2> {
    // MARK: AbstractTopLevelDecoderTest Implementation
    
    override var expectedValues: CodableTestExpectation<[URLQueryItem]> {
        .urlQueryItems(isEncoding: false)
    }

    override var target: URLQueryItemDecoder2 {
        URLQueryItemDecoder2()
    }
}
