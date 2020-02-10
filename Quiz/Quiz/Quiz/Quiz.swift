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
    /// Determines whether the supplied String represents an even number or not
    ///
    /// PARAMETERS:
    /// A String to be analyzed
    ///
    /// RETURN/SIDE EFFECTS:
    /// True if the supplied String represents an even number, false otherwise
    ///
    /// NOTES:
    /// N/A
    ///
    
    func evenNumber(s: String?) -> Bool {
        if (s == nil) {
            return false
        }
        
        let numString: Int = Int(s!) ?? 0
        
        if (numString != 0 && numString % 2 == 0) {
            return true
        }
        return false
    }
    
    // MARK: Question 2

    ///
    /// PURPOSE:
    /// Combines every Character of the left String with every Character of the right String.
    /// For example, if left = "ABC" and right = "+-", returns the String "A+A-B+B-C+C-"
    ///
    /// PARAMETERS:
    /// Two Strings to be combined
    ///
    /// RETURN/SIDE EFFECTS:
    /// A String containing all combinations resulting from combining all Characters from the left String with all Characters from the right String.
    /// Characters are combined going from left to right
    ///
    /// NOTES:
    /// N/A
    ///
    
    func combine(left: String, right: String) -> String {
        let arrLeft = Array(left)
        let arrRight = Array(right)
        var newString = ""
        
        if (left == "") {
            newString.append(right)
        }
        else if (right == "") {
            newString.append(left)
        }
        else {
            for i in 0..<arrLeft.count {
                for j in 0..<arrRight.count {
                    newString.append(arrLeft[i])
                    newString.append(arrRight[j])
                }
            }
        }
        
        return newString
    }
}
