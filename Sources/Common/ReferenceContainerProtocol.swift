//
//  ReferenceContainerProtocol.swift
//  Common
//
//  Created by Kyle Hughes on 1/14/23.
//

import Foundation

public protocol ReferenceContainerProtocol {
    // MARK: Initialization
    
    init()
    init(from output: [URLQueryItem])
    
    // MARK: Instance Interface
    
    var allStringKeys: [String] { get }
    var count: Int { get }
    
    func contains(_ codingPath: [any CodingKey]) -> Bool
    func decode(_ codingPath: [any CodingKey]) throws -> String
    func encode(_ codingPath: [any CodingKey], as value: String?)
    func finalize() -> [URLQueryItem]
    func isNil(for codingPath: [any CodingKey]) -> Bool
    func scoped(to codingPath: [any CodingKey]) -> any ReferenceContainerProtocol
}

extension ReferenceContainerProtocol {
    public func decodeLosslessly<Target>(
        _ codingPath: [any CodingKey]
    ) throws -> Target where Target: LosslessStringConvertible {
        let stringValue = try decode(codingPath)
        
        guard let value = Target(stringValue) else {
            throw DecodingError.typeMismatch(
                Target.self,
                DecodingError.Context(codingPath: codingPath, debugDescription: "Couldn't decode from string.")
            )
        }
        
        return value
    }
    
    public func encodeLosslessly(_ codingPath: [any CodingKey], as value: (some LosslessStringConvertible)?) {
        guard let value else {
            encode(codingPath, as: nil)
            return
        }
        
        encode(codingPath, as: String(value))
    }
}
