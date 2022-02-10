//
//  Factory.swift
//  LifesumAssignment
//
//  Created by Ruchira Randana on 2/9/22.
//  Copyright © 2022 Ruchira Randana. All rights reserved.
//

import Foundation
import UIKit

class Factory {
    
    static func createDBHandler() -> DBHandlerProtocol {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return DBHandler(withContext: context)
    }
    
    static func createHomeViewController() -> HomeViewController {
        return HomeViewController(withViewModel: createHomeViewModel(),
                                  carbsView: NutrientIndicatorView(),
                                  proteinView: NutrientIndicatorView(),
                                  fatView: NutrientIndicatorView(), loadingView: UIView())
    }
    
    static func createHomeViewModel() -> HomeViewModel {
        return HomeViewModel(withApiClient: createAPIClient(), dbHandler: createDBHandler())
    }
    
    static func createAPIClient() -> APIClientProtocol {
        return APIClient(withParser: ObjectParser())
    }
    
}
