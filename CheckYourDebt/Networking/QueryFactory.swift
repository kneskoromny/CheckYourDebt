//
//  QueryFactory.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 24.02.2022.
//

import Foundation

struct QueryFactory {
    static func makeSearchQueries(region: String,
                                  firstName: String,
                                  secondName: String,
                                  lastName: String,
                                  birthDate: String) -> [URLQueryItem] {
             
             let token = URLQueryItem(name: "token", value: "zwxQ6FzoufZs")
             let region = URLQueryItem(name: "region", value: region)
             let firstName = URLQueryItem(name: "firstname", value: firstName)
             let secondName = URLQueryItem(name: "secondname", value: secondName)
             let lastName = URLQueryItem(name: "lastname", value: lastName)
             let birth = URLQueryItem(name: "birthdate", value: birthDate)
             
             return [token, region, firstName, secondName, lastName, birth]
         }
    static func makeStatusQueries(task: String) -> [URLQueryItem] {
        
        let token = URLQueryItem(name: "token", value: "zwxQ6FzoufZs")
        let task = URLQueryItem(name: "task", value: task)
        
        return [token, task]
    }
}
