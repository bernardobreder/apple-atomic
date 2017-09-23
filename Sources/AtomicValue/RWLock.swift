//
//  RWLock.swift
//  AtomicValue
//
//  Created by Bernardo Breder on 19/12/16.
//
//

import Foundation

open class RWLock {
    
    var mutex = pthread_rwlock_t()
    
    public init() {
        pthread_rwlock_init(&mutex, nil)
    }
    
    deinit {
        pthread_rwlock_destroy(&mutex)
    }
    
    public func readLock() {
        pthread_rwlock_rdlock(&mutex)
    }
    
    public func tryReadLock() {
        pthread_rwlock_tryrdlock(&mutex)
    }
    
    public func writeLock() {
        pthread_rwlock_wrlock(&mutex)
    }
    
    public func tryWriteLock() {
        pthread_rwlock_trywrlock(&mutex)
    }
    
    public func unlock() {
        pthread_rwlock_unlock(&mutex)
    }
    
}
