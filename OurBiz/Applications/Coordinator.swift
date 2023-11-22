//
//  Coordinator.swift
//  OurBiz
//
//  Created by 김건우 on 11/8/23.

import UIKit

class Coordinator {
    let window: UIWindow
    init(window: UIWindow) {
        self.window = window
    }
    
    func start(){
//        let rootViewController = Main2ViewController(viewModel: ViewModel(articleService: ArticleService()))
        let rootViewController = LoginSelectViewController()
        let navigationViewController = UINavigationController(rootViewController: rootViewController)
        window.rootViewController = navigationViewController
        window.makeKeyAndVisible()
    }
}

