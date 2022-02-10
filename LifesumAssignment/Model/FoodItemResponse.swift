//
//  FoodItem.swift
//  LifesumAssignment
//
//  Created by Ruchira Randana on 2/7/22.
//  Copyright © 2022 Ruchira Randana. All rights reserved.
//

import Foundation

struct FoodItemResponse: Codable {
    let meta: FoodItemResponseCode
    let response: Food
}

struct FoodItemResponseCode: Codable {
    let code: Int
}

struct Food: Codable {
    
    let title: String?
    let calories: Int?
    let carbs: Double?
    let protein: Double?
    let fat: Double?
    let saturatedfat: Double?
    let unsaturatedfat: Double?
    let fiber: Double?
    let cholesterol: Double?
    let sugar: Double?
    let sodium: Double?
    let pottasium: Double?
    let gramsperserving: Double?
    let pcstext: String?    
}
