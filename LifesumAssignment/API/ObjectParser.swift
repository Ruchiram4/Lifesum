//
//  ObjectParser.swift
//  LifesumAssignment
//
//  Created by Ruchira Randana on 2/7/22.
//  Copyright © 2022 Ruchira Randana. All rights reserved.
//

import Foundation

typealias FoodItemResult = (FoodItem?, ResponseError)

protocol ObjectParserProtocol {
    
    func parseFoodResponse(withData: Data?, response: URLResponse?) -> FoodItemResult

}

class ObjectParser: ObjectParserProtocol {
    
    func parseFoodResponse(withData: Data?, response: URLResponse?) -> FoodItemResult{
        
        let errorCode = response?.extractResponseErrors() ?? .none
        guard let withData = withData else { return (nil, .general)}
        
        if errorCode == .none{
            
            do{
                let foodItemResponse: FoodItemResponse = try JSONDecoder().decode(FoodItemResponse.self, from: withData)
                let mapper = ObjectMapper()
                let foodItem = mapper.getFoodItemFromFoodItemResponse(foodItemResponse: foodItemResponse)
                return (foodItem, errorCode)
            }
            catch{
                return (nil, .parse)
            }
        }
        
        return (nil, .general)
    }
}
