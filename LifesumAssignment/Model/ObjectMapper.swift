//
//  ObjectMapper.swift
//  LifesumAssignment
//
//  Created by Ruchira Randana on 2/8/22.
//  Copyright © 2022 Ruchira Randana. All rights reserved.
//

import Foundation

struct ObjectMapper {
    
    func getFoodItemFromFoodItemResponse(foodItemResponse: FoodItemResponse) -> FoodItem {
        
        guard
            let title = foodItemResponse.response.title,
            let calories = foodItemResponse.response.calories,
            let carbs = foodItemResponse.response.carbs,
            let protein = foodItemResponse.response.protein,
            let fat = foodItemResponse.response.fat
                        
        else {
            return FoodItem(name: "", calories: 0, carbs: 0.0, proteins: 0.0, fat: 0.0)
        }
        
        let foodItem = FoodItem(name: title, calories: calories, carbs: carbs, proteins: protein, fat: fat)
        
        return foodItem
        
    }
}
