//
//  InputViewModel.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 24.02.2022.
//

import UIKit

struct InputViewModel {
    
    func checkedEmptyFields(_ textFields: UITextField...) -> Bool {
        var result = true
        textFields.forEach { tf in
            if tf.text == "" {
                result = false
            }
        }
        return result
    }
    
    func checkedRegion(_ region: String) -> Bool {
        var result = true
        let regions = K.getRegionCodes()
        if !regions.contains(region) {
            result = false
        }
        return result
    }
    
    func checkedDate(_ date: String) -> Bool {
        let regex = "[0-9]{2}[.][0-9]{2}[.][0-9]{4}"
        let dateTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return dateTest.evaluate(with: date)
    }
}
