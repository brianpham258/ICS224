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
    
    func testQ1WithEmptyString() {
        XCTAssertEqual(0, try? q.sumOf(string: ""))
    }

    func testQ1WithSingleNumber() {
        XCTAssertEqual(1, try? q.sumOf(string: "1"))
    }

    func testQ1WithTwoNumbers() {
        XCTAssertEqual(3, try? q.sumOf(string: "2 1"))
    }

    func testQ1WithMultipleNumbers() {
        XCTAssertEqual(4479, try? q.sumOf(string: "11 3435 632 321 46 2 42 -10"))
    }

    func testQ1WithInvalidNumbers() {
        do {
            let _ = try q.sumOf(string: "11 3435 632 abc 321 46 2 xyz 42 -10")
        }
        catch Quiz.QuizError.IllegalNumber(let number) {
            XCTAssertEqual("abc", number)
            return
        }
        catch {
        }

        XCTFail()
    }
    
    func testQ1WithOverflow() {
        XCTAssertEqual(-9223372036854775808, try? q.sumOf(string: "9223372036854775807 1"))
    }
    
    // MARK: Question 2

    func testQ2() {
        let answers = [ 1 : Quiz.DayOfWeek.Sunday, 2 : Quiz.DayOfWeek.Monday, 3 : Quiz.DayOfWeek.Tuesday, 4 : Quiz.DayOfWeek.Wednesday, 5 : Quiz.DayOfWeek.Thursday, 6 : Quiz.DayOfWeek.Friday, 7 : Quiz.DayOfWeek.Saturday ]
        var count = 1
        
        for day in Quiz.DayOfWeek.allCases {
            XCTAssertEqual(day, answers[count])
            count += 1
        }

    }

    // MARK: Question 3
    
    func testQ3WithDog() {
        let dog = Quiz.Dog(name: "Fido", loyaltyFactor: 10)
        XCTAssertEqual("🐶", dog.draw())
        XCTAssertEqual(true, dog.adoptable)
        dog.loyaltyFactor = 4
        XCTAssertEqual(false, dog.adoptable)
    }
    
    func testQ3WithCat() {
        let cat = Quiz.Cat(name: "Claws", purrinessFactor: -5.71)
        XCTAssertEqual("🐱", cat.draw())
        XCTAssertEqual(false, cat.adoptable)
        cat.purrinessFactor = 0.01
        XCTAssertEqual(true, cat.adoptable)
    }
}
