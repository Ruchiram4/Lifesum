//
//  DBHandlerTest.swift
//  LifesumAssignmentTests
//
//  Created by Ruchira Randana on 2/9/22.
//  Copyright © 2022 Ruchira Randana. All rights reserved.
//

import XCTest
@testable import Assignment

class DBHandlerTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_addFoodItem(){
        
        let dbHandler = Factory.createDBHandler()
        let status = dbHandler.addFoodItem(foodItem: FoodItem(name: "Peanuts", calories: 100, carbs: 3.2, proteins: 1.2, fat: 5.0))
        XCTAssertEqual(status, true)
        
        let foodItems = dbHandler.getFoodItems()
        XCTAssertNotNil(foodItems)
        XCTAssert(foodItems!.count > 0)
                
    }
    
    func test_deleteAll(){
        let dbHandler = Factory.createDBHandler()
        let status = dbHandler.deleteAll()
        XCTAssertEqual(status, true)
    }
    
    func test_getFoodItems(){
        
        let dbHandler = Factory.createDBHandler()
        let _ = dbHandler.deleteAll()
        
        let _ = dbHandler.addFoodItem(foodItem: FoodItem(name: "Peanuts", calories: 100, carbs: 3.2, proteins: 1.2, fat: 5.0))
        let foodItems = dbHandler.getFoodItems()
        
        XCTAssertNotNil(foodItems)
        XCTAssert(foodItems?.count == 1)
    }

}
