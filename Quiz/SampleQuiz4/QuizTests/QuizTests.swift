//
//  QuizTests.swift
//  QuizTests
//
//  Created by Test Account on 2020-01-14.
//  Copyright © 2020 Test Account. All rights reserved.
//

import XCTest
@testable import Quiz

class QuizTests: XCTestCase {
    
    var q = Quiz()
 
    // MARK: Question 1
    
    func testQ1WithTwoLowest() {
        XCTAssertEqual(["10", "10", "8", "5", "dropped", "1", "0", "10", "9", "7", "8"], q.dropFirstTwoLowest(list: [10, 10, 8, 5, 0, 1, 0, 10, 9, 7, 8]))
    }

    func testQ1WithEmpty() {
        XCTAssertEqual([String](), q.dropFirstTwoLowest(list: [UInt]()))
    }
    
    func testQ1WithOneNumber() {
        XCTAssertEqual(["dropped"], q.dropFirstTwoLowest(list: [10]))
    }

    // MARK: Question 2
    
    func testQ2WithTwoLowest() {
        XCTAssertEqual(["10", "10", "8", "5", "dropped", "1", "dropped", "10", "9", "7", "8"], q.dropAllLowest(list: [10, 10, 8, 5, 0, 1, 0, 10, 9, 7, 8]))
    }

    func testQ2WithEmpty() {
        XCTAssertEqual([String](), q.dropAllLowest(list: [UInt]()))
    }
    
    func testQ2WithOneNumber() {
        XCTAssertEqual(["dropped"], q.dropAllLowest(list: [10]))
    }

    // MARK: Question 3
    
    func testQ3WithTwoLowest() {
        XCTAssertEqual(["20", "20", "16", "10", "0", "2", "0", "20", "18", "14", "16"], q.convertAll(list: [10, 10, 8, 5, 0, 1, 0, 10, 9, 7, 8], closure: { num -> String in String(num &* 2) }))
    }

    func testQ3WithEmpty() {
        XCTAssertEqual([String](), q.convertAll(list: [], closure: { num -> String in String(num &* 2) }))
    }
    
    func testQ3WithOneNumber() {
        XCTAssertEqual(["20"], q.convertAll(list: [10], closure: { num -> String in String(num &* 2) }))
    }
}
