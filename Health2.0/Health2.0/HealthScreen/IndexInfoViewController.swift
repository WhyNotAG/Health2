//
//  IndexInfoViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 22/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class IndexInfoViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UITextView!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = UserDefaults.standard.value(forKey: "info") as? String
        checkInfo()
        contentView.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        
        // Do any additional setup after loading the view.
    }
    

     @IBAction func close(_ sender: Any) {
        self.removeFromParent()
        self.view.removeFromSuperview()
     }

    @IBAction func closeAll(_ sender: Any) {
        self.removeFromParent()
        self.view.removeFromSuperview()
    }
    
    func checkInfo(){
        if titleLabel.text != "Истощение" {
            infoLabel.text = ""
        }
    }
}
