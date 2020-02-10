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
    
    func testQ1Reverse() {
        XCTAssertEqual(["olleH", "dlroW", "woH", "erA", "uoY"], q.filterList(list: ["Hello", "World", "How", "Are", "You"], filter: { (entry) -> String in return String(entry.reversed()) }))
    }
    
    func testQ1Empty() {
        XCTAssertEqual([String](), q.filterList(list: [String](), filter: { (entry) -> String in return String(entry.reversed()) }))
    }
    
    // MARK: Question 2
    
    func testQ2SmallList() {
        XCTAssertEqual([0, 2, 4, 6, 7, 7], q.ascending(list: [0, 2, 4, 6, 4, 7, 7]))
    }
    
    func testQ2MediumList() {
        XCTAssertEqual([0, 3, 5, 9, 10, 12, 15], q.ascending(list: [0, 3, 5, 4, 3, 4, 9, 10, 4, 12, 15, 7]))
    }
    
    func testQ2EmptyList() {
        XCTAssertEqual([Int](), q.ascending(list: [Int]()))
    }
    
    func testQ2SingleElementList() {
        XCTAssertEqual([1], q.ascending(list: [1]))
    }

    func testQ2AscendingTwoElementList() {
        XCTAssertEqual([1, 5], q.ascending(list: [1, 5]))
    }
    
    func testQ2DescendingTwoElementList() {
        XCTAssertEqual([1], q.ascending(list: [1, 0]))
    }

    func testQ2CheckThreeElementList() {
        XCTAssertEqual([7, 10], q.ascending(list: [7, 5, 10]))
    }
    
    func testQ2ReverseCheckThreeElementList() {
        XCTAssertEqual([10], q.ascending(list: [10, 5, 7]))
    }
}
