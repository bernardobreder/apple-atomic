//
//  AtomicValueTests.swift
//  AtomicValue
//
//  Created by Bernardo Breder.
//
//

import XCTest
@testable import AtomicValueTests

extension LockTests {

	static var allTests : [(String, (LockTests) -> () throws -> Void)] {
		return [
			("testAtomicBool", testAtomicBool),
			("testLock", testLock),
		]
	}

}

XCTMain([
	testCase(LockTests.allTests),
])

