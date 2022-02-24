//
//  ResponseModel.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 24.02.2022.
//

import Foundation

struct ResponseModel: Codable {
    let status: String?
    let code: Int?
    let exception: String?
    let response: TaskResponse?
}

struct TaskResponse: Codable {
    let task: String?
    let status: Int?
    let result: [ResultInfo]?
}

struct ResultInfo: Codable {
    let result: [Info]?
}

struct Info: Codable {
    let name: String?
    let details: String?
    let subject: String?
}
