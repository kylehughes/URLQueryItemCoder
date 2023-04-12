//
//  URLQueryItemCoderEndToEndTests.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 2/23/23.
//

import XCTest

@testable import URLQueryItemCoder

final class URLQueryItemCoderEndToEndTests: AbstractEndToEndTests<URLQueryItemEncoder, URLQueryItemDecoder> {
    // MARK: AbstractEndToEndTests Implementation
    
    override func decoder(using strategies: DecodingStrategies = .default) -> URLQueryItemDecoder {
        URLQueryItemDecoder(strategies: strategies)
    }
    
    override func encoder(using strategies: EncodingStrategies = .default) -> URLQueryItemEncoder {
        URLQueryItemEncoder(strategies: strategies)
    }
}

// MARK: - Output Formatting Tests

extension URLQueryItemCoderEndToEndTests {
    // MARK: Keyed Value Sorted Keys Tests
    
    public func test_keyedValue_sortedKeys() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let inputValue = CodableTestTypes.KeyEncodingStrategy.default
        
        let encodedValue = try URLQueryItemEncoder(outputFormatting: .sortedKeys).encode(inputValue)
        let decodedValue = try URLQueryItemDecoder().decode(type(of: inputValue), from: encodedValue)
        
        XCTAssertEqual(decodedValue, inputValue)
    }
}
