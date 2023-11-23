//
//  CardInfoData.swift
//  OurBiz
//
//  Created by 김건우 on 11/21/23.
//

import Foundation
import RealmSwift

//class CardInfoObject: Object {
//    @objc dynamic var id = UUID().uuidString
//    @objc dynamic var value: String = ""
//
//    override static func primaryKey() -> String? {
//        return "id"
//    }
//}

class CardInfoObject: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var email: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}

enum CardInfoData: String {
    case username
    case password
    case email
    case tel
}

class CardInfo {
    static let realm = try! Realm()
    
    static func save(_ cardInfoObject: CardInfoObject?) {
        if let cardInfo = cardInfoObject {
            do {
                try realm.write {
                    realm.add(cardInfo)
                }
            } catch {
                print("Error saving data: \(error)")
            }
        }
    }
    
    static func getAll() -> Results<CardInfoObject>? {
        
        return realm.objects(CardInfoObject.self)
        
    }
    
    //    static func save(_ cardData: CardInfoData, _ value: String) {
    //        let cardInfoObject = CardInfoObject()
    //        cardInfoObject.value = value
    //
    //        do {
    //            try realm.write {
    //                realm.add(cardInfoObject, update: .modified)
    //            }
    //        } catch {
    //            print("Error saving data: \(error)")
    //        }
    //    }
    
    //        static func get(_ cardData: CardInfoData) -> String? {
    //            let cardInfoObject = realm.object(ofType: CardInfoObject.self, forPrimaryKey: cardData.rawValue)
    //            return cardInfoObject?.value
    //        }
    
    static func remove(_ cardData: CardInfoData) {
        if let cardInfoObject = realm.object(ofType: CardInfoObject.self, forPrimaryKey: cardData.rawValue) {
            do {
                try realm.write {
                    realm.delete(cardInfoObject)
                }
            } catch {
                print("Error removing data: \(error)")
            }
        }
    }
}

