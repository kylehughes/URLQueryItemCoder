//
//  RangeReplaceableCollection+Appending.swift
//  APIClient
//
//  Created by Kyle Hughes on 12/27/22.
//

extension RangeReplaceableCollection {
    // MARK: Internal Instance Interface
    
    internal func appending(_ element: Element) -> Self {
        var copy = self
        copy.append(element)
        
        return copy
    }
}
