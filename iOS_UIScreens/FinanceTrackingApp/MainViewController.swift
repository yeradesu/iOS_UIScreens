//
//  MainViewController.swift
//  iOS_UIScreens
//
//  Created by Yerassyl Adilkhan.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - PROPERTIES
    var separatorViewForTabBar = UIView()
    var nextMonthButton = UIButton()
    var previousMonthButton = UIButton()
    var viewForTableView = UIView()
    var tableView = UITableView()
    private var balanceLabel = UILabel()
    private var moneyLabel = UILabel()
    private var timeLabel = UILabel()
    private var showMoreButton = UIButton()
    
    var expencesArray:[Expenses] = [
        Expenses(icon: UIImage(named: "Home"), category: "Дом", amount: "$321", detail: "Продукты"),
        Expenses(icon: UIImage(named: "Purchase"), category: "Покупки", amount: "$574", detail: "Одежда"),
        Expenses(icon: UIImage(named: "Transportation"), category: "Транспорт", amount: "$124", detail: "Такси"),
        Expenses(icon: UIImage(named: "Health"), category: "Здоровье", amount: "$765", detail: "Лечение"),
        Expenses(icon: UIImage(named: "Fitness"), category: "Фитнес", amount: "$324", detail: "Тренировки"),
        Expenses(icon: UIImage(named: "Bills"), category: "Счета", amount: "$726", detail: "Комунальные"),
        Expenses(icon: UIImage(named: "Restaurant"), category: "Ресторан", amount: "$325", detail: "Ужин")
    ]
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setSeparatorView()
    }
    
    // MARK: - PRIVATE FUNCTIONS
    private func configureUI() {
        view.backgroundColor = CustomColors.backgroundColor
        setupLabels()
        setupButtons()
        setupView()
        setupShowMoreButton()
        setupTableView()
        
    }
    
    private func setSeparatorView() {
        view.addSubview(separatorViewForTabBar)
        separatorViewForTabBar.translatesAutoresizingMaskIntoConstraints = false
        separatorViewForTabBar.backgroundColor = CustomColors.separatorColor
        
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self, let tabBarTop = strongSelf.tabBarController?.tabBar.topAnchor else { return }
            
            NSLayoutConstraint.activate([
                strongSelf.separatorViewForTabBar.leadingAnchor.constraint(equalTo: strongSelf.view.leadingAnchor),
                strongSelf.separatorViewForTabBar.trailingAnchor.constraint(equalTo: strongSelf.view.trailingAnchor),
                strongSelf.separatorViewForTabBar.bottomAnchor.constraint(equalTo: tabBarTop),
                strongSelf.separatorViewForTabBar.heightAnchor.constraint(equalToConstant: 1)
            ])
        }
    }
    
    private func setupLabels() {
        view.addSubview(balanceLabel)
        view.addSubview(moneyLabel)
        view.addSubview(timeLabel)
        
        balanceLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        moneyLabel.font = UIFont.systemFont(ofSize: 36, weight: .medium)
        timeLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
        
        balanceLabel.text = "Баланс"
        moneyLabel.text = "$1200.89"
        timeLabel.text = "Апрель 2020"
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            balanceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 14),
            balanceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            moneyLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 7),
            moneyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: moneyLabel.bottomAnchor, constant: 29),
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupButtons() {
        view.addSubview(previousMonthButton)
        view.addSubview(nextMonthButton)
        // there has to me one more
        
        previousMonthButton.setImage(UIImage(named: "ChevronLeft"), for: .normal)
        nextMonthButton.setImage(UIImage(named: "ChevronRight"), for: .normal)
        
        previousMonthButton.translatesAutoresizingMaskIntoConstraints = false
        nextMonthButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            previousMonthButton.heightAnchor.constraint(equalToConstant: 50),
            previousMonthButton.widthAnchor.constraint(equalToConstant: 50),
            previousMonthButton.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor, constant: -29),
            previousMonthButton.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor),
            
            nextMonthButton.heightAnchor.constraint(equalToConstant: 50),
            nextMonthButton.widthAnchor.constraint(equalToConstant: 50),
            nextMonthButton.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 29),
            nextMonthButton.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor)
        ])
    }
    
    private func setupView() {
        view.addSubview(viewForTableView)
        viewForTableView.backgroundColor = .white
        viewForTableView.layer.cornerRadius = 31
        viewForTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewForTableView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 45),
            viewForTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -96),
            viewForTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewForTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
    
    private func setupShowMoreButton() {
        viewForTableView.addSubview(showMoreButton)
        showMoreButton.translatesAutoresizingMaskIntoConstraints = false
        showMoreButton.setTitle("См. ещё", for: .normal)
        showMoreButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        showMoreButton.titleLabel?.textAlignment = .center
        showMoreButton.setTitleColor(UIColor.black, for: .normal)
        
        NSLayoutConstraint.activate([
            showMoreButton.heightAnchor.constraint(equalToConstant: 35),
            showMoreButton.widthAnchor.constraint(equalToConstant: 162),
            showMoreButton.centerXAnchor.constraint(equalTo: viewForTableView.centerXAnchor),
            showMoreButton.bottomAnchor.constraint(equalTo: viewForTableView.bottomAnchor, constant: -37)
        ])
    }
    
    private func setupTableView() {
        viewForTableView.addSubview(tableView)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 62, bottom: 0, right: 16)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.cornerRadius = 31
        tableView.rowHeight = 57
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ExpensesTableViewCell.self, forCellReuseIdentifier: ExpensesTableViewCell.identifier)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: viewForTableView.topAnchor, constant: 7),
            tableView.bottomAnchor.constraint(equalTo: showMoreButton.topAnchor, constant: -23),
            tableView.leadingAnchor.constraint(equalTo: viewForTableView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: viewForTableView.trailingAnchor)
        ])
    }
}

// MARK: - TABLEVIEW DELEGATE
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("it works, you tapped me!")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - TABLEVIEW DATASOURCE
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        expencesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExpensesTableViewCell.identifier, for: indexPath) as! ExpensesTableViewCell
        let transaction = expencesArray[indexPath.row]
        cell.configure(with: transaction)
        
        return cell
    }
}
