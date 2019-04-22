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
    //MARK:- Defaults
    private static let DEFAULT_SYSOLIC_PRESSURE = 120
    private static let DEFAULT_DAITOLIC_PRESSURE = 80
    private static let DEFAULT_PULSE = 80
    private static let DEFAULT_HEIGHT = 170
    private static let DEFAULT_WEIGHT = 70
    private static let DEFAULT_DOEST_STEPS = 8000
    private static let DEFAULT_DOEST_SLEEP = 8
    
    //MARK:- Registration
    static func registration(name: String, email: String, city: String, password: String){
        
        let person = Profile()
        
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self)
        
        person.localUserId = 1000000000 + profiles.count
        person.name = name
        person.email = email
        person.city = city
        person.systolicPressure = DEFAULT_SYSOLIC_PRESSURE
        person.daitolicPressure = DEFAULT_DAITOLIC_PRESSURE
        person.pulse = DEFAULT_PULSE
        person.height = DEFAULT_HEIGHT
        person.weight = DEFAULT_WEIGHT
        person.doestSteps = DEFAULT_DOEST_STEPS
        person.doestSleepHour = DEFAULT_DOEST_SLEEP
        
        //хэширование пароля
        let hashPassword: String = generateHashPassword(password: password)
        
        //изменение внутри пароля под новую версию
        var test = hashPassword
        let index = test.index(test.startIndex, offsetBy: 2)
        test.replaceSubrange(index...index, with: "y")
        print(test)
        person.password = test
        
        try! realm.write {
            realm.add(person)
        }
        
        print(profiles.count)
    }
    
    //проверка почты на наличие одинаковых
    static func checkEmail(email: String) -> Bool {
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        
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
        
        let profiles = realm.objects(Profile.self).filter("email = '\(contacts)'")
        
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
    
    
    static func skipRegistration(){
        let realm = try! Realm()
        
        let profiles = realm.objects(Profile.self).filter("name = 'Пользователь'")
        
        let allProfiles = realm.objects(Profile.self)
        
        if profiles.count == 0 {
            let profile = Profile()
            profile.name = "Пользователь"
            profile.email = "Локальный пользователь"
            profile.localUserId = 100000000 + allProfiles.count
            profile.systolicPressure = DEFAULT_SYSOLIC_PRESSURE
            profile.daitolicPressure = DEFAULT_DAITOLIC_PRESSURE
            profile.pulse = DEFAULT_PULSE
            profile.height = DEFAULT_HEIGHT
            profile.weight = DEFAULT_WEIGHT
            profile.doestSteps = DEFAULT_DOEST_STEPS
            profile.doestSleepHour = DEFAULT_DOEST_SLEEP
            
            try! realm.write {
                realm.add(profile)
            }
        }
        
    }
    
    //MARK:- Profile information
    
    static func getName() -> String {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        return profile["name"] as! String
    }
    
    static func getHeight() -> Int {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        return profile["height"] as! Int
    }
    
    static func getWeight() -> Int {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        return profile["weight"] as! Int
    }
    
    static func getSex() -> Bool {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        return profile["sex"] as! Bool
    }
    
    static func getHand() -> Bool {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        return profile["hand"] as! Bool
    }
    
    static func getSteps() -> Int {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        return profile["doestSteps"] as! Int
    }
    
    static func getSleep() -> Int {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        return profile["doestSleepHour"] as! Int
    }
    
    static func getSPressure() -> Int {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        return profile["systolicPressure"] as! Int
    }
    
    static func getDPressure() -> Int {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        return profile["daitolicPressure"] as! Int
    }
    
    static func getPulse() -> Int {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        return profile["pulse"] as! Int
    }
    
    static func getBirth() -> String {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        return profile["dateBirth"] as! String
    }
    
    static func getPhone() -> String {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        return profile["phone"] as! String
    }
    
    
    //MARK:- SET
    static func setName(name: String) {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        try! realm.write {
            profile.name = name
        }
    }
    
    static func setHeight(height: Int) {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        try! realm.write {
            profile["height"] = height
        }
    }
    
    static func setWeight(weight: Int) {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        try! realm.write {
            profile["weight"] = weight
        }
    }
    
    static func setSex(sex: Bool) {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        try! realm.write {
            profile["sex"] = sex
        }
    }
    
    static func setHand(hand: Bool) {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        try! realm.write {
            profile["hand"] = hand
        }
    }
    
    static func setSteps(steps: Int) {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        try! realm.write {
            profile["doestSteps"] = steps
        }
    }
    
    static func setSleep(sleep: Int) {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        try! realm.write {
            profile["doestSleepHour"] = sleep
        }
    }
    
    static func setSPressure(sPressure: Int) {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        try! realm.write {
            profile["systolicPressure"] = sPressure
        }
    }
    
    static func setDPressure(dPressure: Int) {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        try! realm.write {
            profile["daitolicPressure"] = dPressure
        }
    }
    
    static func setPulse(pulse: Int) {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        try! realm.write {
            profile["pulse"] = pulse
        }
        print(profile)
    }
    
    static func setBirth(birth: String) {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        try! realm.write {
            profile["dateBirth"] = birth
        }
    }
    
    static func setPhone(phone: String) {
        let email = UserDefaults.standard.value(forKeyPath: "contact") as! String
        let realm = try! Realm()
        let profiles = realm.objects(Profile.self).filter("email = '\(email)'")
        let profile = profiles[0]
        try! realm.write {
            profile["phone"] = phone
        }
    }
    
    
    
    
    
    
    
    
    
    
}
