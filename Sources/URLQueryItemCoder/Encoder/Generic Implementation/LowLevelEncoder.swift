//
//  LowLevelEncoder.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/15/23.
//

internal final class LowLevelEncoder {
    internal let userInfo: [CodingUserInfoKey: Any]
    
    internal private(set) var codingPath: [any CodingKey]
    internal private(set) var container: EncodingContainer?
    
    private let configuration: EncodingStrategies
    
    // MARK: Internal Initialization
    
    internal init(codingPath: [any CodingKey], configuration: EncodingStrategies) {
        self.codingPath = codingPath
        self.configuration = configuration
        
        container = nil
        userInfo = [:]
    }
    
    // MARK: Private Instance Interface
    
    private func preconditionCanEncodeNewContainer() {
        precondition(
            container == nil,
            "A container was already created for the low level encoder."
        )
    }
}

// MARK: - Encoder Extension

extension LowLevelEncoder: Encoder {
    // MARK: Internal Instance Interface
    
    internal func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key: CodingKey {
        preconditionCanEncodeNewContainer()
        
        let keyedContainer = EncodingContainer.Keyed(codingPath: codingPath, configuration: configuration)
        
        container = .keyed(keyedContainer)
        
        return KeyedEncodingContainer(keyedContainer.wrapped())
    }
    
    internal func singleValueContainer() -> SingleValueEncodingContainer {
        preconditionCanEncodeNewContainer()
        
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: codingPath, configuration: configuration)
        
        container = .singleValue(singleValueContainer)
        
        return singleValueContainer
    }
    
    internal func unkeyedContainer() -> UnkeyedEncodingContainer {
        preconditionCanEncodeNewContainer()
        
        let unkeyedContainer = EncodingContainer.Unkeyed(codingPath: codingPath, configuration: configuration)
        
        container = .unkeyed(unkeyedContainer)
        
        return unkeyedContainer
    }
}
