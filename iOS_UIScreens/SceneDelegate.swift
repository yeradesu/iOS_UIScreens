//
//  MainViewController.swift
//  iOS_UIScreens
//
//  Created by Yerassyl Adilkhan.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // MARK: UNCOMMENT THIS TO SEE THE TRAVEL APP (don't forget to comment code for the screens of the second project)
//        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
//        window?.windowScene = windowScene
//        window?.rootViewController = TravelViewController()
//        window?.makeKeyAndVisible()
        
        // MARK: SECOND PROJECT: FINANCE TRACKING APP
        let mainVC = MainViewController()
        let reportsVC = ReportsViewController()
        let profileVC = ProfileViewController()
        
        // configuring tab bar items
        mainVC.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(named: "Main"), tag: 0)
        mainVC.tabBarItem.selectedImage = UIImage(named: "MainSelected")?.withRenderingMode(.alwaysOriginal)
        mainVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        mainVC.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: 0, bottom: -3, right: 0)
        
        reportsVC.tabBarItem = UITabBarItem(title: "Отчёты", image: UIImage(named: "Report"), tag: 1)
        reportsVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        reportsVC.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: 0, bottom: -3, right: 0)
        
        profileVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "Profile"), tag: 2)
        profileVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        profileVC.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: 0, bottom: -3, right: 0)
        
        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers = [mainVC, reportsVC, profileVC]
        UITabBar.appearance().tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
    }


    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}

