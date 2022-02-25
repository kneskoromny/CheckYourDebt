//
//  UIElementsFactory.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 24.02.2022.
//

import UIKit

struct UIElementsFactory {
    static func makeTF(placeholder: String) -> UITextField {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        //tf.text = ""
        tf.placeholder = placeholder
        tf.borderStyle = .roundedRect
        return tf
    }
    
    static func makeBtn(action: Selector) -> UIButton {
        var configuration = UIButton.Configuration.plain()
        configuration.title = "Поиск"
        let b = UIButton(configuration: configuration, primaryAction: nil)
        b.addTarget(self, action: action, for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }
    
    static func makeStackView(axis: NSLayoutConstraint.Axis) -> UIStackView {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = axis
        sv.spacing = 20
        return sv
    }
    
    static func makeAlert(_ vc: UIViewController, title: String?, message: String?) {
        let alert = UIAlertController(
            title: title, message: message, preferredStyle: .alert
        )
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        vc.present(alert, animated: true)
    }
}
