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
    /// Given an array  of unsigned integers, return a corresponding array of strings where the first lowest integer is replaced by the
    /// string "dropped".  For example, if the list is [10, 10, 8, 5, 0, 1, 0, 10, 9, 7, 8], the result should be ["10", "10", "8", "5",
    /// "dropped", "1", "0", "10", "9", "7", "8"]
    ///
    /// PARAMETERS:
    /// An array of unsigned integers
    ///
    /// RETURN VALUES/SIDE EFFECTS:
    /// An array of strings, corresponding to the array of unsigned integers that was passed in, but with the lowest number
    /// replaced by the string "dropped"
    ///
    /// NOTES:
    /// N/A
    ///
    
    func dropFirstTwoLowest(list: [UInt]) -> [String] {
        var lowest = UInt.max
        var lowestLocation = -1
        for i in 0..<list.count {
            if list[i] < lowest {
                lowest = list[i]
                lowestLocation = i
            }
        }
        
        var newList = [String]()
        for i in 0..<list.count {
            newList.append(i == lowestLocation ? "dropped" : String(list[i]))
        }
        
        return newList
    }

    // MARK: Question 2

    ///
    /// PURPOSE:
    /// Given an array  of unsigned integers, return a corresponding array of strings where the all instances of the lowest integer are replaced by the
    /// string "dropped".  For example, if the list is [10, 10, 8, 5, 0, 1, 0, 10, 9, 7, 8], the result should be ["10", "10", "8", "5",
    /// "dropped", "1", "dropped", "10", "9", "7", "8"]
    ///
    /// PARAMETERS:
    /// An array of unsigned integers
    ///
    /// RETURN VALUES/SIDE EFFECTS:
    /// An array of strings, corresponding to the array of unsigned integers that was passed in, but with all instances of the lowest integer
    /// replaced by the string "dropped"
    ///
    /// NOTES:
    /// You MUST use array.map to replace the integers with strings
    ///
    
    func dropAllLowest(list: [UInt]) -> [String] {
        var lowest = UInt.max
        for number in list {
            if number < lowest {
                lowest = number
            }
        }
        
        return list.map({num -> String in return (num == lowest ? "dropped" : String(num))})
    }

    // MARK: Question 3

    ///
    /// PURPOSE:
    /// Given an array of unsigned integers and a closure that takes an unsigned integer and returns a string,
    /// return a corresponding array of strings where every integer in the original list is replaced by the result of
    /// applying the closure to that integer. For example, if the list is [10, 10, 8, 5, 0, 1, 0, 10, 9, 7, 8] and the
    /// closure is { num -> String in String(num &* 2) }, the result should be ["20", "20", "16", "10", "0", "2", "0",
    /// "20", "18", "14", "16"]
    ///
    /// PARAMETERS:
    /// An array of unsigned integers and a closure that will be applied to each of the integers
    ///
    /// RETURN VALUES/SIDE EFFECTS:
    /// An array of strings, corresponding to the array of unsigned integers that was passed in, but with each value having been
    /// passed in to the closure
    ///
    /// NOTES:
    /// N/A
    ///
    
    func convertAll(list: [UInt], closure: (UInt) -> String) -> [String] {
        var newList = [String]()
    
        for number in list {
            newList.append(closure(number))
        }
        
        return newList
    }

}
