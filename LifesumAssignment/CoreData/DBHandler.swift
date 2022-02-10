//
//  DBHandler.swift
//  LifesumAssignment
//
//  Created by Ruchira Randana on 2/9/22.
//  Copyright © 2022 Ruchira Randana. All rights reserved.
//


import Foundation
import CoreData

protocol DBHandlerProtocol {
    func addFoodItem(foodItem: FoodItem) -> Bool
    func deleteAll() -> Bool
    func getFoodItems() -> [FoodItemData]?;
}

class DBHandler: DBHandlerProtocol {
    
    weak var context:NSManagedObjectContext?
    
    init(withContext: NSManagedObjectContext) {
        self.context = withContext
    }
    
    func addFoodItem(foodItem: FoodItem) -> Bool{
        
        let foodItemDataEntity = FoodItemData(context: context!)
        foodItemDataEntity.name = foodItem.name
        foodItemDataEntity.calories = Int16(foodItem.calories)
        foodItemDataEntity.carbs = foodItem.carbs
        foodItemDataEntity.proteins = foodItem.proteins
        foodItemDataEntity.fat = foodItem.fat
        
        do {
            try context?.save()
            return true
        }
        catch{
            return false
        }
    }
    
    func deleteAll() -> Bool{
        
        let deleteRequest: NSBatchDeleteRequest = NSBatchDeleteRequest(fetchRequest: NSFetchRequest(entityName: "FoodItemData"))
        
        do {
            try context?.execute(deleteRequest)
            return true
        }
        catch {
            print("Oops... Delete failed...")
            return false
        }
        
    }
    
    func getFoodItems() -> [FoodItemData]? {
        
        let fetchRequest = NSFetchRequest<FoodItemData>(entityName: "FoodItemData")
        
        do {
            let results = try context?.fetch(fetchRequest)
            return results
        }
        catch {
            print("Oops...Get all food items failed...")
        }
        
        return nil
    }
    
}

