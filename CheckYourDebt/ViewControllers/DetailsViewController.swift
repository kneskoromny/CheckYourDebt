//
//  DetailsViewController.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 25.02.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - UI elements
    lazy var tableView = UIElementsFactory.makeTableView()
    
    // MARK: - Dependencies
    var viewModel: DetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(viewModel.data)
        
        tableView.dataSource = self
        
        configureLayout()
    }
    
    private func configureLayout() {
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
}
// MARK: - Table view data source
extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! ResultCell
        cell.mainLbl.text = "dkjfnksdvnkjsnkjng"
        cell.secondaryLbl.text = "djfnkajwnkjangkjen;fkjfn"
        return cell
    }
    
    
}
