//
//  AtomicInt.swift
//  server
//
//  Created by Bernardo Breder on 04/12/16.
//  Copyright © 2016 Breder Company. All rights reserved.
//

import Foundation

open class AtomicInt: AtomicValue {
    
    private var value: Int
    
    public init(_ value: Int = 0) {
        self.value = value
    }
    
    public func set(_ value: Int) {
        set({ self.value = value })
    }
    
    @discardableResult
    public func testset(expected: Int, change: Int) -> Int{
        return get({
            if value == expected {
                value = change
            }
            return value
        })
    }

    @discardableResult
    public func inc(_ count: Int = 1) -> Int {
        return get({
            self.value = value + count
            return value
        })
    }
    
    @discardableResult
    public func dec(_ count: Int = 1) -> Int {
        return get({
            self.value = value - count
            return value
        })
    }
    
    public func get() -> Int {
        return get({ value })
    }
    
    public func positiveDec() -> Bool {
        return get({
            if value > 0 {
                value -= 1
                return true
            }
            return false
        })
    }
    
}
