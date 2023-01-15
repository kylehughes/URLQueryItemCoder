//
//  ContainerStorage.swift
//  Common
//
//  Created by Kyle Hughes on 1/15/23.
//

public enum ContainerStorage {
    case keyedValue(Reference<[String: ContainerStorage]>)
    case singleValue(Reference<PrimitiveContainerValue>)
    case unkeyedValue(Reference<[ContainerStorage]>)
}
