//
//  AppDelegate.swift
//  OurBiz
//
//  Created by 김건우 on 11/8/23.
//

// AppDelegate.swift

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        do {
              let realm = try Realm()
          } catch {
              print("Error initialising new realm \(error)")
          }
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        
        // 세로방향 고정
        return UIInterfaceOrientationMask.portrait
        
    }
}
