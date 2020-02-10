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
    
    func testQ1WithEqualSquare() {
        XCTAssertEqual([String:Int](), q.equalSums(total: 15, square: [[8,1,6],[3,5,7],[4,9,2]]))
    }
    
    func testQ1WithDuerersSquare() {
        XCTAssertEqual([String:Int](), q.equalSums(total: 34, square: [[16,3,2,13],[5,10,11,8],[9,6,7,12],[4,15,14,1]]))
    }
    
    func testQ1WithZeroSquare() {
        XCTAssertEqual([String:Int](), q.equalSums(total: 0, square: [[0]]))
    }
    
    func testQ1WithEmptySquare() {
        XCTAssertEqual([String:Int](), q.equalSums(total: 0, square: [[Int]]()))
    }
    
    func testQ1WithNegativeSquare() {
        XCTAssertEqual([String:Int](), q.equalSums(total: -3, square: [[-4,1,0],[3,-1,-5],[-2,-3,2]]))
    }
    
    func testQ1WithNonEqualSquare() {
        XCTAssertEqual(["Row 0" : 14, "Row 2" : 16, "Column 0" : 16, "Column 1" : 14], q.equalSums(total: 15, square: [[8,0,6],[3,5,7],[5,9,2]]))
    }
    
    func testQ1WithTriangle() {
        XCTAssertEqual(["Error" : -1], q.equalSums(total: 15, square: [[1,2,3],[4,5],[6]]))
    }
    
    func testQ1WithRectangularArray() {
        XCTAssertEqual(["Error" : -1], q.equalSums(total: 15, square: [[1,2,3],[4,5,6]]))
    }
    
}
