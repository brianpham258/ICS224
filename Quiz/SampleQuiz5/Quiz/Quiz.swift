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
    /// Given a string of integers, returns their sum.  For example, if the string is "1 2 3 4 5", returns 15
    ///
    /// PARAMETERS:
    /// A String of integers
    ///
    /// RETURN VALUES/SIDE EFFECTS:
    /// An integer representing the sum of the integers in the string that was passed in
    ///
    /// NOTES:
    /// If a non-integer is in the string that was passed in, throws a QuizError.IllegalNumber(x) exception, where x represents the first item in the string that is not an integer
    /// Overflows do not result in an error
    ///
    enum QuizError: Error {
        case IllegalNumber(number: Substring)
    }
    
    func sumOf(string: String) throws -> Int {
        var total: Int = 0
        for number in string.split(separator: " ") {
            guard let validNum = Int(number) else {
                throw QuizError.IllegalNumber(number: number)
            }
            
            total &+= validNum
        }
        
        return total
    }
    // MARK: Question 2

    ///
    /// PURPOSE:
    /// Create an iterable enumeration called DayOfWeek that consists of all days of the week, starting with Sunday
    ///
    
    enum DayOfWeek : CaseIterable {
        case Sunday
        case Monday
        case Tuesday
        case Wednesday
        case Thursday
        case Friday
        case Saturday
    }
        
    // MARK: Question 3

    ///
    /// PURPOSE:
    /// Create base class called Mammal with a method called draw() and a computed boolean property called adoptable
    /// draw() must consist of only preconditionFailure("Abstract method draw called")
    /// The getter for adoptable must also include a preconditionFaliure
    /// Mammal must also have a designated initializer that takes in a name in the form of a String
    ///
    /// Create  two subclasses, one called Dog, the other Cat
    ///
    /// The Dog draw() method must return "🐶"
    /// The adoptable getter must return true if the loyaltyFactor exceeds 5
    /// The Dog initializer must furthermore take a loyaltyFactor in the form of an Integer
    ///
    /// The Cat draw() method must return "🐱"
    /// The adoptable getter must return true if the purrinessFactor exceeds 0
    /// /// The Cat initializer must take a purrinessFactor (yes, I know this isn't an official word) in the form of a Double
    ///

    class Mammal {
        var name: String
        var adoptable: Bool {
            get {
                preconditionFailure("Abstract variable adoptable called")
            }
        }
        func draw() -> String {
            preconditionFailure("Abstract method draw called")
        }
        
        init(name: String) {
            self.name = name
        }
    }
    
    class Dog : Mammal {
        var loyaltyFactor: Int
        
        override var adoptable: Bool {
            get {
                return loyaltyFactor > 5 ? true : false
            }
        }
        override func draw() -> String {
            return "🐶"
        }
        
        init(name: String, loyaltyFactor: Int) {
            self.loyaltyFactor = loyaltyFactor
            super.init(name: name)
        }
    }
    
    class Cat : Mammal {
        var purrinessFactor: Double
        
        override var adoptable: Bool {
            get {
                return purrinessFactor > 0 ? true : false
            }
        }
        
        override func draw() -> String {
            return "🐱"
        }
        
        init(name: String, purrinessFactor: Double) {
            self.purrinessFactor = purrinessFactor
            super.init(name: name)
        }
    }
}
