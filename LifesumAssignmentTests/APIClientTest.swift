//
//  APIClientTest.swift
//  LifesumAssignmentTests
//
//  Created by Ruchira Randana on 2/9/22.
//  Copyright © 2022 Ruchira Randana. All rights reserved.
//

import XCTest
@testable import Assignment

class APIClientTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_getFoodById(){
        
        let apiClient = Factory.createAPIClient()
        
        let expectationDownloadFoodItem1 = XCTestExpectation(description: "FoodDownload")
        
        apiClient.getFoodById(foodId: 1) { (foodItem, status) in
            
            XCTAssertEqual(status, true)
            XCTAssertNotNil(foodItem)
            expectationDownloadFoodItem1.fulfill()
            
        }
        
        wait(for: [expectationDownloadFoodItem1], timeout: 10.0)
        
        
        let expectationDownloadFoodItem2 = XCTestExpectation(description: "FoodDownload2")
        apiClient.getFoodById(foodId: 0) { (foodItem, status) in
            
            XCTAssertEqual(status, false)
            expectationDownloadFoodItem2.fulfill()
            
        }
        
        wait(for: [expectationDownloadFoodItem2], timeout: 10.0)
        
        //
        let expectationDownloadFoodItem3 = XCTestExpectation(description: "FoodDownload3")
        apiClient.getFoodById(foodId: 250) { (foodItem, status) in
            
            XCTAssertEqual(status, false)
            expectationDownloadFoodItem3.fulfill()
            
        }
        
        wait(for: [expectationDownloadFoodItem3], timeout: 10.0)
                
    }

}
