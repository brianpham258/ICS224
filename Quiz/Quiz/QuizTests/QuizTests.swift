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

    func testQ1With124() {
        XCTAssertEqual(true, q.evenNumber(s: "124"))
    }

    func testQ1With123() {
        XCTAssertEqual(false, q.evenNumber(s: "123"))
    }

    func testQ1WithHello() {
        XCTAssertEqual(false, q.evenNumber(s: "Hello"))
    }

    func testQ1WithNil() {
        XCTAssertEqual(false, q.evenNumber(s: nil))
    }

    // MARK: Question 2

    func testQ2WithABCPlusMinus() {
        XCTAssertEqual("A+A-B+B-C+C-", q.combine(left: "ABC", right: "+-"))
    }

    func testQ2WithAOZ() {
        XCTAssertEqual("AOAZ", q.combine(left: "A", right: "OZ"))
    }

    func testQ2WithBlankOZ() {
        XCTAssertEqual("OZ", q.combine(left: "", right: "OZ"))
    }

    func testQ2WithABCBlank() {
        XCTAssertEqual("ABC", q.combine(left: "ABC", right: ""))
    }

}
