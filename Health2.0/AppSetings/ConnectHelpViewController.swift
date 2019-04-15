//
//  ConnectHelpViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 12/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class ConnectHelpViewController: UIViewController {


    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var registrationButton: UIButton!
    
    @IBOutlet weak var infoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        nameField.layer.cornerRadius = 15.0
        nameField.layer.borderWidth = 0.5
        nameField.clipsToBounds = true
        nameField.layer.borderColor = UIColor.darkGray.cgColor
        
       infoTextView.layer.cornerRadius = 15.0
       infoTextView.layer.borderWidth = 0.5
       infoTextView.clipsToBounds = true
       infoTextView.layer.borderColor = UIColor.darkGray.cgColor
        registrationButton.layer.cornerRadius = 25
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
