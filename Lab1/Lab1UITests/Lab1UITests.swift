//
//  Lab1UITests.swift
//  Lab1UITests
//
//  Created by QuangPham on 2020-01-12.
//  Copyright © 2020 ics057. All rights reserved.
//

import XCTest

class Lab1UITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func test10() { // Test input 10
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let num = "10"
        
        app.textFields["initialValueTextField"].tap() // Enable the NumPad
        
        for i in num {
            app.keys[String(i)].tap() // Loop through the string and tap the number
        }
        
        app.buttons["countButton"].tap() // Press the Push button
        
        XCTAssertEqual(app.staticTexts["countLabel"].label, "11") // Check if the result is equal to 11 or not
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSwitch() { // Test Switch button and its capability
        let app = XCUIApplication()
        app.launch()
        
        app.switches["countSwitch"].tap() // Tap the Switch to disable the Push button
        app.buttons["countButton"].tap() // Press the Push button
        app.switches["countSwitch"].tap() // Tap the Switch to enable the Push button
        app.buttons["countButton"].tap() // Press the Push button
        
        XCTAssertEqual(app.staticTexts["countLabel"].label, "1") // Check if the result is equal to 1 or not
    }
    
    func testPush() { // Test pressing Push button
        let app = XCUIApplication()
        app.launch()
        
        for i in 0..<5 { // Press the Push button 5 times
            app.buttons["countButton"].tap()
        }
        
        XCTAssertEqual(app.staticTexts["countLabel"].label, "5") // Check if the result is equal to 5 or not
    }
    
    func testOverflow() { // Test overflow
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["initialValueTextField"].tap() // Enable the NumPad
        
        let num = "9223372036854775807"
        for i in num { // Loop through the string and tap each number that is in the string
            app.keys[String(i)].tap()
        }
        
        app.buttons["countButton"].tap() // Press the Push button
        
        XCTAssertEqual(app.staticTexts["countLabel"].label, "1") // Check if the result is equal to 1 or not
    }
    
    func test007() { // Test first input is 0
        let app = XCUIApplication()
        app.launch()
        
        let num = "007"
        
        app.textFields["initialValueTextField"].tap() // Enable the NumPad
        
        for i in num { // Loop through the string and tap each number that is in the string
            app.keys[String(i)].tap()
        }
        
        app.buttons["countButton"].tap() // Press the Push button
        
        XCTAssertEqual(app.staticTexts["countLabel"].label, "8") // Check if the result is equal to 8 or not
    }
}
