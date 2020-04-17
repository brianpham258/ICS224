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
    /// Given an Integer called "total" and a square array called "square", checks whether or not each row and each column of the array "square" sums up to "total"
    ///
    /// PARAMETERS:
    /// An Integer called "total" and a square array called "square"
    ///
    /// RETURN/SIDE EFFECTS:
    /// Returns nil if and only if each row and each column sums up to "total".  For example, assuming "total" is 15 and the array is
    /// 8 1 6
    /// 3 5 7
    /// 4 9 2,
    /// each row and each column adds up to 15, so an empty dictionary is returned.
    ///
    /// In case of one or more rows or columns that do not add up to "total", returns a dictionary of errors that were encountered.  For example, assuming a "total"
    /// of 15 and an array
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

    func equalSums(total: Int, square: [[Int]]) -> [String:Int] {
        var errorDict = [String:Int]()
    
        let numSquares = square.count
        
        for i in 0..<numSquares {
            if numSquares != square[i].count {
                return ["Error" : -1]
            }
        }

        for i in 0..<numSquares {
            var rowSubtotal = 0
            var colSubtotal = 0
            for j in 0..<numSquares {
                rowSubtotal += square[i][j]
                colSubtotal += square[j][i]
            }
            if total != rowSubtotal {
                errorDict["Row \(i)"] = rowSubtotal
            }
            if total != colSubtotal {
                errorDict["Column \(i)"] = colSubtotal
            }
        }
        
        return errorDict
    }
}
