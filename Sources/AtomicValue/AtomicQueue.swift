//
//  AtomicQueue.swift
//  AtomicValue
//
//  Created by Bernardo Breder on 10/02/17.
//
//

import Foundation

open class AtomicQueue<K>: AtomicValue {
    
    private var array: [K]
    
    public init(_ array: [K] = []) {
        self.array = array
    }
    
    public func offer(_ value: K) {
        set { array.append(value) }
    }
    
    public func poll() {
        set { array.removeFirst() }
    }
    
    public func peek() -> K? {
        return get { array.first }
    }
    
}
