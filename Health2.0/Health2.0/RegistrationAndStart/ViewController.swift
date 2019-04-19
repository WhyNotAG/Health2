//
//  ViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 28/03/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit
class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var switch1Label: UILabel!
    @IBOutlet weak var switch2Label: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var offerSwitch: UISwitch!
    
    var activeTextField: UITextField!
    
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
        passwordField.isSecureTextEntry = true
        cityField.layer.borderColor = UIColor.darkGray.cgColor
        
        registerForKeyboardNotifications()
        self.hideKeyboard()
        
        button.layer.cornerRadius = 25
        
        switch1Label.text = "Я приминаю условие\nоферты"
        switch1Label.numberOfLines = 0
        
        switch2Label.text = "Получать полезные\nинформационные материалы\nпо СМС"
        switch2Label.numberOfLines = 0
        
        
        let attributedText = NSMutableAttributedString(string: "Здоровье ", attributes: [NSMutableAttributedString.Key.font:UIFont(name: "GothamPro-Bold", size: 19) as Any])
        
        attributedText.append(NSAttributedString(string: "2.0", attributes: [NSMutableAttributedString.Key.font:UIFont(name: "GothamPro-Bold", size: 19) as Any, NSMutableAttributedString.Key.foregroundColor: UIColor(red: 1, green: 0.32, blue: 0.22, alpha: 1)]))
        
        
        healthLabel.attributedText = attributedText
        //healthLabel.font = UIFont(name: "GothamPro-Bold", size: 19)
        
        nameField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        cityField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        emailField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
    }
    
    
    deinit {
        removeForKeyboardNotifications()
    }
    
    //MARK:- Keyboard
    //Скрытие кнопки по нажатию ввод
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.nameField.resignFirstResponder()
        self.cityField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
        self.emailField.resignFirstResponder()
        return true
    }

    @objc func textFieldDidChange(textField: UITextField){
       textField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    //Управление notifications
    func registerForKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //Удаление notifications
    func removeForKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //Открытие клавиатуры
    @objc func kbWillShow(_ notification: Notification){
        let userInfo = notification.userInfo
        let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardY = self.view.frame.size.height - kbFrameSize.height
        
        let editingTextFieldY: CGFloat! = self.activeTextField.frame.origin.y
        
        if self.view.frame.origin.y >= 0 {
            
            if editingTextFieldY > keyboardY - 60 {
                UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseIn, animations: {
                    self.view.frame = CGRect(x: 0, y: self.view.frame.origin.y - (editingTextFieldY! - (keyboardY - 70)), width: self.view.bounds.width, height: self.view.bounds.height)} , completion: nil)
                
            }
        }
        
    }
    
    //Закрытие клавиатуры
    @objc func kbWillHide(_ notification: Notification){
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)} , completion: nil)
    }
    
    
    //MARK:- Registration(Connect to presenter)
    @IBAction func registration(_ sender: Any) {
        
        var allRight = checkForEmpty()
        var result = true
        
        allRight = ProfilePresenter.checkInfo(name: nameField.text, email: emailField.text, city: cityField.text, password: passwordField.text)
        if !allRight {
            self.alert(title: "Ошибка", message: "Не все поля заполнены", style: .alert)
            result = false
        }
        
        allRight = ProfilePresenter.isValidEmail(testStr: emailField.text)
        if !allRight {
            self.alert(title: "Ошибка", message: "Неправильно введена почта", style: .alert)
            result = false
        }
        
        allRight = ProfilePresenter.isFirstEmail(email: emailField.text)
        if !allRight {
            self.alert(title: "Ошибка", message: "Эта почта уже используется", style: .alert)
            result = false
        }
        
        allRight = ProfilePresenter.checkPassword(password: passwordField.text)
        if !allRight {
            self.alert(title: "Ошибка", message: "Пароль слишком короткий", style: .alert)
            result = false
        }
        
        if !offerSwitch.isOn{
            self.alert(title: "Ошибка", message: "Примите условие оферты", style: .alert)
            result = false
        }
        
        if result {
            ProfilePresenter.registration(name: nameField.text, email: emailField.text, city: cityField.text, password: passwordField.text)
            UserDefaults.standard.set(nameField.text, forKey: "name")
            UserDefaults.standard.set(emailField.text, forKey: "contact")
            performSegue(withIdentifier: "segueReg", sender: nil)
        }
    }
    
    
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func checkForEmpty() -> Bool {
        
        var allRight = true
        
        if nameField.text!.isEmpty {
            allRight = false
            nameField.layer.borderColor = UIColor.red.cgColor
            nameField.placeholder = "Не заполнено поле"
            self.nameField.becomeFirstResponder()
        }
        
        if cityField.text!.isEmpty {
            allRight = false
            cityField.layer.borderColor = UIColor.red.cgColor
            cityField.placeholder = "Не заполнено поле"
            self.cityField.becomeFirstResponder()
        }
        
        if passwordField.text!.isEmpty {
            allRight = false
            passwordField.layer.borderColor = UIColor.red.cgColor
            passwordField.placeholder = "Не заполнено поле"
            self.passwordField.becomeFirstResponder()
        }
        
        if emailField.text!.isEmpty {
            allRight = false
            emailField.layer.borderColor = UIColor.red.cgColor
            emailField.placeholder = "Не заполнено поле"
            self.emailField.becomeFirstResponder()
        }
        
        return allRight
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
