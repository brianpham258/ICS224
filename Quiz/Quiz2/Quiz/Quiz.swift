//
//  Quiz.swift
//  Quiz
//
//  Created by Test Account on 2020-01-14.
//  Copyright © 2020 Test Account. All rights reserved.
//

import UIKit

class Quiz {
    
    // MARK: Question 1
    
    ///
    /// PURPOSE:
    /// Given an Integer called "total" and a square array called "square", checks whether or not each row and each column of the array
    /// "square" sums up to "total"
    ///
    /// PARAMETERS:
    /// An Integer called "total" and a square array called "square"
    ///
    /// RETURN/SIDE EFFECTS:
    /// Returns an empty dictionary if and only if each row and each column sums up to "total".
    /// For example, assuming "total" is 15 and the array is
    /// 8 1 6
    /// 3 5 7
    /// 4 9 2,
    /// each row and each column adds up to 15, so an empty dictionary is returned.
    ///
    /// In case of one or more rows or columns that do not add up to "total", returns a dictionary of errors that were encountered.
    /// For example, assuming a "total" of 15 and an array
    /// 8 0 6
    /// 3 5 7
    /// 5 9 2,
    /// returns dictionary [ "Row 0" : 14, "Row 2" : 16, "Column 0" : 16, "Column 1" : 14 ]
    ///
    /// In case the shape is not a square, returns [ "Error" : -1 ]
    ///
    /// NOTES:
    /// Feel free to modify this program excerpt:
    ///
    /// let numSquares = square.count
    /// for i in 0..<numSquares {
    ///    var rowSubtotal = 0
    ///    var colSubtotal = 0
    ///    for j in 0..<numSquares {
    ///        rowSubtotal += square[i][j]
    ///        colSubtotal += square[j][i]
    ///    }
    ///    if total != rowSubtotal {
    ///        print("Row \(i) is \(rowSubtotal) instead of \(total)")
    ///    }
    ///    if total != colSubtotal {
    ///        print("Column \(i) is \(colSubtotal) instead of \(total)")
    ///    }
    /// }

    func equalSums(total: Int, square: [[Int]]) -> [ String : Int] {
        var result = [ String : Int	]()
        var colCount: Int = 0
        
        for i in 0..<square.count {
            for j in square[i] {
                colCount += 1
            }
        }
        
        if(colCount != 9) {
            var key = "Error "
            result[key] = -1
            return result
        }
        
        for i in 0..<square.count {
            var sumCol: Int = 0
            var sumRow: Int = 0
            var counter = 0
            for j in 0..<square.count {
                sumRow += square[i][j]
                sumCol += square[j][i]
                counter += 1
            }
            
            if (sumRow != total) {
                var key = "Row " + String(i)
                result[key] = sumRow
            }
            if(sumCol != total) {
                var key = "Column " + String(counter)
                result[key] = sumCol
            }
        }
        
        return result
    }
    
}
