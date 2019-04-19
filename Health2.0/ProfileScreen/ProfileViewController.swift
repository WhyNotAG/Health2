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
    
    @IBOutlet weak var nameTextField: CustomTextField!
    @IBOutlet weak var growthTextField: CustomTextField!
    @IBOutlet weak var widthTextField: CustomTextField!
    @IBOutlet weak var dateBirthTextField: CustomTextField!
    @IBOutlet weak var sexTextView: CustomTextField?
    @IBOutlet weak var handTextField: CustomTextField!
    @IBOutlet weak var phoneTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var stepsTextField: CustomTextField!
    @IBOutlet weak var sleepTextField: CustomTextField!
    @IBOutlet weak var systolicPressureTextField: CustomTextField!
    @IBOutlet weak var daitolicPressureTextField: CustomTextField!
    @IBOutlet weak var pulseTextField: CustomTextField!
    
    @IBOutlet var sexButton: UIButton?
    
    var sex: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 20.0
        
        let info = ProfilePresenter.getInfo()
        
        addInfo(info: info)
        
    }
    
    
    func addInfo(info: [String]){
        nameTextField.text = info[0]
        growthTextField.text = info[1]
        widthTextField.text = info[2]
        dateBirthTextField.text = info[3]
        sexTextView!.text = info[4]
        handTextField.text = info[5]
        phoneTextField.text = info[6]
        emailTextField.text = info[7]
        stepsTextField.text = info[8]
        sleepTextField.text = info[9]
        systolicPressureTextField.text = info[10]
        daitolicPressureTextField.text = info[11]
        pulseTextField.text = info[12]
        
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
