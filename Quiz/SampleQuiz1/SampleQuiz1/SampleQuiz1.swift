//
//  SampleQuiz1.swift
//  SampleQuiz1
//
//  Created by Michael Horie on 2020-01-11.
//  Copyright © 2020 Michael Horie. All rights reserved.
//

import UIKit

class SampleQuiz1 {
    
    // MARK: Question 1
    
    ///
    /// PURPOSE:
    /// Converts a String to an Integer
    ///
    /// PARAMETERS:
    /// A String to be converted
    ///
    /// RETURN/SIDE EFFECTS:
    /// An Integer corresponding to the String that was passed in as a parameter
    ///
    /// NOTES:
    /// If the String cannot be converted to an Integer, 0 is returned
    ///
    
    func convertToInt(s: String) -> Int {
        var number: Int = 0
        number = (Int(s) ?? 0)

        return number
    }
    
    // MARK: Question 2
    
    ///
    /// PURPOSE:
    /// Adds two numbers
    ///
    /// PARAMETERS:
    /// A Double and an Integer to be added together
    ///
    /// RETURN/SIDE EFFECTS:
    /// A Double corresponding to the sum of the parameters
    ///
    /// NOTES:
    /// Overflow is not handled
    ///
    
    func add(d: Double, i: Int) -> Double {
        var sum: Double = 0
        sum = d + Double(i)
        
        return sum
    }
    
    // MARK: Question 3
    
    ///
    /// PURPOSE:
    /// Given an original String and an Unsigned Integer u, returns a String that is missing every uth element of the original String
    ///
    /// PARAMETERS:
    /// A String s and an Unsigned Integer u
    ///
    /// RETURN/SIDE EFFECTS:
    /// Returns a String that is missing every uth element of s
    ///
    /// NOTES:
    /// N/A
    ///
    
    func remove(s: String, u: UInt) -> String {
        var str: String = s
        var strArr = str.map {String($0)}
        strArr.remove(at: Int(u))
        str = strArr.joined(separator: "")
        
        return str
    }
 
    // MARK: Question 4
    
    ///
    /// PURPOSE:
    /// Given an Integer i and an Unsigned Integer u, returns a String that contains the first u multiples of i.  For example if i == "10" and u == 5, this function returns the String "10 20 30 40 50"
    ///
    /// PARAMETERS:
    /// An Unsigned Integer u and an Integer i
    ///
    /// RETURN/SIDE EFFECTS:
    /// Returns a String that contains the first i multiples of u
    ///
    /// NOTES:
    /// u will be restricted to 10, inclusive
    /// Overflow will be handled gracefully
    ///
    
    func deriveMultiples(i: Int, u: UInt) -> String {
        return "-224"
    }

}
