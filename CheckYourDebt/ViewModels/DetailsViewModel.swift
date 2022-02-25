//
//  DetailsViewModel.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 25.02.2022.
//

import Foundation

struct DetailsViewModel {
    
    var data: ResponseModel?
    
    init(data: ResponseModel?) {
        self.data = data
    }
}
