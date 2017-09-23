//
//  AtomicSet.swift
//  server
//
//  Created by Bernardo Breder on 04/12/16.
//  Copyright © 2016 Breder Company. All rights reserved.
//

import Foundation

open class AtomicSet<K: Hashable>: AtomicValue {
    
    private var value: [K:K] = [:]
    
    public init(_ value: [K] = []) {
        super.init()
        value.forEach({ e in self.value[e] = e })
    }
    
    public func set(_ values: [K]) {
        set({ values.forEach({ e in self.value[e] = e }) })
    }
    
    public func get(key: K) -> K? {
        return get({ self.value[key] })
    }
    
    public func has(key: K) -> Bool {
        return get({ self.value[key] == key })
    }
    
    public func gets(keys: [K]) -> [K?] {
        return get({ keys.map({ e in return self.value[e] }) })
    }
    
    public func testAndSet(key: K) -> Bool {
        return get({
            if let _ = self.value[key] {
                return false
            } else {
                self.value[key] = key
                return true
            }
        })
    }
    
}
