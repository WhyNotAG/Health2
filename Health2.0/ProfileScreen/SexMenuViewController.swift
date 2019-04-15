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

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        contentView.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        
        manButton.layer.cornerRadius = 15.0
        womanButton.layer.cornerRadius = 15.0
        
        
    }
    
    func initViewController(sex: String){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        vc.sex = sex
        vc.updateSexInfo()
    }
    
    
    @IBAction func closeMenu(_ sender: Any) {
        self.removeFromParent()
        self.view.removeFromSuperview()
    }
    
    @IBAction func chooseMan(_ sender: Any) {
        self.removeFromParent()
        self.view.removeFromSuperview()
        initViewController(sex: "Мужской")
       
    }
    
    @IBAction func chooseWoman(_ sender: Any) {
        self.removeFromParent()
        self.view.removeFromSuperview()
        initViewController(sex: "Женский")
    }
    


}
