//
//  DetailsViewController.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 25.02.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    var viewModel: DetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        print(viewModel.data)
        
    }
}
