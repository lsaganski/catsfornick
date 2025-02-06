//
//  CatsForNickUITests.swift
//  CatsForNickUITests
//
//  Created by Leonardo Saganski on 06/02/25.
//

import XCTest

final class CatsForNickUITests: XCTestCase {
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        let list: XCUIElement = app.collectionViews[Constants.Testing.catList]
        if list.waitForExistence(timeout: 10.0) {
            let cell = list.cells.element (boundBy: 0)
            cell.tap()
            let description: XCUIElement = app.staticTexts[Constants.Testing.description]
            if description.waitForExistence(timeout: 5.0) {
                XCTAssertTrue(description.exists)
                XCTAssertTrue(!description.label.isEmpty)
            } else {
                XCTFail("There's no Description! Or the Details popup didn't appear.")
            }
        } else {
            XCTFail("There's no Cats List!")
        }
    }
}
