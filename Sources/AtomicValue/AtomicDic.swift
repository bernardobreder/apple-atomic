//
//  AtomicDic.swift
//  server
//
//  Created by Bernardo Breder on 04/12/16.
//  Copyright © 2016 Breder Company. All rights reserved.
//

import Foundation

open class AtomicDic<K: Hashable,V: Equatable>: AtomicValue {
    
    private var value: [K:V]
    
    public init(_ value: [K:V] = [:]) {
        self.value = value
    }
    
    public func set(_ values: [K:V]) {
        set { values.forEach {key, value in self.value[key] = value } }
    }
    
    public func get(key: K) -> V? {
        return get { self.value[key] }
    }
    
    public func has(key: K) -> Bool {
        return get { self.value[key] != nil }
    }
    
    public func has(value: V) -> Bool {
        return get { self.value.contains { e in value == e.value } }
    }
    
    public func gets(keys: [K]) -> [V?] {
        return get { keys.map { e in return self.value[e] } }
    }
    
    public func testKeyAndSet(key: K, value: V) -> Bool {
        return get({
            if let _ = self.value[key] {
                return false
            } else {
                self.value[key] = value
                return true
            }
        })
    }
    
    public func testValueAndSet(key: K, value: V) -> Bool {
        return get {
            if self.value.contains(where: { e in value == e.value }) {
                return false
            } else {
                self.value[key] = value
                return true
            }
        }
    }
    
}
