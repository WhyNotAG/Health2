//
//  Model.swift
//  Health2.0
//
//  Created by Александр Голубкин on 15/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import Foundation
import RealmSwift
import BCryptSwift

class Model{
    
    //MARK:- Registration
    static func registration(name: String, email: String, city: String, password: String){
        
        let person = personProfile()
        
        let realm = try! Realm()
        let profiles = realm.objects(personProfile.self)
        person.localUserId = 1000000000 + profiles.count
        person.name = name
        person.email = email
        person.city = city
        
        let hashPassword = generateHashPassword(password: password)
        print(hashPassword)
        person.password = hashPassword
        
        try! realm.write {
            realm.add(person)
        }
        
        print(profiles.count)
    }
    
    //проверка почты на наличие одинаковых
    static func checkEmail(email: String) -> Bool {
        let realm = try! Realm()
        let profiles = realm.objects(personProfile.self).filter("email = '\(email)'")
        
        if profiles.count > 0 {
            return false
        } else {
            return true
        }
    }
    
    //MARK:- Add
    static func check(contacts: String, password: String) -> Bool {
        
        var result = false
        let realm = try! Realm()
        
        let profiles = realm.objects(personProfile.self).filter("email = '\(contacts)'")
        
        if profiles.count == 0 {
            result = false
        } else {
            let profile = profiles[0]
            let hashPassword = profile["password"]
            result = BCryptSwift.verifyPassword(password, matchesHash: hashPassword as! String) ?? false
            UserDefaults.standard.set(profile["name"], forKey: "name")
        }
        return result
    }
    
    //генерация хэш-пароля
    static func generateHashPassword(password: String) -> String{
        let salt = BCryptSwift.generateSaltWithNumberOfRounds(10)
        let pass = BCryptSwift.hashPassword(password, withSalt: salt)
        return pass!
    }
    
    //MARK:- Profile information
    static func getInfo() -> [String] {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        var array: [String] = []
        let realm = try! Realm()
        
        let profiles = realm.objects(personProfile.self).filter("email = '\(email)'")
        print(profiles[0])
        if profiles.count == 1 {
            let profile = profiles[0]
            array.append(profile["name"] as! String)
            array.append(profile["height"] as! String)
            array.append(profile["weight"] as! String)
            array.append(profile["dateBirth"] as! String)
            array.append(profile["sex"] as! String)
            array.append(profile["hand"] as! String)
            array.append(profile["phone"] as! String)
            array.append(profile["email"] as! String)
            array.append(profile["doestSteps"] as! String)
            array.append(profile["doestSleepHour"] as! String)
            array.append(profile["systolicPressure"] as! String)
            array.append(profile["daitolicPressure"] as! String)
            array.append(profile["pulse"] as! String)
        }
        
        return array
    }
    
}
