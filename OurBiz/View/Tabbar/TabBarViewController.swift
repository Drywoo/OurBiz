//
//  TabBarViewController.swift
//  OurBiz
//
//  Created by 김건우 on 11/16/23.
//


import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeViewController()
        let searchVC = BusinessCardListViewController()
        let libraryVC = ScheduleViewController()
        let settingVC = SettingViewController()
        
        
        homeVC.tabBarItem.image = UIImage.init(systemName: "house")
        searchVC.tabBarItem.image = UIImage.init(systemName: "magnifyingglass")
        libraryVC.tabBarItem.image = UIImage.init(systemName: "book")
        settingVC.tabBarItem.image = UIImage.init(systemName: "gear")
        // navigationController의 root view 설정
        let navigationHome = UINavigationController(rootViewController: homeVC)
        let navigationSearch = UINavigationController(rootViewController: searchVC)
        let navigationLibrary = UINavigationController(rootViewController: libraryVC)
        let navigationSetting = UINavigationController(rootViewController: settingVC)
        
        
        setViewControllers([navigationHome, navigationSearch, navigationLibrary,navigationSetting], animated: false)
    }
}
