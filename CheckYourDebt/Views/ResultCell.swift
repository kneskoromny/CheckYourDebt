//
//  ResultCell.swift
//  CheckYourDebt
//
//  Created by Кирилл Нескоромный on 25.02.2022.
//

import UIKit

class ResultCell: UITableViewCell {
    
    lazy var stackView = UIElementsFactory.makeStackView(axis: .horizontal)
    lazy var mainLbl = UIElementsFactory.makeLbl(fontSize: 20)
    lazy var secondaryLbl = UIElementsFactory.makeLbl(fontSize: 15)

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        stackView.addArrangedSubview(mainLbl)
        stackView.addArrangedSubview(secondaryLbl)
        
        contentView.addSubview(stackView)
        stackView.topAnchor.constraint(
            equalTo: contentView.topAnchor, constant: 8).isActive = true
        stackView.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(
            equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }

}
