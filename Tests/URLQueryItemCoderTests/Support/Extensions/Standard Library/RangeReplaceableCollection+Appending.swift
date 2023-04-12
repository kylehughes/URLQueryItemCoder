//
//  RangeReplaceableCollection+Appending.swift
//  URLQueryItemCoder
//
//  Created by Kyle Hughes on 12/27/22.
//

extension RangeReplaceableCollection {
    // MARK: Public Instance Interface
    
    public func appending(_ element: Element) -> Self {
        var copy = self
        copy.append(element)
        
        return copy
    }
}
