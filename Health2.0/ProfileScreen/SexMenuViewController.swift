//
//  SexMenuViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 12/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class SexMenuViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var manButton: UIButton!
    
    @IBOutlet weak var womanButton: UIButton!

    var sex = ""
    var didSelectItem: ((_ item: String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        contentView.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        
        manButton.layer.cornerRadius = 15.0
        womanButton.layer.cornerRadius = 15.0
        
        
    }
    
    
    @IBAction func closeMenu(_ sender: Any) {
        self.removeFromParent()
        self.view.removeFromSuperview()
    }
    
    @IBAction func chooseMan(_ sender: Any) {
        self.removeFromParent()
        self.view.removeFromSuperview()
        sex = "Мужской"
        UserDefaults.standard.set("Мужской", forKey: "sex")
        didSelectItem?(sex)
    }
    
    @IBAction func chooseWoman(_ sender: Any) {
        self.removeFromParent()
        self.view.removeFromSuperview()
        UserDefaults.standard.set("Женский", forKey: "sex")
        sex =  "Женский"
        didSelectItem?(sex)
    }


}

