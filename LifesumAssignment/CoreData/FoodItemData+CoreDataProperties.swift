//
//  FoodItemData+CoreDataProperties.swift
//  LifesumAssignment
//
//  Created by Ruchira Randana on 2/9/22.
//  Copyright © 2022 Ruchira Randana. All rights reserved.
//
//

import Foundation
import CoreData


extension FoodItemData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FoodItemData> {
        return NSFetchRequest<FoodItemData>(entityName: "FoodItemData")
    }

    @NSManaged public var name: String?
    @NSManaged public var calories: Int16
    @NSManaged public var carbs: Double
    @NSManaged public var proteins: Double
    @NSManaged public var fat: Double

}
