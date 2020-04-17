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
    
    // MARK: Question 1
    
    func testQ1WithSingleValidTerrain() {
        let firstTerrain = Terrain(fuelConsumption: 100)
        let firstVehicle = Vehicle(maxFuel: 200)
        XCTAssertNotNil(try? firstVehicle.move(terrain: firstTerrain))
        XCTAssertEqual(1, firstVehicle.terrains.count)
        XCTAssertEqual(firstTerrain, firstVehicle.terrains[0])
    }
    
    func testQ1WithDoubleValidTerrain() {
        let firstTerrain = Terrain(fuelConsumption: 75)
        let secondTerrain = Terrain(fuelConsumption: 50)
        let firstVehicle = Vehicle(maxFuel: 125)
        XCTAssertNotNil(try? firstVehicle.move(terrain: firstTerrain))
        XCTAssertNotNil(try? firstVehicle.move(terrain: secondTerrain))
        XCTAssertEqual(2, firstVehicle.terrains.count)
        XCTAssertEqual(firstTerrain, firstVehicle.terrains[0])
        XCTAssertEqual(secondTerrain, firstVehicle.terrains[1])
    }

    func testQ1WithMultipleValidTerrain() {
        let fuels = [10, 5, 20, 35, 25]
        var Terrains = [Terrain]()
        for fuel in fuels {
            Terrains.append(Terrain(fuelConsumption: UInt(fuel)))
        }
        let firstVehicle = Vehicle(maxFuel: 95)
        for Terrain in Terrains {
            XCTAssertNotNil(try? firstVehicle.move(terrain: Terrain))
        }
        XCTAssertEqual(Terrains.count, firstVehicle.terrains.count)
        XCTAssertEqual(Terrains, firstVehicle.terrains)
    }

    func testQ1WithMultipleInvalidTerrain() {
        let fuels = [10, 5, 20, 35, 25]
        var Terrains = [Terrain]()
        for fuel in fuels {
            Terrains.append(Terrain(fuelConsumption: UInt(fuel)))
        }
        let firstVehicle = Vehicle(maxFuel: 95)
        for Terrain in Terrains {
            XCTAssertNotNil(try? firstVehicle.move(terrain: Terrain))
        }
        do {
            try firstVehicle.move(terrain: Terrain(fuelConsumption: 1))
        } catch QuizError.OutOfFuel(fuel: let fuel) {
            if fuel != 1 {
                XCTFail()
            }
        } catch {
            XCTFail()
        }
        XCTAssertEqual(Terrains.count, firstVehicle.terrains.count)
        XCTAssertEqual(Terrains, firstVehicle.terrains)
    }
    
    func testEQ1WithSingleInvalidTerrain() {
        let firstTerrain = Terrain(fuelConsumption: 201)
        let firstVehicle = Vehicle(maxFuel: 200)
        XCTAssertNil(try? firstVehicle.move(terrain: firstTerrain))
        XCTAssertEqual(0, firstVehicle.terrains.count)
    }
   
    func testEQ1WithDoubleInvalidTerrain() {
        let firstTerrain = Terrain(fuelConsumption: 76)
        let secondTerrain = Terrain(fuelConsumption: 50)
        let firstVehicle = Vehicle(maxFuel: 125)
        XCTAssertNotNil(try? firstVehicle.move(terrain: firstTerrain))
        XCTAssertNil(try? firstVehicle.move(terrain: secondTerrain))
        XCTAssertEqual(1, firstVehicle.terrains.count)
        XCTAssertEqual(firstTerrain, firstVehicle.terrains[0])
    }

     func testEQ1WithSingleTotallyInvalidTerrain() {
         let firstTerrain = Terrain(fuelConsumption: 2000)
         let firstVehicle = Vehicle(maxFuel: 200)
         XCTAssertNil(try? firstVehicle.move(terrain: firstTerrain))
         XCTAssertEqual(0, firstVehicle.terrains.count)
     }
    
     func testEQ1WithDoubleTotallyInvalidTerrain() {
         let firstTerrain = Terrain(fuelConsumption: 700)
         let secondTerrain = Terrain(fuelConsumption: 500)
         let firstVehicle = Vehicle(maxFuel: 125)
         XCTAssertNil(try? firstVehicle.move(terrain: firstTerrain))
         XCTAssertNil(try? firstVehicle.move(terrain: secondTerrain))
         XCTAssertEqual(0, firstVehicle.terrains.count)
     }
    
    func testEQ1Terrain() {
        let firstTerrain = Terrain(fuelConsumption: 700)
        XCTAssertEqual(700, firstTerrain.fuelConsumption)
    }
    
    func testEQ1Vehicle() {
        let firstVehicle = Vehicle(maxFuel: 200)
        XCTAssertEqual(200, firstVehicle.maxFuel)
    }

}
