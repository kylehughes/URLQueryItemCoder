//
//  Container.swift
//  Common
//
//  Created by Kyle Hughes on 1/15/23.
//

public enum Container<Representation> where Representation: PrimitiveValueRepresentation {
    case keyed(Keyed)
    case singleValue(SingleValue)
    case unkeyed(Unkeyed)
}
