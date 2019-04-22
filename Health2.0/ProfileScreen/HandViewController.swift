//
//  HandViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 19/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class HandViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var leftButton: UIButton!
    
    @IBOutlet weak var rightButton: UIButton!
    
    var hand = ""
    var didSelectItem: ((_ item: String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        contentView.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        
        leftButton.layer.cornerRadius = 15.0
        rightButton.layer.cornerRadius = 15.0
        
        
    }
    
    
    @IBAction func closeMenu(_ sender: Any) {
        self.removeFromParent()
        self.view.removeFromSuperview()
    }
    
    @IBAction func chooseLeft(_ sender: Any) {
        self.removeFromParent()
        self.view.removeFromSuperview()
        hand = "Левая"
        didSelectItem?(hand)
    }
    
    @IBAction func chooseRight(_ sender: Any) {
        self.removeFromParent()
        self.view.removeFromSuperview()
        hand =  "Правая"
        didSelectItem?(hand)
    }


}
