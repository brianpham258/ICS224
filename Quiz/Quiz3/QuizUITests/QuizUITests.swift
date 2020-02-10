//
//  QuizUITests.swift
//  QuizUITests
//
//  Created by Test Account on 2020-01-14.
//  Copyright © 2020 Test Account. All rights reserved.
//

import XCTest

class QuizUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    // MARK: Question 1

    func test123Main() {
        let app = XCUIApplication()
        app.launch()
        
        let userText = app.textFields["userText"]
        userText.tap()
        userText.typeText("123 Main Street")
        
        let label = app.staticTexts["digitLabel"]
        XCTAssertEqual("3 digits", label.label)
    }
    
    func testMain() {
        let app = XCUIApplication()
        app.launch()
        
        let userText = app.textFields["userText"]
        userText.tap()
        userText.typeText("Main Street")
        
        let label = app.staticTexts["digitLabel"]
        XCTAssertEqual("0 digits", label.label)
    }

    func testBlank() {
        let app = XCUIApplication()
        app.launch()
        
        let userText = app.textFields["userText"]
        userText.tap()
        userText.typeText(" ")
        
        let label = app.staticTexts["digitLabel"]
        XCTAssertEqual("0 digits", label.label)
    }

    func testNumberGroups() {
        let app = XCUIApplication()
        app.launch()
        
        let userText = app.textFields["userText"]
        userText.tap()
        userText.typeText("There were 10 ducks on the farm, swimming in 2 ponds.  The 1st pond had an average depth of 10m, the 2nd an average depth of 2.75 metres")
        
        let label = app.staticTexts["digitLabel"]
        XCTAssertEqual("10 digits", label.label)
    }

}
