//
//  AtomicArray.swift
//  server
//
//  Created by Bernardo Breder on 04/12/16.
//  Copyright © 2016 Breder Company. All rights reserved.
//

import Foundation

open class AtomicArray<K>: AtomicValue {
    
    private var value: [K]
    
    public init(_ value: [K] = []) {
        self.value = value
    }
    
    public func removeFirst() {
        set { value.removeFirst() }
    }
    
    public func removeLast() {
        set { value.removeLast() }
    }
    
    public func remove(at: Int) {
        set { value.remove(at: at) }
    }
    
    public func append(_ element: K) {
        set { value.append(element) }
    }
    
    public func append(_ values: [K]) {
        set { values.forEach { e in self.value.append(e) } }
    }
    
    public func get(index: Int) -> K {
        return get { self.value[index] }
    }
    
    public func gets(indexs: [Int]) -> [K] {
        return get { indexs.map { i in return self.value[i] } }
    }
    
    public func gets() -> [K] {
        return get { value.map {$0} }
    }
    
}
