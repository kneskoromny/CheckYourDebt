//
//  EndPoint.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 24.02.2022.
//

import Foundation

// MARK: - Endpoint
protocol Endpoint {
    var path: String { get set }
    var queryItems: [URLQueryItem]? { get set }
    
    var scheme: String? { get }
    var host: String? { get }
    var url: URL? { get }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems

        return components.url
    }
}

// MARK: - StandardEndpoint
struct StandardEndpoint: Endpoint {
    var scheme: String? = "https"
    var host: String? = "api-ip.fssp.gov.ru"
    var path: String = ""
    
    var queryItems: [URLQueryItem]?
    
    init(path: K.Path, queryItems: [URLQueryItem]) {
        self.queryItems = queryItems
        self.path = path.rawValue
    }
}




