//
//  ViewController.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 24.02.2022.
//

import UIKit

final class InputViewController: UIViewController {
    
    // MARK: - UI elements
    private let stackView = UIElementsFactory.makeStackView(axis: .vertical)
    
    private let firstNameTF = UIElementsFactory.makeTF(placeholder: "Имя")
    private let secondNameTF = UIElementsFactory.makeTF(placeholder: "Отчество")
    private let lastNameTF = UIElementsFactory.makeTF(placeholder: "Фамилия")
    private let regionTF = UIElementsFactory.makeTF(placeholder: "Регион")
    private let birthTF = UIElementsFactory.makeTF(placeholder: "Дата рождения (чч.мм.гггг)")
    
    private let sendBtn = UIElementsFactory.makeBtn(action: #selector(action))
    
    lazy var spinner = UIElementsFactory.makeSpinner()
    
    // MARK: - Dependencies
    private let viewModel = InputViewModel()

    // MARK: - View life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.title.bind { title in
            self.navigationItem.title = ""
            var charInd = 0.0
            title.forEach { char in
                Timer.scheduledTimer(withTimeInterval: 0.1 * charInd, repeats: false) { _ in
                    self.navigationItem.title?.append(char)
                }
                charInd += 1
            }
        }
        configureLayout()
    }
    
    // MARK: - Methods
    @objc func action() {
        if viewModel.checkedEmptyFields(
            firstNameTF, secondNameTF, lastNameTF, regionTF, birthTF
        )
            && viewModel.checkedLanguage(firstNameTF, secondNameTF, lastNameTF)
            && viewModel.checkedRegion(regionTF)
            && viewModel.checkedDate(birthTF) {
            
            spinner.isHidden = false
            viewModel.getToken(
                firName: firstNameTF.text, secName: secondNameTF.text, lasName: lastNameTF.text, reg: regionTF.text, birth: birthTF.text
            ) { result in
                
                switch result {
                case .success(let task):
                    // ориентировочное время, необходимое для обработки запроса по токену
                    sleep(10)
                    self.viewModel.getResult(for: task) { [weak self] data in
                        
                        guard let self = self else { return }
                        DispatchQueue.main.async {
                            self.spinner.isHidden = true
                            guard let info = data?.response?.result?.first?.result,
                                  !info.isEmpty else {
                                UIElementsFactory.makeAlert(
                                    self, title: "Нет данных", message: "Похоже, что у вас нет долгов!"
                                )
                                return
                            }
                            self.viewModel.routeToDetails(self, info: info)
                        }
                    }
                case .failure(let error):
                    UIElementsFactory.makeAlert(
                        self, title: "Ошибка", message: error.localizedDescription
                    )
                }
            }
        } else {
            UIElementsFactory.makeAlert(
                self, title: "Ошибка", message: "Проверьте введенные данные!"
            )
        }
    }
}

// MARK: - Layout
extension InputViewController {
    private func configureLayout() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(stackView)
        stackView.heightAnchor.constraint(
            equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        stackView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor, constant: 40).isActive = true
        stackView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor, constant: -40).isActive = true
        
        stackView.addArrangedSubview(firstNameTF)
        stackView.addArrangedSubview(secondNameTF)
        stackView.addArrangedSubview(lastNameTF)
        stackView.addArrangedSubview(regionTF)
        stackView.addArrangedSubview(birthTF)
        
        view.addSubview(sendBtn)
        sendBtn.topAnchor.constraint(
            equalTo: stackView.bottomAnchor, constant: 20).isActive = true
        sendBtn.centerXAnchor.constraint(
            equalTo: view.centerXAnchor).isActive = true
        sendBtn.widthAnchor.constraint(
            equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        sendBtn.heightAnchor.constraint(
            equalTo: sendBtn.widthAnchor, multiplier: 0.25).isActive = true
        
        view.addSubview(spinner)
        spinner.centerXAnchor.constraint(
            equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(
            equalTo: view.centerYAnchor).isActive = true
    }
}


