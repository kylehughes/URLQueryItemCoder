//
//  DecodingContainer+SingleValue.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 2/21/23.
//

import Foundation

extension DecodingContainer {
    /// A decoding container that holds a single primitive value.
    ///
    /// **As Keyed Value Container…**
    ///
    /// Only used for leaf node keyed containers that have no children (e.g. all nil properties). We can't detect that
    /// they are actually keyed containers when building our decoding representation because we don't have type
    /// information. The internal decoder system will know to ask for an keyed container and we will return this.
    ///
    /// **As Unkeyed Value Container…**
    ///
    /// Only used for leaf node unkeyed containers that have no children. We can't detect that they are actually unkeyed
    /// containers when building our decoding representation because we don't have type information. The internal
    /// decoder system will know to ask for an unkeyed container and we will return this.
    internal final class SingleValue {
        internal let codingPath: [any CodingKey]
        internal let configuration: DecodingStrategies
        
        internal private(set) var value: PrimitiveValue?
        
        // MARK: Internal Initialization
        
        internal init(codingPath: [any CodingKey], configuration: DecodingStrategies) {
            self.codingPath = codingPath
            self.configuration = configuration
            
            value = nil
        }
        
        // MARK: Internal Instance Interface
        
        internal func store(_ value: PrimitiveValue?) {
            precondition(
                self.value == nil,
                "A value was already stored in the single value container."
            )
            
            self.value = value
        }
        
        // MARK: Private Instance Interface

        private func nextCodingPath(appending key: any CodingKey) -> [any CodingKey] {
            var nextCodingPath = codingPath
            nextCodingPath.append(key)
            
            return nextCodingPath
        }
        
        private func unwrapPrimitiveValue<Target>(for target: Target.Type) throws -> PrimitiveValue {
            guard let value else {
                throw DecodingError.valueNotFound(target, .foundNilInsteadOfPrimitiveValue(at: codingPath))
            }
            
            return value
        }
    }
}

// MARK: - SingleValueDecodingContainer Extension

extension DecodingContainer.SingleValue: SingleValueDecodingContainer {
    // MARK: Internal Instance Interface
    
    internal func decode(_ type: Bool.Type) throws -> Bool {
        let primitiveValue = try unwrapPrimitiveValue(for: type)
        
        guard let decodedValue = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .primitiveValueMismatch(at: codingPath, for: type))
        }
        
        return decodedValue
    }
    
    internal func decode(_ type: String.Type) throws -> String {
        let primitiveValue = try unwrapPrimitiveValue(for: type)
        
        guard let decodedValue = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .primitiveValueMismatch(at: codingPath, for: type))
        }
        
        return decodedValue
    }
    
    internal func decode(_ type: Double.Type) throws -> Double {
        let lowLevelDecoder = LowLevelDecoder(container: .singleValue(self))
                                              
        return try configuration.nonConformingFloatStrategy.decode(insideOf: lowLevelDecoder)
    }
    
    internal func decode(_ type: Float.Type) throws -> Float {
        let lowLevelDecoder = LowLevelDecoder(container: .singleValue(self))
                                              
        return try configuration.nonConformingFloatStrategy.decode(insideOf: lowLevelDecoder)
    }
    
    internal func decode(_ type: Int.Type) throws -> Int {
        let primitiveValue = try unwrapPrimitiveValue(for: type)
        
        guard let decodedValue = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .primitiveValueMismatch(at: codingPath, for: type))
        }
        
        return decodedValue
    }
    
    internal func decode(_ type: Int8.Type) throws -> Int8 {
        let primitiveValue = try unwrapPrimitiveValue(for: type)
        
        guard let decodedValue = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .primitiveValueMismatch(at: codingPath, for: type))
        }
        
        return decodedValue
    }
    
    internal func decode(_ type: Int16.Type) throws -> Int16 {
        let primitiveValue = try unwrapPrimitiveValue(for: type)
        
        guard let decodedValue = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .primitiveValueMismatch(at: codingPath, for: type))
        }
        
        return decodedValue
    }
    
    internal func decode(_ type: Int32.Type) throws -> Int32 {
        let primitiveValue = try unwrapPrimitiveValue(for: type)
        
        guard let decodedValue = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .primitiveValueMismatch(at: codingPath, for: type))
        }
        
        return decodedValue
    }
    
    internal func decode(_ type: Int64.Type) throws -> Int64 {
        let primitiveValue = try unwrapPrimitiveValue(for: type)
        
        guard let decodedValue = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .primitiveValueMismatch(at: codingPath, for: type))
        }
        
        return decodedValue
    }
    
    internal func decode(_ type: UInt.Type) throws -> UInt {
        let primitiveValue = try unwrapPrimitiveValue(for: type)
        
        guard let decodedValue = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .primitiveValueMismatch(at: codingPath, for: type))
        }
        
        return decodedValue
    }
    
    internal func decode(_ type: UInt8.Type) throws -> UInt8 {
        let primitiveValue = try unwrapPrimitiveValue(for: type)
        
        guard let decodedValue = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .primitiveValueMismatch(at: codingPath, for: type))
        }
        
        return decodedValue
    }
    
    internal func decode(_ type: UInt16.Type) throws -> UInt16 {
        let primitiveValue = try unwrapPrimitiveValue(for: type)
        
        guard let decodedValue = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .primitiveValueMismatch(at: codingPath, for: type))
        }
        
        return decodedValue
    }
    
    internal func decode(_ type: UInt32.Type) throws -> UInt32 {
        let primitiveValue = try unwrapPrimitiveValue(for: type)
        
        guard let decodedValue = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .primitiveValueMismatch(at: codingPath, for: type))
        }
        
        return decodedValue
    }
    
    internal func decode(_ type: UInt64.Type) throws -> UInt64 {
        let primitiveValue = try unwrapPrimitiveValue(for: type)
        
        guard let decodedValue = primitiveValue.decode(type) else {
            throw DecodingError.typeMismatch(type, .primitiveValueMismatch(at: codingPath, for: type))
        }
        
        return decodedValue
    }
    
    internal func decode<Target>(_ type: Target.Type) throws -> Target where Target: Decodable {
        let lowLevelDecoder = LowLevelDecoder(container: .singleValue(self))
        
        return try lowLevelDecoder.decodeWithSpecialTreatment(as: type)
    }
    
    internal func decodeNil() -> Bool {
        value == nil
    }
}

// MARK: - KeyedDecodingContainerProtocol Extension

extension DecodingContainer.SingleValue: KeyedDecodingContainerProtocol {
    // MARK: Internal Instance Interface
    
    internal var allKeys: [StringCodingKey] {
        []
    }
    
    internal func contains(_ key: StringCodingKey) -> Bool {
        false
    }
    
    internal func decode(_ type: Bool.Type, forKey key: StringCodingKey) throws -> Bool {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
    
    internal func decode(_ type: String.Type, forKey key: StringCodingKey) throws -> String {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
    
    internal func decode(_ type: Double.Type, forKey key: StringCodingKey) throws -> Double {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
    
    internal func decode(_ type: Float.Type, forKey key: StringCodingKey) throws -> Float {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
    
    internal func decode(_ type: Int.Type, forKey key: StringCodingKey) throws -> Int {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
    
    internal func decode(_ type: Int8.Type, forKey key: StringCodingKey) throws -> Int8 {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
    
    internal func decode(_ type: Int16.Type, forKey key: StringCodingKey) throws -> Int16 {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
    
    internal func decode(_ type: Int32.Type, forKey key: StringCodingKey) throws -> Int32 {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
    
    internal func decode(_ type: Int64.Type, forKey key: StringCodingKey) throws -> Int64 {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
    
    internal func decode(_ type: UInt.Type, forKey key: StringCodingKey) throws -> UInt {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
    
    internal func decode(_ type: UInt8.Type, forKey key: StringCodingKey) throws -> UInt8 {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
    
    internal func decode(_ type: UInt16.Type, forKey key: StringCodingKey) throws -> UInt16 {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
    
    internal func decode(_ type: UInt32.Type, forKey key: StringCodingKey) throws -> UInt32 {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
    
    internal func decode(_ type: UInt64.Type, forKey key: StringCodingKey) throws -> UInt64 {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
    
    internal func decode<T>(_ type: T.Type, forKey key: StringCodingKey) throws -> T where T : Decodable {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
    
    internal func decodeNil(forKey key: StringCodingKey) throws -> Bool {
        true
    }
    
    internal func nestedContainer<NestedKey>(
        keyedBy type: NestedKey.Type,
        forKey key: StringCodingKey
    ) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
    
    internal func nestedUnkeyedContainer(forKey key: StringCodingKey) throws -> UnkeyedDecodingContainer {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
    
    internal func superDecoder() throws -> Decoder {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
    
    internal func superDecoder(forKey key: StringCodingKey) throws -> Decoder {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
}

// MARK: - UnkeyedDecodingContainer Extension

extension DecodingContainer.SingleValue: UnkeyedDecodingContainer {
    // MARK: Internal Instance Interface
    
    internal var count: Int? {
        value == nil ? 0 : 1
    }
    
    internal var isAtEnd: Bool {
        true
    }
    
    internal var currentIndex: Int {
        0
    }
    
    internal func nestedContainer<NestedKey>(
        keyedBy type: NestedKey.Type
    ) throws -> KeyedDecodingContainer<NestedKey> where NestedKey: CodingKey {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
    
    internal func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        throw DecodingError.dataCorrupted(.singleValueContainerCanOnlyActAsEmptyKeyedContainer(at: codingPath))
    }
}
