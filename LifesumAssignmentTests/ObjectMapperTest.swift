//
//  ObjectMapperTest.swift
//  LifesumAssignmentTests
//
//  Created by Ruchira Randana on 2/9/22.
//  Copyright © 2022 Ruchira Randana. All rights reserved.
//

import XCTest
@testable import Assignment

class ObjectMapperTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_getFoodItemFromFoodItemResponse(){
        
        let mapper = ObjectMapper()
        let meta = FoodItemResponseCode(code: 200)
        let food = Food(title: "Cashew", calories: 100, carbs: 1.0, protein: 0.2, fat: 10.0, saturatedfat: 1.0, unsaturatedfat: 1.0, fiber: 3.2, cholesterol: 5.2, sugar: 2.2, sodium: 2.3, pottasium: 4.0, gramsperserving: 125.0, pcstext: "Cachew is tasty!")
        let foodItemResponse = FoodItemResponse(meta: meta, response: food)
        
        let foodItem = mapper.getFoodItemFromFoodItemResponse(foodItemResponse: foodItemResponse)
        
        XCTAssertEqual(foodItem.calories, 100)
        XCTAssertEqual(foodItem.carbs, 1.0)
        XCTAssertEqual(foodItem.fat, 10.0)
        XCTAssertEqual(foodItem.name, "Cashew")
        XCTAssertEqual(foodItem.proteins, 0.2)
        
        let emptyFood = Food(title: nil, calories: nil, carbs: nil, protein: nil, fat: nil, saturatedfat: nil, unsaturatedfat: nil, fiber: nil, cholesterol: nil, sugar: nil, sodium: nil, pottasium: nil, gramsperserving: nil, pcstext: nil)
        XCTAssertNotNil(emptyFood)
    }

}
