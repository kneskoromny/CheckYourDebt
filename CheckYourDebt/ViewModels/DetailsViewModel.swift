//
//  DetailsViewModel.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 25.02.2022.
//


struct DetailsViewModel {
    
    let title = Box(K.Titles.detail)
    let details: Box<[Info]> = Box([])
    
    init(details: [Info]) {
        self.details.value = details
    }
}
