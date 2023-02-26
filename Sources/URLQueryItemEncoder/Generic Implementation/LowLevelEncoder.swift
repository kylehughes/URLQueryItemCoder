//
//  LowLevelEncoder.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/15/23.
//

public final class LowLevelEncoder {
    public let userInfo: [CodingUserInfoKey: Any]
    
    public private(set) var codingPath: [any CodingKey]
    public private(set) var container: EncodingContainer?
    
    // MARK: Public Initialization
    
    public init(codingPath: [any CodingKey]) {
        self.codingPath = codingPath
        
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
    
    public func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key: CodingKey {
        preconditionCanEncodeNewContainer()
        
        let keyedContainer = EncodingContainer.Keyed(codingPath: codingPath)
        
        container = .keyed(keyedContainer)
        
        return KeyedEncodingContainer(keyedContainer.wrapped())
    }
    
    public func singleValueContainer() -> SingleValueEncodingContainer {
        preconditionCanEncodeNewContainer()
        
        let singleValueContainer = EncodingContainer.SingleValue(codingPath: codingPath)
        
        container = .singleValue(singleValueContainer)
        
        return singleValueContainer
    }
    
    public func unkeyedContainer() -> UnkeyedEncodingContainer {
        preconditionCanEncodeNewContainer()
        
        let unkeyedContainer = EncodingContainer.Unkeyed(codingPath: codingPath)
        
        container = .unkeyed(unkeyedContainer)
        
        return unkeyedContainer
    }
}
