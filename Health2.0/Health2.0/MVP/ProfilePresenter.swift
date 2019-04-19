//
//  ProfilePresenter.swift
//  Health2.0
//
//  Created by Александр Голубкин on 15/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import Foundation
import RealmSwift

class ProfilePresenter {

    //проверка информации при регистрации 
    static func checkInfo(name: String?, email: String?, city: String?, password: String?) -> Bool{
        
        let testElemets = [name, email, city, password]
        var result = true
        // проверка на пустые поля
        for element in testElemets {
            if element!.isEmpty{
                result = false
                break
            } else {
                continue
            }
        }
        return result
    }
    
    
    //MARK:- Email
    //проверка почты на правильное написание
    static func isValidEmail(testStr:String?) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    //проверка почты на ее наличие у других клиентов
    static func isFirstEmail(email: String?) -> Bool{
        return Model.checkEmail(email: email!)
    }

    
    //MARK:- Password
    //проверка пароля
    static func checkPassword(password: String?) -> Bool{
        if password!.count < 6 {
            print ("pass error")
            return false
        } else {
            print("pass ok")
            return true
            
        }
    }
    
    
    //MARK:- Registrtion
    static func registration(name: String?, email: String?, city: String?, password: String?){
        Model.registration(name: name!, email: email!, city: city!, password: password!)
    }
    
    
    //MARK:- Enter
    static func enter(contacts: String?, password: String?) -> Bool {
        return Model.check(contacts: contacts!, password: password!)
    }
    
    
    //MARK:- Profile info
    static func getInfo() -> [String] {
        let info = Model.getInfo()
        return info
    }
    
}
