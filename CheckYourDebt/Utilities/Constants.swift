//
//  Constants.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 24.02.2022.
//

import Foundation

struct K {
    
    static let token = "zwxQ6FzoufZs"
    
    struct QueryNames {
        static let token = "token"
        static let region = "region"
        static let firName = "firstname"
        static let secName = "secondname"
        static let lasName = "lastname"
        static let birth = "birthdate"
        static let task = "task"
    }
    
    enum Path: String {
        case search = "/api/v1.0/search/physical"
        case status = "/api/v1.0/status"
        case result = "/api/v1.0/result"
    }
}
