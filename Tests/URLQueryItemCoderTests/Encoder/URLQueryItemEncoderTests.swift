//
//  URLQueryItemEncoderTests.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/15/23.
//

import XCTest

@testable import URLQueryItemCoder

final class URLQueryItemEncoderTests: AbstractTopLevelEncoderTests<URLQueryItemEncoder> {
    // MARK: AbstractTopLevelEncoderTest Implementation
    
    override var expectedValues: CodableTestExpectation<[URLQueryItem]> {
        .urlQueryItems
    }
    
    override func target(using strategies: EncodingStrategies = .default) -> URLQueryItemEncoder {
        URLQueryItemEncoder(strategies: strategies)
    }
}

// MARK: - Output Formatting Tests

extension URLQueryItemEncoderTests {
    // MARK: Keyed Value Sorted Keys Tests
    
    public func test_keyedValue_sortedKeys() throws {
        try XCTSkipIf(Self.isAbstractTestCase)
        
        let encodingStrategies = EncodingStrategies()
        let inputValue = CodableTestTypes.SingleValueProperties.Abridged.default
        
        let encoder = URLQueryItemEncoder(strategies: encodingStrategies, outputFormatting: .sortedKeys)
        let encodedValue = try encoder.encode(inputValue)
        let expectedValue = expectedValues.keyedValueSortedKeys(inputValue, encodingStrategies)
        
        XCTAssertEqual(
            encodedValue,
            expectedValue
        )
    }
}
