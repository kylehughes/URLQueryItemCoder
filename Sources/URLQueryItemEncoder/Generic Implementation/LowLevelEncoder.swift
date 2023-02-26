//
//  LowLevelEncoder.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/15/23.
//

public final class LowLevelEncoder {
    public let userInfo: [CodingUserInfoKey: Any]
    
    public private(set) var codingPath: [any CodingKey]
    public private(set) var storage: EncodingContainer?
    
    // MARK: Public Initialization
    
    public init(codingPath: [any CodingKey]) {
        self.codingPath = codingPath
        
        storage = nil
        userInfo = [:]
    }
    
    // MARK: Private Instance Interface
    
    private func preconditionCanEncodeNewContainer() {
        precondition(
            storage == nil,
            "A container was already created for the low-level encoder."
        )
    }
}

// MARK: - Encoder Extension

extension LowLevelEncoder: Encoder {
    // MARK: Internal Instance Interface
    
    public func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key: CodingKey {
        preconditionCanEncodeNewContainer()
        
        let container = EncodingContainer.Keyed(codingPath: codingPath)
        
        storage = .keyed(container)
        
        return KeyedEncodingContainer(container.wrapped())
    }
    
    public func singleValueContainer() -> SingleValueEncodingContainer {
        preconditionCanEncodeNewContainer()
        
        let container = EncodingContainer.SingleValue(codingPath: codingPath)
        
        storage = .singleValue(container)
        
        return container
    }
    
    public func unkeyedContainer() -> UnkeyedEncodingContainer {
        preconditionCanEncodeNewContainer()
        
        let container = EncodingContainer.Unkeyed(codingPath: codingPath)
        
        storage = .unkeyed(container)
        
        return container
    }
}
