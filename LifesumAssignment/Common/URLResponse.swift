//
//  URLResponse.swift
//  LifesumAssignment
//
//  Created by Ruchira Randana on 2/7/22.
//  Copyright © 2022 Ruchira Randana. All rights reserved.
//

import Foundation

extension URLResponse {
    
    func extractResponseErrors() -> ResponseError {
                
        var httpStatusCode = 0
        
        if let httpResponse = self as? HTTPURLResponse {
            httpStatusCode = httpResponse.statusCode
        }
        
        var responseError: ResponseError = .none
        
        if (200...299).contains(httpStatusCode) {
            responseError = .none
        }
        else if httpStatusCode == 400 {
            responseError = .badrequest
        }
        else if httpStatusCode == 401 || httpStatusCode == 403 {
            responseError = .authentication
        }
        else if (500...599).contains(httpStatusCode) {
            responseError = .server
        }
        else {
            responseError = .general
        }
        
        return responseError
        
    }
}
