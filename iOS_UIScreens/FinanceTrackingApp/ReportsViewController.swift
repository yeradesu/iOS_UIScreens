//
//  ReportsViewController.swift
//  iOS_UIScreens
//
//  Created by Yerassyl Adilkhan.
//

import UIKit

class ReportsViewController: UIViewController {
    
    var separatorViewForTabBar = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setSeparatorView()
    }
    
    private func configureUI() {
        view.backgroundColor = CustomColors.backgroundColor
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
}
