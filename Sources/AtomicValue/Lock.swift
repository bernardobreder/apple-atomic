//
//  Lock.swift
//  AtomicValue
//
//  Created by Bernardo Breder on 13/12/16.
//
//

import Foundation

open class Lock {
    
    internal var mutex = pthread_mutex_t()
    
    public init() {
        pthread_mutex_init(&mutex, nil)
    }
    
    deinit {
        pthread_mutex_destroy(&mutex)
    }

    public func lock() {
        pthread_mutex_lock(&mutex)
    }
    
    public func trylock() {
        pthread_mutex_trylock(&mutex)
    }
    
    public func unlock() {
        pthread_mutex_unlock(&mutex)
    }
    
    @discardableResult
    public func lock<T>(_ callback: () -> T) -> T {
        pthread_mutex_lock(&mutex)
        defer { pthread_mutex_unlock(&mutex) }
        return callback()
    }
    
}
