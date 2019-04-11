//
//  BandSettingsViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 09/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class BandSettingsViewController: UIViewController {
    
    @IBOutlet weak var handLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        handLabel.text = "Включение экрана на\nподнятие руки"
        // Do any additional setup after loading the view.
    }
    


    @IBAction func exit(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
