//
//  APIClient.swift
//  LifesumAssignment
//
//  Created by Ruchira Randana on 2/7/22.
//  Copyright © 2022 Ruchira Randana. All rights reserved.
//

import Foundation

protocol APIClientProtocol: AnyObject {
    func getFoodById(foodId: Int, completion: @escaping(FoodItem?, Bool) -> ())
}

class APIClient: APIClientProtocol {
    
    //Using DI via constructor
    var parser: ObjectParserProtocol!
    
    init(withParser: ObjectParserProtocol){
        self.parser = withParser
    }
    
    func getFoodById(foodId: Int, completion: @escaping(FoodItem?, Bool) -> ()){
        
        let urlString = AppConfig.shared.getBaseUrl() + String(foodId)
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(AppConfig.shared.getAuthToken(), forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, urlResponse, error in
                        
            if error == nil{
                let (foodItem, parseError) = self.parser.parseFoodResponse(withData: data, response: urlResponse)
                
                if parseError == .none{
                    DispatchQueue.main.async { completion(foodItem, true) }
                }
                else{
                    DispatchQueue.main.async { completion(nil, false) }
                }
            }
            else{
                DispatchQueue.main.async { completion(nil, false) }
            }
        }.resume()
    }
    
}
