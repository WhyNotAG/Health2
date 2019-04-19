//
//  Protocols.swift
//  Health2.0
//
//  Created by Александр Голубкин on 15/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import Foundation

protocol ModelProtocol {
    func registration(name: String, email: String, city: String, password: String)
    func check(contacts: String, password: String)
}
