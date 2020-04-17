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
    
    func testFilter() {
        let app = XCUIApplication()
        app.launch()
        
        let inputField = app.textFields["inputField"]
        inputField.tap()
        inputField.typeText("Hello World")
        
        let outputField = app.textFields["outputField"]
        XCTAssertEqual("Hello World", outputField.value as? String)
        
        let filterField = app.textFields["filterField"]
        filterField.tap()
        filterField.typeText("lWeH")
        XCTAssertEqual("o ord", outputField.value as? String)
    }

    func testFilterWithNoInput() {
        let app = XCUIApplication()
        app.launch()
        
        let inputField = app.textFields["inputField"]
        inputField.tap()
        inputField.typeText("")
        
        let outputField = app.textFields["outputField"]
        XCTAssertEqual("Output Field", outputField.value as? String)
        
        let filterField = app.textFields["filterField"]
        filterField.tap()
        filterField.typeText("This is a test")
        XCTAssertEqual("Output Field", outputField.value as? String)
    }

    func testFilterWithCompleteMatch() {
        let app = XCUIApplication()
        app.launch()
        
        let inputField = app.textFields["inputField"]
        inputField.tap()
        inputField.typeText("This is a test")
        
        let outputField = app.textFields["outputField"]
        XCTAssertEqual("This is a test", outputField.value as? String)

        let filterField = app.textFields["filterField"]
        filterField.tap()
        filterField.typeText("hiTtaes ")
        XCTAssertEqual("Output Field", outputField.value as? String)
    }

    func testSaveAndLoad() {
        let app = XCUIApplication()
        app.launch()
        
        let inputField = app.textFields["inputField"]
        inputField.tap()
        inputField.typeText("HelloWorld")
        
        let outputField = app.textFields["outputField"]
        XCTAssertEqual("HelloWorld", outputField.value as? String)
        
        let filterField = app.textFields["filterField"]
        filterField.tap()
        filterField.typeText("l")
        XCTAssertEqual("HeoWord", outputField.value as? String)

        let saveButton = app.buttons["saveButton"]
        saveButton.tap()
        XCTAssertEqual("HeoWord", outputField.value as? String)

        inputField.doubleTap()
        let deleteKey = app.keys["delete"] // If this fails, did you forget to disconnect the hardware keyboard?
        deleteKey.tap()
        inputField.typeText("Testing123")

        filterField.doubleTap()
        deleteKey.tap()
        filterField.typeText("123")
        
        XCTAssertEqual("Testing", outputField.value as? String)

        let loadButton = app.buttons["loadButton"]
        loadButton.tap()
        XCTAssertEqual("HelloWorld", inputField.value as? String)
        XCTAssertEqual("l", filterField.value as? String)
        XCTAssertEqual("HeoWord", outputField.value as? String)
    }

}
