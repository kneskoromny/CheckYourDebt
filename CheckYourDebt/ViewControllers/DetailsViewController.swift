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
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        configureLayout()
        bind()
    }
    
    private func bind() {
        viewModel.title.bind { title in
            self.navigationItem.title = title
        }
        viewModel.details.bind { messages in
            self.tableView.reloadData()
        }
    }
}

// MARK: - Layout
extension DetailsViewController {
    private func configureLayout() {
        navigationItem.titleView?.backgroundColor = K.Colors.customGreen
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        tableView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40
        ).isActive = true
        tableView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor
        ).isActive = true
        tableView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor, constant: 20
        ).isActive = true
        tableView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor, constant: -20
        ).isActive = true
    }
}

// MARK: - Table view data source
extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.details.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! ResultCell
        let info = viewModel.details.value[indexPath.row]
        
        cell.mainLbl.text = info.name
        cell.secondaryLbl.text = info.subject
        return cell
    }   
}
