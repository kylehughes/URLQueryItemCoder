//
//  Reference.swift
//  Common
//
//  Created by Kyle Hughes on 1/15/23.
//

public class Reference<Value> {
    internal var value: Value
    
    // MARK: Internal Initialization
    
    init(value: Value) {
        self.value = value
    }
}
