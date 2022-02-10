//
//  HomeViewModel.swift
//  LifesumAssignment
//
//  Created by Ruchira Randana on 2/7/22.
//  Copyright © 2022 Ruchira Randana. All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject{

    func foodByIdReceived(food: FoodItem?, status: Bool)
}

class HomeViewModel {
    
    //Inject via constructor. Non optional
    let api: APIClientProtocol!
    let dbHandler: DBHandlerProtocol!
    
    init(withApiClient: APIClientProtocol, dbHandler: DBHandlerProtocol){
        self.api = withApiClient
        self.dbHandler = dbHandler
    }
    
    //Inject delegate via property
    weak var delegate: HomeViewModelProtocol?
    
    func getRandomFoodItem() -> Void {
    
        let randomFoodId = getRandomFoodId()
                
        api.getFoodById(foodId: randomFoodId) { [weak self] (foodItem, status) in
            self?.delegate?.foodByIdReceived(food: foodItem, status: status)
            
            if status == true {//Success
                if let foodItem = foodItem {
                    let _ = self?.saveNewFoodItem(foodItem: foodItem)
                }
            }
        }
    }
    
    func getRandomFoodId() -> Int{
        return Int.random(in: 1...200)
    }
    
    func convertToPercentage(value: Double) -> String {
        let formattedDouble = String(format: "%.2f", value)
        return "\(formattedDouble)%"
    }
    
    func saveNewFoodItem(foodItem: FoodItem) -> Bool{
        let _ = dbHandler.deleteAll()
        let success = dbHandler.addFoodItem(foodItem: foodItem)
        return success
    }
    
    func getLastSavedFoodItem() -> FoodItem?{
        
        let array = dbHandler.getFoodItems()
        
        if let isEmpty = array?.isEmpty, let array = array{
            
            if(!isEmpty){
                
                let foodItemDataEntity = array[0]
                guard let name = foodItemDataEntity.name else {return nil}
                
                let foodItem = FoodItem(name: name, calories: Int(foodItemDataEntity.calories),
                                        carbs: foodItemDataEntity.carbs, proteins: foodItemDataEntity.proteins,
                                        fat: foodItemDataEntity.fat)
                
                return foodItem
            }
            else{
                return nil
            }
            
        }
        else{
            return nil
        }
        
    }
}
