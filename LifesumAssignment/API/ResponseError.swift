//
//  ResponseError.swift
//  LifesumAssignment
//
//  Created by Ruchira Randana on 2/7/22.
//  Copyright © 2022 Ruchira Randana. All rights reserved.
//

import Foundation

enum ResponseError: String {
    case none = "none"
    case server = "server"
    case badrequest = "badrequest"
    case authentication = "authentication"
    case parse = "parse"
    case general = "general"
}
