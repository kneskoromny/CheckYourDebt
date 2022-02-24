//
//  ViewController.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 24.02.2022.
//

import UIKit

class InputViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queries = QueryFactory.makePersonQueries(
            region: "51", firstName: "Антон", secondName: "Сергеевич", lastName: "Нескоромный", birthDate: "22.02.1992"
        )
        let queries1 = QueryFactory.makeResultQueries(task: "d48f87d5-b337-4050-a56d-e1e8bb652f4f")
        let endPoint = StandardEndpoint(path: K.Path.result, queryItems: queries1)
        print(endPoint.url as Any)
        
        let request = StandardRequest(endpoint: endPoint)
        let networkService = StandardNetworkService(request: request)
        
        networkService.getData(ResponseModel.self) { result in
            switch result {
                
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}

