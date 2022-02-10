//
//  AppConfig.swift
//  LifesumAssignment
//
//  Created by Ruchira Randana on 2/7/22.
//  Copyright © 2022 Ruchira Randana. All rights reserved.
//

import Foundation

class AppConfig{
    
    static let shared = AppConfig()
    
    private init() {
     
    }
    
    func getBaseUrl() -> String{
        return "https://api.lifesum.com/v2/foodipedia/codetest?foodid="
    }
    
    func getAuthToken() -> String{
        return "23863708:465c0554fd00da006338c72e282e939fe6576a25fd00c776c0fbe898c47c9876"
    }
}
