//
//  InputViewModel.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 24.02.2022.
//

import UIKit

struct InputViewModel {
    
    // MARK: - Dependencies
    private let networkService: NetworkService
    
    init(networkService: NetworkService = StandardNetworkService()) {
        self.networkService = networkService
    }
    
    // MARK: - Get data
    func getToken(
        firName: String?, secName: String?, lasName: String?, reg: String?, birth: String?, completion: @escaping (String?) -> Void) {
            
            let queries = QueryFactory.makePersonQueries(
                firstName: firName!, secondName: secName!, lastName: lasName!, region: reg!, birthDate: birth!
            )
            let endPoint = StandardEndpoint(path: K.Path.search, queryItems: queries)
            let request = StandardRequest(endpoint: endPoint)
            
            networkService.getData(ResponseModel.self, from: request) { result in
                
                switch result {
                case .success(let data):
                    print(data.response?.task)
                    completion(data.response?.task)
                case .failure(let error):
                    print(error)
                    completion(nil)
                }
            }
        }
    
    func getResult(for task: String?, completion: @escaping (ResponseModel?) -> Void) {
        
        guard let t = task else { return }
        let queries = QueryFactory.makeResultQueries(task: t)
        let endPoint = StandardEndpoint(path: K.Path.result, queryItems: queries)
        let request = StandardRequest(endpoint: endPoint)
        
        networkService.getData(ResponseModel.self, from: request) { result in
            
            switch result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
    
    // MARK: - Check user input
    func checkedEmptyFields(_ textFields: UITextField...) -> Bool {
        var result = true
        textFields.forEach { tf in
            if tf.text == "" {
                result = false
            }
        }
        return result
    }
    
    func checkedLanguage(_ textFields: UITextField...) -> Bool {
        var result = true
        let alphabet = K.getAlphabet()
        textFields.forEach { tf in
            guard let text = tf.text else {
                result = false
                return
            }
            for char in text.lowercased() {
                if !alphabet.contains(char) {
                    print(char)
                    result = false
                    break
                }
            }
        }
        return result
    }
    
    func checkedRegion(_ region: UITextField) -> Bool {
        var result = true
        let regions = K.getRegionCodes()
        guard let text = region.text else {
            return false
        }
        if !regions.contains(text) {
            result = false
        }
        return result
    }
    
    func checkedDate(_ date: UITextField) -> Bool {
        guard let text = date.text else {
            return false
        }
        let regex = "[0-9]{2}[.][0-9]{2}[.][0-9]{4}"
        let dateTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return dateTest.evaluate(with: text)
    }
}
