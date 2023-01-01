//
//  URLQueryItemDecoder+UnkeyedContainer.swift
//  URLQueryItemCodable
//
//  Created by Kyle Hughes on 12/30/22.
//

import Foundation

extension URLQueryItemDecoder {
    internal struct UnkeyedContainer {
        internal private(set) var codingPath: [any CodingKey]
        
        private let intermediate: Intermediate
        
        // MARK: Internal Initialization
        
        internal init(intermediate: Intermediate, codingPath: [any CodingKey]) {
            self.intermediate = intermediate
            self.codingPath = codingPath
        }
}

// MARK: - UnkeyedDecodingContainer Extension

extension URLQueryItemDecoder.UnkeyedContainer: UnkeyedDecodingContainer {
    // MARK: Internal Instance Interface
    
    internal var count: Int? {
        <#code#>
    }
    
    internal var currentIndex: Int {
        <#code#>
    }
    
    internal var isAtEnd: Bool {
        <#code#>
    }
    
    mutating internal func decodeNil() throws -> Bool {
        <#code#>
    }
    
    mutating internal func nestedContainer<NestedKey>(
        keyedBy type: NestedKey.Type
    ) throws -> KeyedDecodingContainer<NestedKey> where NestedKey: CodingKey {
        <#code#>
    }
    
    mutating internal func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        <#code#>
    }
    
    mutating func superDecoder() throws -> Decoder {
        <#code#>
    }
}
