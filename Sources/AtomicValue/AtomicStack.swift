//
//  AtomicStack.swift
//  AtomicValue
//
//  Created by Bernardo Breder on 10/02/17.
//
//

import Foundation

open class AtomicStack<K>: AtomicValue {
    
    private var array: [K]
    
    public init(_ array: [K] = []) {
        self.array = array
    }
    
    public func push(_ value: K) {
        set { array.append(value) }
    }
    
    public func pop() -> K? {
        return get { return array.isEmpty ? nil : array.removeLast() }
    }
    
    public func peek() -> K? {
        return get { array.first }
    }
    
}
