//
//  ExpensesTableViewCell.swift
//  iOS_UIScreens
//
//  Created by Yerassyl Adilkhan on 18.01.2024.
//

import UIKit

class ExpensesTableViewCell: UITableViewCell {
    static let identifier = "ExpensesCell"
    
    // MARK: - PROPERTIES
    var icon = UIImageView()
    var category = UILabel()
    var amount = UILabel()
    var detail = UILabel()
    
    // MARK: INITIALIZATION
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PRIVATE FUNCTIONS
    private func configureCell() {
        addingSubviews()
        configureLabels()
        setConstraints()
    }
    
    private func addingSubviews() {
        addSubview(icon)
        addSubview(category)
        addSubview(amount)
        addSubview(detail)
    }
    
    private func configureLabels() {
        category.textColor = UIColor.black
        amount.textColor = UIColor.black
        detail.textColor = UIColor.gray
        
        category.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        amount.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        detail.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    private func setConstraints() {
        icon.translatesAutoresizingMaskIntoConstraints = false
        category.translatesAutoresizingMaskIntoConstraints = false
        amount.translatesAutoresizingMaskIntoConstraints = false
        detail.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            icon.heightAnchor.constraint(equalToConstant: 30),
            icon.widthAnchor.constraint(equalToConstant: 30),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            category.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 16),
            category.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            amount.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            amount.topAnchor.constraint(equalTo: topAnchor, constant: 11),
            
            detail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            detail.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -11)
        ])
    }
    
    // MARK: - PUBLIC FUNCTION
    func configure(with expenses: Expenses) {
        icon.image = expenses.icon
        category.text = expenses.category
        amount.text = expenses.amount
        detail.text = expenses.detail
    }
}
