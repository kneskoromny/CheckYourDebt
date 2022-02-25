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
        firstNameTF.delegate = self
        
    }
    
    // MARK: - UI actions
    
    
    // MARK: - Methods
    private func configureLayout() {
        view.addSubview(stackView)
        stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
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
// MARK: - Text Field Delegate
extension InputViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textFieldText = textField.text ?? ""
        let text = (textFieldText as NSString).replacingCharacters(in: range, with: string)
        
        //if textField == firstNameTF { firName = text }
        
        return true
    }
}

