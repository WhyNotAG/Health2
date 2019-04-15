//
//  ProfileViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 12/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var sexTextView: CustomTextField?
    
    @IBOutlet var sexButton: UIButton?
    
    var sex: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 20.0
    }
    
    func updateSexInfo(){
        sexButton?.setTitle(sex, for: .normal)
    }

    @IBAction func exit(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showSexMenu(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SexMenuViewController") as! SexMenuViewController
        vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        self.addChild(vc)
        self.view.addSubview(vc.view)
    }
}
