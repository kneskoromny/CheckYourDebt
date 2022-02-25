//
//  DetailsViewModel.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 25.02.2022.
//

import Foundation

struct DetailsViewModel {
    
    var data: ResponseModel?
    
    let details: Box<[Info]> = Box([])
    
    init(data: ResponseModel?) {
        self.data = data
    }
}
