//
//  ObjectParserTest.swift
//  LifesumAssignmentTests
//
//  Created by Ruchira Randana on 2/9/22.
//  Copyright © 2022 Ruchira Randana. All rights reserved.
//

import XCTest
@testable import Assignment

class ObjectParserTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_parseFoodResponse(){
        
        let jsonSuccessful = """
        {
            "meta": {
                "code": 200
            },
            "response": {
                "title": "Pork frankfurter",
                "calories": 269,
                "carbs": 0.28,
                "protein": 12.81,
                "fat": 23.68,
                "saturatedfat": 8.719,
                "unsaturatedfat": 13.123,
                "fiber": 0.1,
                "cholesterol": 0.066,
                "sugar": 0.0,
                "sodium": 0.816,
                "potassium": 0.264,
                "gramsperserving": 76.0,
                "pcstext": "Whole frankfurter"
            }
        }
        """
        
        let jsonParseError = """
        {
            "meta": {
                "code": 200
            },
            "response": {{{{
                "title": "Pork frankfurter",
                "calories": 269,
                "carbs": 0.28,
                "protein": 12.81,
                "fat": 23.68,
                "saturatedfat": 8.719,
                "unsaturatedfat": 13.123,
                "fiber": 0.1,
                "cholesterol": 0.066,
                "sugar": 0.0,
                "sodium": 0.816,
                "potassium": 0.264,
                "gramsperserving": 76.0,
                "pcstext": "Whole frankfurter"
            }
        }
        """
        
        
        let parser = ObjectParser()
        
        //Success
        var (result, error) = parser.parseFoodResponse(withData: jsonSuccessful.data(using: .utf8), response: nil)
        XCTAssertEqual(error, ResponseError.none)
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.calories, 269)
        
        //Fail
        (result, error) = parser.parseFoodResponse(withData: jsonParseError.data(using: .utf8), response: nil)
        XCTAssertEqual(error, ResponseError.parse)
        XCTAssertNil(result)
        
        //Fail
        (result, error) = parser.parseFoodResponse(withData: nil, response: nil)
        XCTAssertEqual(error, ResponseError.general)
        XCTAssertNil(result)
        
    }

}
