//
//  ViewController.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 24.02.2022.
//

import UIKit

class InputViewController: UIViewController {
    
    // MARK: - UI elements
    lazy var stackView = UIElementsFactory.makeStackView(axis: .vertical)
    
    lazy var firstNameTF = UIElementsFactory.makeTF(placeholder: "Имя")
    lazy var secondNameTF = UIElementsFactory.makeTF(placeholder: "Отчество")
    lazy var lastNameTF = UIElementsFactory.makeTF(placeholder: "Фамилия")
    lazy var regionTF = UIElementsFactory.makeTF(placeholder: "Регион")
    lazy var birthTF = UIElementsFactory.makeTF(placeholder: "Дата рождения (чч.мм.гггг)")
    
    lazy var sendBtn = UIElementsFactory.makeBtn(action: #selector(action))

    // MARK: - View life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
//        let queries = QueryFactory.makePersonQueries(
//            region: "51", firstName: "Антон", secondName: "Сергеевич", lastName: "Нескоромный", birthDate: "22.02.1992"
//        )
//        let queries1 = QueryFactory.makeResultQueries(task: "d48f87d5-b337-4050-a56d-e1e8bb652f4f")
//        let endPoint = StandardEndpoint(path: K.Path.result, queryItems: queries1)
//        print(endPoint.url as Any)
//
//        let request = StandardRequest(endpoint: endPoint)
//        let networkService = StandardNetworkService(request: request)
//
//        networkService.getData(ResponseModel.self) { result in
//            switch result {
//
//            case .success(let data):
//                print(data)
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
    // MARK: - Methods
    private func configureLayout() {
        view.addSubview(stackView)
        stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        
        stackView.addArrangedSubview(firstNameTF)
        stackView.addArrangedSubview(secondNameTF)
        stackView.addArrangedSubview(lastNameTF)
        stackView.addArrangedSubview(regionTF)
        stackView.addArrangedSubview(birthTF)
        
        stackView.distribution = .fillEqually
        
        view.addSubview(sendBtn)
        sendBtn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40).isActive = true
        sendBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sendBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        sendBtn.heightAnchor.constraint(equalTo: sendBtn.widthAnchor, multiplier: 0.25).isActive = true
        
    }
    
    @objc func action() {
        print("btn pressed")
    }
}

