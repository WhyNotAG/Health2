//
//  AppSettingsViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 29/03/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class AppSettingsViewController: UIViewController {

    @IBOutlet weak var PlanesChoise: UILabel!
    @IBOutlet weak var test: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test?.layer.cornerRadius = 10
        test?.layer.borderWidth = 0.5
        //test?.layer.borderColor = UIColor.white.cgColor
        test?.layer.masksToBounds = true;
        test?.clipsToBounds = true
    }
    

   
    

}
