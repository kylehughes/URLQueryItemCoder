//
//  URLQueryItemDecoderTests.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 1/12/23.
//

import XCTest

@testable import TestSupport
@testable import URLQueryItemDecoder

final class URLQueryItemDecoderTests: AbstractTopLevelDecoderTests<URLQueryItemDecoder> {
    // MARK: AbstractTopLevelDecoderTest Implementation
    
    override var expectedValues: CodableTestExpectation<[URLQueryItem]> {
        .urlQueryItems(isEncoding: true)
    }

    override var target: URLQueryItemDecoder {
        URLQueryItemDecoder()
    }
}
