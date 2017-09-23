import XCTest
@testable import AtomicValue

class LockTests: XCTestCase {
    
    func testLock() throws {
        let lock = Lock()
        lock.lock()
        lock.unlock()
    }
    
    func testAtomicBool() throws {
        let value = AtomicBool()
        value.set(true)
    }
    
}
