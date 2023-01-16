//
//  ContainerStorage.swift
//  Common
//
//  Created by Kyle Hughes on 1/15/23.
//

public enum ContainerStorage {
    case keyedValue(Reference<[String: ContainerStorage]>)
    case singleValue(Reference<SingleValue?>)
    case unkeyedValue(Reference<[ContainerStorage]>)
    
    public static func singleValue(_ value: SingleValue?) -> Self {
        .singleValue(Reference(value))
    }
}

extension ContainerStorage {
    public enum SingleValue {
        case container(ContainerStorage)
        case primitive(PrimitiveContainerValue)
    }
}

public enum Container<Single, Keyed, Unkeyed> {
    case keyed(Keyed)
    case single(Single)
    case unkeyed(Unkeyed)
}
