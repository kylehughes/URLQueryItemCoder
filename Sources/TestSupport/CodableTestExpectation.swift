//
//  CodableTestExpectation.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 1/12/23.
//

public struct CodableTestExpectation<Value> {
    public typealias Expectation<Other> = (Other?) -> Value
    
    public let boolExpectation: Expectation<Bool>
    public let doubleExpectation: Expectation<Double>
    public let floatExpectation: Expectation<Float>
    public let intExpectation: Expectation<Int>
    public let int8Expectation: Expectation<Int8>
    public let int16Expectation: Expectation<Int16>
    public let int32Expectation: Expectation<Int32>
    public let int64Expectation: Expectation<Int64>
    public let nilExpectation: Expectation<String?>
    public let stringExpectation: Expectation<String>
    public let uintExpectation: Expectation<UInt>
    public let uint8Expectation: Expectation<UInt8>
    public let uint16Expectation: Expectation<UInt16>
    public let uint32Expectation: Expectation<UInt32>
    public let uint64Expectation: Expectation<UInt64>
    
    public let keyedSingleValueExpectation: Expectation<CodableTestTypes.SingleValueProperties>
    public let unkeyedSingleValueExpectation: Expectation<CodableTestTypes.UnkeyedValueProperties>
    public let keyedKeyedValueExpectation: (
        CodableTestTypes.OmniValueProperties,
        Expectation<CodableTestTypes.SingleValueProperties>,
        Expectation<CodableTestTypes.UnkeyedValueProperties>
    ) -> Value
    
    // MARK: Public Initialization
    
    public init(
        boolExpectation: @escaping Expectation<Bool>,
        doubleExpectation: @escaping Expectation<Double>,
        floatExpectation: @escaping Expectation<Float>,
        intExpectation: @escaping Expectation<Int>,
        int8Expectation: @escaping Expectation<Int8>,
        int16Expectation: @escaping Expectation<Int16>,
        int32Expectation: @escaping Expectation<Int32>,
        int64Expectation: @escaping Expectation<Int64>,
        nilExpectation: @escaping Expectation<String?>,
        stringExpectation: @escaping Expectation<String>,
        uintExpectation: @escaping Expectation<UInt>,
        uint8Expectation: @escaping Expectation<UInt8>,
        uint16Expectation: @escaping Expectation<UInt16>,
        uint32Expectation: @escaping Expectation<UInt32>,
        uint64Expectation: @escaping Expectation<UInt64>,
        keyedSingleValueExpectation: @escaping Expectation<CodableTestTypes.SingleValueProperties>,
        unkeyedSingleValueExpectation: @escaping Expectation<CodableTestTypes.UnkeyedValueProperties>,
        keyedKeyedValueExpectation: @escaping (
            CodableTestTypes.OmniValueProperties,
            Expectation<CodableTestTypes.SingleValueProperties>,
            Expectation<CodableTestTypes.UnkeyedValueProperties>
        ) -> Value
    ) {
        self.boolExpectation = boolExpectation
        self.doubleExpectation = doubleExpectation
        self.floatExpectation = floatExpectation
        self.intExpectation = intExpectation
        self.int8Expectation = int8Expectation
        self.int16Expectation = int16Expectation
        self.int32Expectation = int32Expectation
        self.int64Expectation = int64Expectation
        self.nilExpectation = nilExpectation
        self.stringExpectation = stringExpectation
        self.uintExpectation = uintExpectation
        self.uint8Expectation = uint8Expectation
        self.uint16Expectation = uint16Expectation
        self.uint32Expectation = uint32Expectation
        self.uint64Expectation = uint64Expectation
        self.keyedSingleValueExpectation = keyedSingleValueExpectation
        self.unkeyedSingleValueExpectation = unkeyedSingleValueExpectation
        self.keyedKeyedValueExpectation = keyedKeyedValueExpectation
    }
}
