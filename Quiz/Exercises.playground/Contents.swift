import UIKit

//
// ====================================================================================================
// Practice Question 1
// Write a function called computeSequence that takes an unsigned integer n and returns an array
// containing the first n numbers of the following sequence: 1  4  9  16  25  36  49  64  81  100  ...
// (Hint: Compute the differences between successive numbers to see the sequence)
// Don't worry about overflow
//
// The output of print(computeSequence(n: 10)) should be [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
// The output of print(computeSequence(n: 20)) should be [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400]
// The output of print(computeSequence(n: 0)) should be  []
// ====================================================================================================
//
print("=========================================================Question 1===================================================================")
func computeSequence(n: UInt) -> [UInt] {
    var result = [UInt]()
    var sum: UInt = 0

    for num in 0..<n*2 {
        if(num % 2 != 0) {
            sum += num
            result.append(sum)
        }
    }

    return result
}
print(computeSequence(n: 20))
print()
//
// ====================================================================================================
// Practice Question 2
// Write a function called printChart that takes an array of unsigned integers and prints out a
// row of asterisks for each slot of the array.  Furthermore, the number of asterisks must correspond
// to the unsigned integer of the current slot.
//
// For example, the output for printChart(array: [1, 2, 5, 0])
// should be:
// 0: *
// 1: **
// 2: *****
// 3:
// ====================================================================================================
//
print("=========================================================Question 2===================================================================")
func printChart(array: [UInt]) {
    for num in 0..<array.count {
        print("\(num): ", terminator: "")
        for _ in 0..<array[num] {
            print("*", terminator: "")
        }
        print()
    }
}
print(printChart(array: [1, 2, 5, 0]))
print()
//
// ====================================================================================================
// Practice Question 3
// Write a function called split that takes an array of unsigned integers and a single unsigned integer
// The function then returns a tuple of two arrays, one with elements < single unsigned integer, another
// with elements > single unsigned integer.
//
// For example, the call split(array: [10, 4, 5, 6, 2, 3, 0, 1, 8, 7, 9], pivot: 4) should return ([2, 3, 0, 1], [10, 5, 6, 8, 7, 9])
// ====================================================================================================
//
print("=========================================================Question 3===================================================================")
func split(array: [UInt], pivot: UInt) -> ([UInt], [UInt]) {
    var lesser = [UInt]()
    var greater = [UInt]()
    for num in array {
        if num < pivot {
            lesser.append(num)
        }
        if num > pivot {
            greater.append(num)
        }
    }
    
    return (lesser, greater)
}
print(split(array: [10, 4, 5, 6, 2, 3, 0, 1, 8, 7, 9], pivot: 4))
print()
//
// ====================================================================================================
// Practice Question 4
// Write a function called rank that takes an array of unsigned integers and a single unsigned integer n
// The function then returns the nth highest number
// If n is out of range, an Exercises.OutOfRange error is thrown
//
// For example, the call rank(array: [10, 4, 5, 6, 2, 3, 0, 1, 8, 7, 9], n: 2) should return 9 because 9 is the 2nd-highest number
// ====================================================================================================
//
print("=========================================================Question 4===================================================================")
enum Exercises : Error {
    case OutOfRange
}
func rank(array: [UInt], n: UInt) throws -> UInt {
    let sortedArray = array.sorted(by: >)
    if (n > array.count) { throw Exercises.OutOfRange }
    
    return sortedArray[Int(n-1)]
}
print(try rank(array: [10, 4, 5, 6, 2, 3, 0, 1, 8, 7, 9], n: 2))
print()
//
// ====================================================================================================
// Practice Question 5
// Write a function called tally that takes a string and returns a dictionary whose keys
// are the words of the string and values indicate how often a word appeared in the string
// Case and punctuation must be ignored
//
// For example, the call tally(sentence: "This is a simple string. It is simple; it has duplicates.")
// should return ["simple": 2, "this": 1, "has": 1, "duplicates": 1, "string": 1, "it": 2, "is": 2, "a": 1]
// ====================================================================================================
//
print("=========================================================Question 5===================================================================")
func tally(sentence: String) -> [Substring:Int] {
    var dict = [Substring:Int]()
    let words = sentence.lowercased().split{ !$0.isLetter }
    words.forEach{ dict[$0, default: 0] += 1 }
    
    return dict
}
print(tally(sentence: "This is a simple string. It is simple; it has duplicates."))
print()
//
// ====================================================================================================
// Practice Question 6
// Write a function called maxGap that takes an array of integers and returns the largest gap
// between any two adjacent integers
//
// For example, the call maxGap(array: [10, 7, 4, 5, 6, 2, 3, 0, 1, 8, 7, 9]) should return 7
// ====================================================================================================
//
print("=========================================================Question 6===================================================================")
func maxGap(array: [Int]) -> Int {
    var largestGap = 0
    if(array.count < 2) {
        return largestGap
    }
    
    for i in 1..<array.count {
        let newGap = abs(array[i] - array[i-1])
        if(newGap > largestGap) {
            largestGap = newGap
        }
    }
    
    return largestGap
}
print(maxGap(array: [10, 7, 4, 5, 6, 2, 3, 0, 1, 8, 7, 9]))
print()
//
// ====================================================================================================
// Practice Question 7
// Write a function called mostFrequent that takes a 2D array of integers and returns the number that
// appears the most often.  If there are no numbers, nil is returned
//
// For example, the call mostFrequent(array: [[1, 2, 3, 4, 5], [6, 7, 8], [9, 0, 1, 2], [1, 4]])
// should return 1
// ====================================================================================================
//
print("=========================================================Question 7===================================================================")
func mostFrequent(array: [[Int]]) -> Int? {
    var numCount = [Int:Int]()
    for row in array {
        for col in row {
            let count = numCount[col] ?? 0
            numCount[col] = count + 1
        }
    }
    
    var number: Int? = nil
    var max = 0
    for element in numCount {
        if element.value > max {
            max = element.value
            number = element.key
        }
    }
    
    return number
}
print(mostFrequent(array: [[1, 2, 3, 4, 5], [6, 7, 8], [9, 0, 1, 2], [1, 4]]))
print()
//
// ====================================================================================================
// Practice Question 8
// Using an integer array, implement a Stack class that has three methods: push(n), pop, and isEmpty()
// An StackError.EmptyStack exception must be thrown in case pop is called on an empty stack
// ====================================================================================================
//
print("=========================================================Question 8===================================================================")
enum StackError : Error {
    case EmptyStack
}
class Stack {
    var stack = [Int]()
    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    
    func push(n: Int) {
        stack.append(n)
    }
    
    func pop() throws -> Int {
        if isEmpty() {
            throw StackError.EmptyStack
        }
        return stack.removeLast()
    }
}
print()
//
// ====================================================================================================
// Practice Question 9 (Challenge Question)
// Write a function called permutations that takes in an array of characters and prints out all possible
// permutations of that array
//
// For example, permutations(array: ["A", "B", "C"]) should return
// ["A", "B", "C"]
// ["A", "C", "B"]
// ["B", "A", "C"]
// ["B", "C", "A"]
// ["C", "A", "B"]
// ["C", "B", "A"]
// ====================================================================================================
//
print("=========================================================Question 9===================================================================")
func permutations(array: [Character]) {
    
}
print()

// ====================================================================================================
//
//
//
// Avoid looking at the solutions until you have come up with a working answer to the practice questions!
//
//
//
// ====================================================================================================

//
// ====================================================================================================
// Practice Question 1 Solution
// ====================================================================================================
//
//func computeSequence(n: UInt) -> [UInt] {
//    var retVal = [UInt]()
//    var currentNum: UInt = 1
//    var offset: UInt = 3
//
//    for _ in 0..<n {
//        retVal.append(currentNum)
//        currentNum += offset
//        offset += 2
//    }
//
//    return retVal
//}
//print(computeSequence(n: 30))
//
// ====================================================================================================
// Practice Question 2 Solution
// ====================================================================================================
//
//func printChart(array: [UInt]) {
//    for i in 0..<array.count {
//        print("\(i): ", terminator: "")
//        for _ in 0..<array[i] {
//            print("*", terminator: "")
//        }
//        print()
//    }
//}

//
// ====================================================================================================
// Practice Question 3 Solution
// ====================================================================================================
//
//func split(array: [UInt], pivot: UInt) ->  ([UInt], [UInt]) {
//    var smaller = [UInt]()
//    var bigger = [UInt]()
//
//    for n in array {
//        if n < pivot {
//            smaller.append(n)
//        }
//        else if pivot < n {
//            bigger.append(n)
//        }
//    }
//
//    return (smaller, bigger)
//}

//
// ====================================================================================================
// Practice Question 4 Solution
// ====================================================================================================
//
//enum Exercises : Error {
//    case OutOfRange
//}
//
//func rank(array: [UInt], n: UInt) throws -> UInt {
//    if n > array.count {
//        throw Exercises.OutOfRange
//    }
//
//    let sortedArray = array.sorted()
//    return sortedArray[array.count - Int(n)]
//}

//
// ====================================================================================================
// Practice Question 5 Solution
// ====================================================================================================
//
//func tally(sentence: String) -> [Substring:UInt] {
//    var tallyDict = [Substring:UInt]()
//    var sanitizedSentence = sentence
//    sanitizedSentence.removeAll(where: { c -> Bool in return !c.isLetter && c != " " })
//    let words = sanitizedSentence.lowercased().split(separator: " ")
//    for word in words {
//        let count = tallyDict[word] ?? 0
//        tallyDict[word] = count + 1
//    }
//
//    return tallyDict
//}

//
// ====================================================================================================
// Practice Question 6 Solution
// ====================================================================================================
//
//func maxGap(array: [Int]) -> Int {
//    var gap = 0
//
//    if array.count < 2 {
//        return 0
//    }
//
//    for i in 1..<array.count {
//        let newGap =  abs(array[i] - array[i - 1])
//        if newGap > gap {
//            gap = newGap
//        }
//    }
//
//    return gap
//}

//
// ====================================================================================================
// Practice Question 7 Solution
// ====================================================================================================
//
//func mostFrequent(array: [[Int]]) -> Int? {
//    var tallyDict = [Int:Int]()
//
//    for row in array {
//        for col in row {
//            let count = tallyDict[col] ?? 0
//            tallyDict[col] = count + 1
//        }
//    }
//
//    var max = 0
//    var val: Int? = nil
//    for entry in tallyDict {
//        if entry.value > max {
//            max = entry.value
//            val = entry.key
//        }
//    }
//
//    return val
//}

//
// ====================================================================================================
// Practice Question 8 Solution
// ====================================================================================================
//
//class Stack {
//    enum StackError: Error {
//        case EmptyStack
//    }
//
//    var _stack = [Int]()
//
//    func push(n: Int) {
//        _stack.append(n)
//    }
//
//    func isEmpty() -> Bool {
//        return _stack.isEmpty
//    }
//
//    func pop() throws -> Int {
//        if _stack.isEmpty {
//            throw StackError.EmptyStack
//        }
//
//        return _stack.removeLast()
//    }
//}

//
// ====================================================================================================
// Practice Question 9 Solution
// ====================================================================================================
//
//func permutations(oldArray: [Character], currArray: [Character]) {
//    if currArray.count == 0 {
//        print(oldArray)
//        return
//    }
//
//    for i in 0..<currArray.count {
//        var newArray = currArray
//        let removedElement = newArray[i]
//        newArray.remove(at: i)
//        permutations(oldArray: oldArray + [removedElement], currArray: newArray)
//    }
//}
//
//func permutations(array: [Character]) {
//    permutations(oldArray: [Character](), currArray: array)
//}
//

