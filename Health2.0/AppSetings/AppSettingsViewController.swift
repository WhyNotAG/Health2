//
//  AppSettingsViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 29/03/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class AppSettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    @IBAction func exit(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
