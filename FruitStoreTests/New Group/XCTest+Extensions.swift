//
//  XCTest+Extensions.swift
//  FruitStoreTests
//
//  Created by Kleyton Lopes on 20/09/21.
//

import Foundation
import XCTest
extension XCTestCase {
    func checkMemoryLeak(for instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, file: file, line: line)
        }
    }
}
