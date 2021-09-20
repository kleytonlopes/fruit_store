//
//  FruitStoreUITests.swift
//  FruitStoreUITests
//
//  Created by Kleyton Lopes on 16/09/21.
//

import XCTest

class FruitStoreUITests: XCTestCase {

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
