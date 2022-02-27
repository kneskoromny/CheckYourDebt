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
        tf.text = ""
        tf.placeholder = placeholder
        tf.borderStyle = .roundedRect
        return tf
    }
    
    static func makeBtn(action: Selector) -> UIButton {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Поиск"
        configuration.baseBackgroundColor = K.Colors.customBlue
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
        sv.distribution = .fillEqually
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
    
    static func makeTableView() -> UITableView {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(ResultCell.self, forCellReuseIdentifier: "resultCell")
        return tv
    }
    
    static func makeLbl(fontSize: CGFloat) -> UILabel {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont(name: "Menlo", size: fontSize)
        l.numberOfLines = 0
        return l
    }
    
    static func makeSpinner() -> UIActivityIndicatorView {
        let s = UIActivityIndicatorView()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.style = .large
        s.startAnimating()
        s.isHidden = true
        return s
    }
}
