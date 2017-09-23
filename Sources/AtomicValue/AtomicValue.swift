//
//  AtomicValue.swift
//  server
//
//  Created by Bernardo Breder on 04/12/16.
//  Copyright © 2016 Breder Company. All rights reserved.
//

import Foundation

open class AtomicValue {
    
    var lock = Lock()
    
    public func set(_ callback: () -> Void) {
        lock.lock()
        defer { lock.unlock() }
        callback()
    }
    
    public func get<E>(_ callback: () -> E) -> E {
        lock.lock()
        defer { lock.unlock() }
        return callback()
    }
    
}
