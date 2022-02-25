//
//  ViewController.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 24.02.2022.
//

import UIKit

final class InputViewController: UIViewController {
    
    // MARK: - UI elements
    lazy var stackView = UIElementsFactory.makeStackView(axis: .vertical)
    
    lazy var firstNameTF = UIElementsFactory.makeTF(placeholder: "Имя")
    lazy var secondNameTF = UIElementsFactory.makeTF(placeholder: "Отчество")
    lazy var lastNameTF = UIElementsFactory.makeTF(placeholder: "Фамилия")
    lazy var regionTF = UIElementsFactory.makeTF(placeholder: "Регион")
    lazy var birthTF = UIElementsFactory.makeTF(placeholder: "Дата рождения (чч.мм.гггг)")
    
    lazy var sendBtn = UIElementsFactory.makeBtn(action: #selector(action))
    
    // MARK: - Dependencies
    private let viewModel = InputViewModel()

    // MARK: - View life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
    }
    
    // MARK: - Methods
    @objc func action() {
        // TODO: добавить спиннер
        
        if viewModel.checkedEmptyFields(
            firstNameTF, secondNameTF, lastNameTF, regionTF, birthTF
        )
            && viewModel.checkedLanguage(firstNameTF, secondNameTF, lastNameTF)
            && viewModel.checkedRegion(regionTF)
            && viewModel.checkedDate(birthTF) {
            
            print("all fields checked")
            viewModel.getToken(
                firName: firstNameTF.text, secName: secondNameTF.text, lasName: lastNameTF.text, reg: regionTF.text, birth: birthTF.text
            ) { task in
                sleep(5)
                self.viewModel.getResult(for: task) { data in
                    
                    DispatchQueue.main.async {
                        guard let info = data?.response?.result?.first?.result else {
                            UIElementsFactory.makeAlert(
                                self, title: "Нет данных", message: "Похоже, что у вас нет долгов!"
                            )
                            return
                        }
                        let detailsViewModel = DetailsViewModel(details: info)
                        let detailsVC = DetailsViewController()
                        detailsVC.viewModel = detailsViewModel
                        
                        self.present(detailsVC, animated: true, completion: nil)
                    }
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
        view.addSubview(stackView)
        stackView.heightAnchor.constraint(
            equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        stackView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
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
            equalTo: stackView.bottomAnchor, constant: 40).isActive = true
        sendBtn.centerXAnchor.constraint(
            equalTo: view.centerXAnchor).isActive = true
        sendBtn.widthAnchor.constraint(
            equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        sendBtn.heightAnchor.constraint(
            equalTo: sendBtn.widthAnchor, multiplier: 0.25).isActive = true
    }
}


