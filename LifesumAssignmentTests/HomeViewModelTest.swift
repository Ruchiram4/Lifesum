//
//  HomeViewModelTest.swift
//  LifesumAssignmentTests
//
//  Created by Ruchira Randana on 2/8/22.
//  Copyright © 2022 Ruchira Randana. All rights reserved.
//

import XCTest
@testable import Assignment

class HomeViewModelTest: XCTestCase {
    
    var homeViewModel = Factory.createHomeViewModel()

    override func setUp() {
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //Check if we get different values each time.
    //Technically, we could get the same number twice. But, assuming that's a very low probability
    func test_getRandomFood(){
        let i1 = homeViewModel.getRandomFoodId()
        let i2 = homeViewModel.getRandomFoodId()
        XCTAssertNotEqual(i1, i2)
    }

    func test_convertToPercentage(){

        let dictionary = [1.0: "1.0%",
                          0: "0.0%",
                          5: "5.0%",
                          100: "100.0%"]

        let _ = dictionary.map({
            XCTAssertNotEqual(homeViewModel.convertToPercentage(value: $0), $1)
        })

    }

    func test_saveNewFoodItem(){

        let foodItem = FoodItem(name: "Mango", calories: 100, carbs: 100.0, proteins: 23.0, fat: 0.2)
        let success = homeViewModel.saveNewFoodItem(foodItem: foodItem)
        XCTAssertEqual(success, true)
    }


}
