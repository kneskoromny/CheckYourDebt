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
        let endPoint = StandardEndpoint(path: K.Path.search, queryItems: queries)
        print(endPoint.url)
        
//        let queries = QueryFactory.makeResultQueries(task: "54043886-b51c-4163-acfd-12f523722aff")
//        let endPoint = StandardEndpoint(path: K.Path.result, queryItems: queries)
//
//        print(endPoint.url)

        
    }


}

