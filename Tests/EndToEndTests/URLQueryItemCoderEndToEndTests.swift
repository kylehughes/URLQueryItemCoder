//
//  URLQueryItemCoderEndToEndTests.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 2/23/23.
//

import XCTest

@testable import TestSupport
@testable import URLQueryItemDecoder
@testable import URLQueryItemEncoder

final class URLQueryItemCoderEndToEndTests: AbstractEndToEndTests<URLQueryItemEncoder, URLQueryItemDecoder> {
    // MARK: AbstractEndToEndTests Implementation
    
    override var decoder: URLQueryItemDecoder {
        URLQueryItemDecoder()
    }

    override var encoder: URLQueryItemEncoder {
        URLQueryItemEncoder()
    }
}
