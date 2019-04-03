//
//  ViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 28/03/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var switch1Label: UILabel!
    @IBOutlet weak var switch2Label: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        nameField.layer.cornerRadius = 15.0
        nameField.layer.borderWidth = 0.5
        nameField.clipsToBounds = true
        nameField.layer.borderColor = UIColor.darkGray.cgColor
        
        emailField.layer.cornerRadius = 15.0
        emailField.layer.borderWidth = 0.5
        emailField.clipsToBounds = true
        emailField.layer.borderColor = UIColor.darkGray.cgColor
        
        cityField.layer.cornerRadius = 15.0
        cityField.layer.borderWidth = 0.5
        cityField.clipsToBounds = true
        cityField.layer.borderColor = UIColor.darkGray.cgColor
        
        
        passwordField.layer.cornerRadius = 15.0
        passwordField.layer.borderWidth = 0.5
        passwordField.clipsToBounds = true
        cityField.layer.borderColor = UIColor.darkGray.cgColor
        
        
        self.hideKeyboard()
        button.layer.cornerRadius = 25
        
        switch1Label.text = "Я приминаю условие\nоферты"
        switch1Label.numberOfLines = 0
        
        switch2Label.text = "Получать полезные\nинформационные материалы\nпо СМС"
        switch2Label.numberOfLines = 0
        
        button.titleLabel?.font = UIFont(name: "gotham_pro_bold", size: 15)
        
        let attributedText = NSMutableAttributedString(string: "Здоровье ", attributes: [NSMutableAttributedString.Key.font:UIFont(name: "gotham_pro_bold", size: 19)])
        
        attributedText.append(NSAttributedString(string: "2.0", attributes: [NSMutableAttributedString.Key.font:UIFont(name: "gotham_pro_bold", size: 19), NSMutableAttributedString.Key.foregroundColor: UIColor(red: 1, green: 0.32, blue: 0.22, alpha: 1)]))
        healthLabel.attributedText = attributedText
        healthLabel.font = UIFont(name: "gotham_pro_bold", size: 19)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.nameField.resignFirstResponder()
        self.cityField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
        self.emailField.resignFirstResponder()
        return true
    }

}

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))

        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
