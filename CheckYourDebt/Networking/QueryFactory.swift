//
//  QueryFactory.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 24.02.2022.
//

import Foundation

struct QueryFactory {
    
    static func makePersonQueries(
        firstName: String, secondName: String, lastName: String, region: String, birthDate: String
    ) -> [URLQueryItem] {
        
        let token = URLQueryItem(name: K.QueryNames.token, value: K.token)
        let region = URLQueryItem(name: K.QueryNames.region, value: region)
        let firstName = URLQueryItem(name: K.QueryNames.firName, value: firstName)
        let secondName = URLQueryItem(name: K.QueryNames.secName, value: secondName)
        let lastName = URLQueryItem(name: K.QueryNames.lasName, value: lastName)
        let birth = URLQueryItem(name: K.QueryNames.birth, value: birthDate)
        
        return [token, region, firstName, secondName, lastName, birth]
    }
    
    static func makeResultQueries(task: String) -> [URLQueryItem] {
        
        let token = URLQueryItem(name: K.QueryNames.token, value: K.token)
        let task = URLQueryItem(name: K.QueryNames.task, value: task)
        
        return [token, task]
    }
}
