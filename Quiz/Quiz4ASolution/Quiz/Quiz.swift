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
    /// Takes a list of strings and a closure that takes a string and returns a string, then applies the closure to each element of the list
    ///
    /// PARAMETERS:
    /// A list of strings and a closure that will be applied to each element in the list
    ///
    /// RETURN VALUES/SIDE EFFECTS:
    /// A list of strings that results when the filter is applied to each element of the original list
    ///
    /// NOTES:
    /// You must use map.  The function body must consist of a single line.  No semicolons or colons may be used.
    ///

    func filterList(list: [String], filter: (String) -> String) -> [String] {
//      return list.map({ entry -> String in return filter(entry) })
//      return list.map({ entry -> String in filter(entry) })
//      return list.map({ filter($0) })
//      return list.map { filter($0) }
        return list.map(filter)
    }

    // MARK: Question 2

    ///
    /// PURPOSE:
    /// Takes a list of integers and returns a list of integers that has all out of order numbers removed, assuming ascending order.
    /// For example, if the list is [0, 2, 4, 6, 4, 7, 7], the result is [0, 2, 4, 6, 7, 7] because the second 4 is smaller than the
    /// preceding 6
    ///
    /// PARAMETERS:
    /// A list of integers
    ///
    /// RETURN VALUES/SIDE EFFECTS:
    /// A list of integers that is never descending
    ///
    /// NOTES:
    /// N/A
    ///
    
    func ascending(list: [Int]) -> [Int] {
        if list.count < 2 {
            return list
        }
        
        var currentThreshold = list[0]
        var newList = [currentThreshold]
        for i in 1..<list.count {
            if currentThreshold <= list[i] {
                currentThreshold = list[i]
                newList.append(currentThreshold)
            }
        }
        
        return newList
    }

}
