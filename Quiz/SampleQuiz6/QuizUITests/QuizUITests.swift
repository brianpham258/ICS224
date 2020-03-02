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

    // MARK: This is not the test file you are looking for...
    
    func testFilter() {
        let app = XCUIApplication()
        app.launch()
        
        let textView = app.textViews["textView"]
        textView.tap()
        textView.typeText("This. is. a. test!\n123 Testing 123\n\nDone!")
        XCTAssertEqual("This. is. a. test!\n123 Testing 123\n\nDone!", textView.value as? String)
        
        let filterButton = app.buttons["filterButton"]
        filterButton.tap()
        XCTAssertEqual("This is a test\n123 Testing 123\n\nDone", textView.value as? String)
    }

    func testSaveAndLoad() {
        let app = XCUIApplication()
        app.launch()

        let textView = app.textViews["textView"]
        textView.tap()
        textView.typeText("Testing saving\nand loading\n")
        
        let textField = app.textFields["fileNameField"]
        textField.tap()
        textField.typeText("test123")

        let saveButton = app.buttons["saveButton"]
        saveButton.tap()
        XCTAssertEqual("Testing saving\nand loading\n", textView.value as? String)

        textView.tap()
        let deleteKey = app.keys["delete"] // If this fails, did you forget to disconnect the hardware keyboard?
        textView.doubleTap()
        deleteKey.tap()
        XCTAssertEqual("saving\nand loading\n", textView.value as? String)
        
        let loadButton = app.buttons["loadButton"]
        loadButton.tap()
        XCTAssertEqual("Testing saving\nand loading\n", textView.value as? String)
    }

    func testInvalidLoad() {
        let app = XCUIApplication()
        app.launch()

        let textView = app.textViews["textView"]
        
        let textField = app.textFields["fileNameField"]
        textField.tap()
        for key in "nosuchfile" {
            app.keys[String(key)].tap() // If this fails, did you forget to disconnect the hardware keyboard?
        }

        let loadButton = app.buttons["loadButton"]
        loadButton.tap()
        XCTAssertEqual("", textView.value as? String)
    }

    
    func testInvalidSave() {
        let app = XCUIApplication()
        app.launch()

        let textView = app.textViews["textView"]
        textView.tap()
        textView.typeText("Testing")
        
        let textField = app.textFields["fileNameField"]
        textField.tap()
        textField.typeText("test 123")

        let saveButton = app.buttons["saveButton"]
        saveButton.tap()

        textView.tap()
        let deleteKey = app.keys["delete"] // If this fails, did you forget to disconnect the hardware keyboard?
        textView.doubleTap()
        deleteKey.tap()
        XCTAssertEqual("", textView.value as? String)
        
        let loadButton = app.buttons["loadButton"]
        loadButton.tap()
        XCTAssertEqual("", textView.value as? String)
    }
}
