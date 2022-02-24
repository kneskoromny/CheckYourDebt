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
        tf.placeholder = placeholder
        tf.borderStyle = .roundedRect
        return tf
    }
    
    static func makeBtn(action: Selector) -> UIButton {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = K.Colors.customBlue
        b.setTitle("Поиск", for: .normal)
        b.addTarget(self, action: action, for: .touchUpInside)
        return b
    }
    
    static func makeStackView(axis: NSLayoutConstraint.Axis) -> UIStackView {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = axis
        sv.spacing = 40
        return sv
    }
}
