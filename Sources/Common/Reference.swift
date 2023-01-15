//
//  Reference.swift
//  Common
//
//  Created by Kyle Hughes on 1/15/23.
//

public class Reference<Value> {
    public typealias Getter = () -> Value
    public typealias Setter = (Value) -> Void
    
    private let getter: Getter
    private let setter: Setter
    
    // MARK: Public Initialization
    
    public convenience init(_ value: Value) {
        var value = value
        
        self.init {
            value
        } setter: {
            value = $0
        }
    }
    
    public init(getter: @escaping Getter, setter: @escaping Setter) {
        self.getter = getter
        self.setter = setter
    }
    
    // MARK: Public Instance Interface
    
    public var value: Value {
        get {
            getter()
        }
        set {
            setter(newValue)
        }
    }
    
    public func scoped<NewValue>(
        getter: @escaping (Value) -> NewValue,
        setter: @escaping (NewValue) -> Value
    ) -> Reference<NewValue> {
        Reference<NewValue> {
            getter(self.getter())
        } setter: {
            self.setter(setter($0))
        }
    }
}
