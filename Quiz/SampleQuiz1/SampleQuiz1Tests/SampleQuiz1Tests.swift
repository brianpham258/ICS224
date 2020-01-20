//
//  SampleQuiz1Tests.swift
//  SampleQuiz1Tests
//
//  Created by Michael Horie on 2020-01-11.
//  Copyright © 2020 Michael Horie. All rights reserved.
//

import XCTest
@testable import SampleQuiz1

class SampleQuiz1Tests: XCTestCase {

    var s = SampleQuiz1()
    
    // MARK: Question 1
    
    func testConvert224ToInt() {
        XCTAssertEqual(224, s.convertToInt(s: "224"))
    }

    func testConvertMinus10ToInt() {
        XCTAssertEqual(-10, s.convertToInt(s: "-10"))
    }

    func testConvertHelloToInt() {
        XCTAssertEqual(0, s.convertToInt(s: "Hello"))
    }

    func testConvertEmptyStringToInt() {
        XCTAssertEqual(0, s.convertToInt(s: ""))
    }

    // MARK: Question 2
    
    func testAdd5And10() {
        XCTAssertEqual(15.0, s.add(d: 5.0, i: 10))
    }

    func testAdd100AndMinus50() {
        XCTAssertEqual(50.0, s.add(d: 100.0, i: -50))
    }

    // MARK: Question 3
    
    func testRemoveEvery7thCharacter() {
        XCTAssertEqual("HelloWrldHowreYouDing?", s.remove(s: "HelloWorldHowAreYouDoing?", u: 7))
    }

    func testRemoveEvery2ndCharacter() {
        XCTAssertEqual("HloolHwrYuon?", s.remove(s: "HelloWorldHowAreYouDoing?", u: 2))
    }

    func testRemoveEveryCharacter() {
        XCTAssertEqual("", s.remove(s: "HelloWorldHowAreYouDoing?", u: 1))
    }

    func testRemoveNoCharacter() {
        XCTAssertEqual("HelloWorldHowAreYouDoing?", s.remove(s: "HelloWorldHowAreYouDoing?", u: 0))
    }

    // MARK: Question 4

    func testDerive5MultiplesOf10() {
        XCTAssertEqual("10 20 30 40 50", s.deriveMultiples(i: 10, u: 5))
    }
    
    func testDerive0MultiplesOf10() {
        XCTAssertEqual("", s.deriveMultiples(i: 10, u: 0))
    }
    
    func testDerive10MultiplesOfMinus10() {
        XCTAssertEqual("-10 -20 -30 -40 -50 -60 -70 -80 -90 -100", s.deriveMultiples(i: -10, u: 10))
    }

    func testDerive100MultiplesOfMinus10() {
        XCTAssertEqual("-10 -20 -30 -40 -50 -60 -70 -80 -90 -100", s.deriveMultiples(i: -10, u: 10))
    }

    func testDerive2MultiplesOfMaxInt() {
        XCTAssertEqual(String(Int.max) + " " + String(2 &* Int.max), s.deriveMultiples(i: Int.max, u: 2))
    }
}
