//
//  UserInfoData.swift
//  OurBiz
//
//  Created by 김건우 on 11/21/23.
//

import Foundation

enum UserInfoData {
    case username
    case password
    case email
    case tel
}

class UserInfo {
    static func save(_ userData: UserInfoData, _ value: String) {
        UserDefaults.standard.set(value, forKey: String(describing: userData))
    }
    
    static func get(_ userData: UserInfoData) -> String? {
        return UserDefaults.standard.string(forKey: String(describing: userData))
    }
    
        static func remove(_ userData: UserInfoData) {
        UserDefaults.standard.removeObject(forKey: String(describing: userData))
    }
}
