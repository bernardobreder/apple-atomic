//
//  AtomicBoolean.swift
//  server
//
//  Created by Bernardo Breder on 04/12/16.
//  Copyright © 2016 Breder Company. All rights reserved.
//

import Foundation

open class AtomicBool: AtomicValue {
    
    private var value: Bool
    
    public init(_ value: Bool = false) {
        self.value = value
    }
    
    public func set(_ value: Bool) {
        set({ self.value = value })
    }
    
    public func get() -> Bool {
        return get({ value })
    }
    
}
