//
//  URLQueryItemDecoderTests.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/12/23.
//

import XCTest

@testable import URLQueryItemCoder

final class URLQueryItemDecoderTests: AbstractTopLevelDecoderTests<URLQueryItemDecoder> {
    // MARK: AbstractTopLevelDecoderTest Implementation
    
    override var expectedValues: CodableTestExpectation<[URLQueryItem]> {
        .urlQueryItems
    }
    
    override public func target(using strategies: DecodingStrategies = .default) -> URLQueryItemDecoder {
        URLQueryItemDecoder(strategies: strategies)
    }
}
