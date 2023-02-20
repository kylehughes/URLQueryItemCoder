//
//  EncodingContainer.swift
//  Common
//
//  Created by Kyle Hughes on 1/15/23.
//

public enum EncodingContainer {
    case keyed(Keyed)
    case singleValue(SingleValue)
    case unkeyed(Unkeyed)
}
