//
//  Constants.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 24.02.2022.
//

import UIKit

struct K {
    
    static let token = "zwxQ6FzoufZs"
    //static let appName = "ПроверьДолги👀"
    struct Titles {
        static let main = "ПроверьДолги 👀"
        static let detail = "Информация 📃"
    }
    struct QueryNames {
        static let token = "token"
        static let region = "region"
        static let firName = "firstname"
        static let secName = "secondname"
        static let lasName = "lastname"
        static let birth = "birthdate"
        static let task = "task"
    }
    
    struct Colors {
        static let customGreen = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        static let customBlue = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    
    enum ServiceError: Error {
        case unexpectedResponse
    }
    
    enum Path: String {
        case search = "/api/v1.0/search/physical"
        case status = "/api/v1.0/status"
        case result = "/api/v1.0/result"
    }
    
    static func getRegionCodes() -> [String] {
        var codes = ["82", "86", "89", "92"]
        for element in 1...78 {
            let stringElement = String(element)
            codes.append(stringElement)
        }
        return codes
    }
    static func getAlphabet() -> String {
        return "йцукенгшщзхъфывапролджэячсмитьбю"
    }
}
