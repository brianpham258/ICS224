//
//  Quiz.swift
//  Quiz
//
//  Created by Test Account on 2020-01-14.
//  Copyright © 2020 Test Account. All rights reserved.
//

import UIKit

// MARK: Question 1

///
/// PURPOSE:
/// Create a base class called Vehicle that inherits from NSObject
/// Vehicle must provide an initializer that takes an unsigned integer called maxFuel
/// maxFuel indicates the maximum amount of fuel (e.g., in litres) that  the vehicle can contain
///
/// Create a base class called Terrain that inherits from NSObject
/// Terrain must provide an initializer that takes an unsigned integer called fuelConsumption
/// fuelConsumption indicates the amount of fuel (e.g., in litres) that is consumed while travelling over the Terrain
///
/// Add a move method to Vehicle that takes an instance of the Terrain class
/// If moving over the current Terrain would result in the remaining amount of fuel in the Vehicle to go below 0, the move method must throw a QuizError.OutOfFuel(fuel amount of current Terrain) error
/// Otherwise, the current Terrain is added to the list of Terrains loaded so far
/// Make sure to add a terrains variable to track all Terrains over which the Vehicle will move
///
enum QuizError : Error {
    case OutOfFuel(fuel: UInt)
}
class Vehicle : NSObject {
    var maxFuel: UInt
    var terrains = [Terrain]()
    
    func move(terrain: Terrain) throws {
        if(maxFuel <= 0) {
            throw QuizError.OutOfFuel(fuel: maxFuel)
        }
        maxFuel -= terrain.fuelConsumption
        terrains.append(terrain)
    }
    
    init(maxFuel: UInt) {
        self.maxFuel = maxFuel
    }
}

class Terrain : NSObject {
    var fuelConsumption: UInt
    
    init(fuelConsumption: UInt) {
        self.fuelConsumption = fuelConsumption
    }
}
