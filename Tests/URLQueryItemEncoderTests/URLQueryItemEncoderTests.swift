//
//  URLQueryItemEncoderTests.swift
//  URLQueryItemEncoderTests
//
//  Created by Kyle Hughes on 1/15/23.
//

import Combine
import XCTest

@testable import TestSupport
@testable import URLQueryItemEncoder

final class URLQueryItemEncoderTests: AbstractTopLevelEncoderTests<URLQueryItemEncoder> {
    // MARK: AbstractTopLevelEncoderTest Implementation
    
    override var expectedValues: CodableTestExpectation<[URLQueryItem]> {
        .urlQueryItems(isEncoding: false)
    }

    override var target: URLQueryItemEncoder {
        URLQueryItemEncoder()
    }
}
