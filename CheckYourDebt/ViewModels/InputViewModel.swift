//
//  InputViewModel.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 24.02.2022.
//

import UIKit.UITextField
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
    func checkedLanguage(_ textFields: UITextField...) -> Bool {
        var result = true
        let alphabet = K.getAlphabet()
        textFields.forEach { tf in
            guard let text = tf.text else {
                result = false
                return
            }
            for char in text {
                if !alphabet.contains(char) {
                    result = false
                    break
                }
            }
        }
        return result
    }
    
    func checkedRegion(_ region: UITextField) -> Bool {
        var result = true
        let regions = K.getRegionCodes()
        guard let text = region.text else {
            return false
        }
        if !regions.contains(text) {
            result = false
        }
        return result
    }
    
    func checkedDate(_ date: UITextField) -> Bool {
        guard let text = date.text else {
            return false
        }
        let regex = "[0-9]{2}[.][0-9]{2}[.][0-9]{4}"
        let dateTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return dateTest.evaluate(with: text)
    }
}
