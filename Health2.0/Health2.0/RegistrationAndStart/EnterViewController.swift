//
//  EnterViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 15/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class EnterViewController: UIViewController {


    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    
    @IBOutlet weak var healthLabel: UILabel!
    
    @IBOutlet weak var contactField: CustomTextField!
    @IBOutlet weak var passwordField: CustomTextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterButton.layer.cornerRadius = 25
        
        registrationButton.layer.cornerRadius = 25.0
        registrationButton.layer.borderWidth = 1.0
        registrationButton.layer.borderColor = (UIColor(red: 255.0 / 255.0, green: 82.0 / 255.0, blue: 57.0 / 255.0, alpha: 1.0).cgColor)
        
        passwordField.isSecureTextEntry = true
        
        if UserDefaults.standard.value(forKeyPath: "contact") != nil{
            let contactInfo = UserDefaults.standard.value(forKeyPath: "contact") as? String
            if contactInfo != "Локальный пользователь" {
                contactField.text = UserDefaults.standard.value(forKeyPath: "contact") as? String
                passwordField.text =  UserDefaults.standard.value(forKeyPath: "password") as? String
                performSegue(withIdentifier: "segueEnter", sender: nil)
            }
        }
        
        self.hideKeyboard()
        
        let attributedText = NSMutableAttributedString(string: "Здоровье ", attributes: [NSMutableAttributedString.Key.font:UIFont(name: "GothamPro-Bold", size: 19) as Any])
        
        attributedText.append(NSAttributedString(string: "2.0", attributes: [NSMutableAttributedString.Key.font:UIFont(name: "GothamPro-Bold", size: 19) as Any, NSMutableAttributedString.Key.foregroundColor: UIColor(red: 1, green: 0.32, blue: 0.22, alpha: 1)]))
        
        healthLabel.attributedText = attributedText
        
        contactField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
    }

    //MARK:- IBActions
    //вход в аккаунт
    @IBAction func enter(_ sender: Any) {
        //activityIndicator.isHidden = false
        //activityIndicator.startAnimating()
        startCheck()
      
    }
    
    //вход без регистрации
    @IBAction func freeEnter(_ sender: Any) {
        ProfilePresenter.skipRegistration()
        UserDefaults.standard.set("Пользователь", forKey: "name")
        UserDefaults.standard.set("Локальный пользователь", forKey: "contact")
        
    }
    
    //MARK: Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.contactField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
        return true
    }
    
    
    @objc func textFieldDidChange(textField: UITextField){
        textField.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    //MARK:- Check enter
    //основная проверка
    func startCheck(){
        
        var result = checkEmpty()
        result = ProfilePresenter.enter(contacts: contactField.text, password: passwordField.text)
        
       
        if result {
            UserDefaults.standard.set(contactField.text!, forKey: "contact")
            UserDefaults.standard.set(passwordField.text!, forKey: "password")
            performSegue(withIdentifier: "segueEnter", sender: nil)
            
        } else if contactField.text!.isEmpty || passwordField.text!.isEmpty{
            self.alert(title: "Ошибка", message: "Не все поля заполнены", style: .alert)
        } else {
            self.alert(title: "Ошибка", message: "Неверные данные", style: .alert)
            activityIndicator.stopAnimating()
        }
    }
    
    //проверка на пустые поля
    func checkEmpty() -> Bool{
        
        var allRight = true
        
        if contactField.text!.isEmpty {
            allRight = false
            contactField.layer.borderColor = UIColor.red.cgColor
            contactField.placeholder = "Не заполнено поле"
            self.contactField.becomeFirstResponder()
        }
        
        if passwordField.text!.isEmpty {
            allRight = false
            passwordField.layer.borderColor = UIColor.red.cgColor
            passwordField.placeholder = "Не заполнено поле"
            self.passwordField.becomeFirstResponder()
        }
        
        return allRight
    }
    
    //MARK:- Alert
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
