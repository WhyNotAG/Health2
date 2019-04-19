//
//  Profile.swift
//  Health2.0
//
//  Created by Александр Голубкин on 15/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import Foundation
import RealmSwift

class personProfile: Object {
    
    @objc var name = ""
    @objc var token = ""
    @objc var height = ""
    @objc var weight = ""
    @objc var sex = ""
    @objc var hand = 0
    @objc var doestSteps = 0
    @objc var doestSleepHour = 0
    @objc var systolicPressure = 0
    @objc var daitolicPressure = 0
    @objc var pulse = 0
    @objc var dateBirth = 0
    
    //id с сервера
    @objc var id = 0
    
    //1000000000 + кол-во записей в бд
    @objc var localUserId = 0
    
    //encrypted password
    @objc var email = ""
    @objc var phone = ""
    @objc var password = ""
    @objc var city = ""
    
    
}
