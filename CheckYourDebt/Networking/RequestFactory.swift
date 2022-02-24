//
//  URLRequestFactory.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 24.02.2022.
//

import Foundation

protocol RequestFactory {
    var endpoint: Endpoint { get }
    
    func makeRequest() -> URLRequest
}

struct StandardRequest: RequestFactory {
    var endpoint: Endpoint
    
    init(endpoint: Endpoint) {
        self.endpoint = endpoint
    }
    
    func makeRequest() -> URLRequest {
        guard let url = endpoint.url else {
            fatalError("Unable to make url")
        }
        return URLRequest(url: url)
    }
}
