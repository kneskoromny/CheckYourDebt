//
//  Extension + NavController.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 27.02.2022.
//

import UIKit

extension UINavigationController {
    func makeAppearance() -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = K.Colors.customGreen
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        return appearance
    }
}

