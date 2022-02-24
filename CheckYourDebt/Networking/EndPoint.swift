//
//  EndPoint.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 24.02.2022.
//

import Foundation

enum Path: String {
    case search = "/api/v1.0/search/physical"
    case status = "/api/v1.0/status"
    case result = "/api/v1.0/result"
}

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

// MARK: - SearchEndpoint
struct StandardEndpoint: Endpoint {
    var scheme: String? = "https"
    var host: String? = "api-ip.fssp.gov.ru"
    var path: String = ""
    
    var queryItems: [URLQueryItem]?
    
    init(path: Path, queryItems: [URLQueryItem]) {
        self.queryItems = queryItems
        self.path = path.rawValue
    }
}




