//
//  NetworkService.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 24.02.2022.
//

import Foundation

protocol NetworkService {
    //var request: RequestFactory { get }
    
    func getData<T: Codable>(
        _ resource: T.Type, from request: RequestFactory, completion: @escaping (Result<T, Error>) -> Void
    )
}

struct StandardNetworkService: NetworkService {
    //var request: RequestFactory
    
//    init(request: RequestFactory) {
//        self.request = request
//    }
    
    func getData<T>(
        _ resource: T.Type, from request: RequestFactory, completion: @escaping (Result<T, Error>) -> Void
    ) where T: Codable {
        
        let request = request.makeRequest()
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data, data.isEmpty == false else {
                completion(.failure(K.ServiceError.unexpectedResponse))
                return
            }
            do {
                let resource = try JSONDecoder().decode(T.self, from: data)
                completion(.success(resource))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    } 
}
