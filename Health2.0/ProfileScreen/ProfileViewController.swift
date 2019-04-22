//
//  ProfileViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 12/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameTextField: CustomTextField!
    @IBOutlet weak var growthTextField: CustomTextField!
    @IBOutlet weak var widthTextField: CustomTextField!
    @IBOutlet weak var dateBirthTextField: CustomTextField!
    @IBOutlet weak var sexTextView: CustomTextField!
    @IBOutlet weak var handTextField: CustomTextField!
    @IBOutlet weak var phoneTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var stepsTextField: CustomTextField!
    @IBOutlet weak var sleepTextField: CustomTextField!
    @IBOutlet weak var systolicPressureTextField: CustomTextField!
    @IBOutlet weak var daitolicPressureTextField: CustomTextField!
    @IBOutlet weak var pulseTextField: CustomTextField!
    
    @IBOutlet var sexButton: UIButton?
    
     var activeTextField: UITextField!
    
    var datePicker: UIDatePicker?
    var sex: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        growthTextField.delegate = self
        widthTextField.delegate = self
        dateBirthTextField.delegate = self
        handTextField.delegate = self
        phoneTextField.delegate = self
        emailTextField.delegate = self
        stepsTextField.delegate = self
        sleepTextField.delegate = self
        systolicPressureTextField.delegate = self
        daitolicPressureTextField.delegate = self
        pulseTextField.delegate = self
        
        saveButton.layer.cornerRadius = 20.0
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        dateBirthTextField.inputView = datePicker
        datePicker?.addTarget(self, action: #selector(dateChange(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGesture)
        
        growthTextField.keyboardType = .numberPad
        widthTextField.keyboardType = .numberPad
        stepsTextField.keyboardType = .numberPad
        sleepTextField.keyboardType = .numberPad
        systolicPressureTextField.keyboardType = .numberPad
        daitolicPressureTextField.keyboardType = .numberPad
        pulseTextField.keyboardType = .numberPad
        
        phoneTextField.keyboardType = .phonePad
        addInfo()
        
        registerForKeyboardNotifications()
        self.hideKeyboard()
        
        
        if UserDefaults.standard.value(forKey: "sex") != nil {
            updateSexInfo()
        }
    }
    
    deinit {
        removeForKeyboardNotifications()
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func dateChange(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateBirthTextField.text = dateFormatter.string(from: datePicker.date)
        //view.endEditing(true)
    }
    
    
    func addInfo(){
        setName(newName: ProfilePresenter.getName())
        setHeight(newHeight: ProfilePresenter.getHeight())
        setWeight(newWeight: ProfilePresenter.getWeight())
        setBirth(newBirth: ProfilePresenter.getBirth())
        setSex(newSex: ProfilePresenter.getSex())
        setHand(newHand: ProfilePresenter.getHand())
        setPhone(newPhone: ProfilePresenter.getPhone())
        setEmail()
        setSteps(newSteps: ProfilePresenter.getSteps())
        setSleep(newSleep: ProfilePresenter.getSleep())
        setSystolicPressure(newSPressure: ProfilePresenter.getSPressure())
        setDaitolicPressure(newDPressure: ProfilePresenter.getDPressure())
        setPulse(newPulse: ProfilePresenter.getPulse())
        
    }
    
    func updateSexInfo(){
        //sexButton?.setTitle(sex, for: .normal)
        sexTextView.text = UserDefaults.standard.value(forKey: "sex") as? String
        //print("test")
    }

    
    //MARK:- IBActions
    @IBAction func exit(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showSexMenu(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SexMenuViewController") as! SexMenuViewController
        vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        vc.didSelectItem = { [weak self] item in
            if let vc = self {
                self!.sexTextView.text = item
            }
        }

        self.addChild(vc)
        self.view.addSubview(vc.view)
    }
    
    
    @IBAction func showHandMenu(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HandViewController") as! HandViewController
        vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        vc.didSelectItem = { [weak self] item in
            if let vc = self {
                self!.handTextField.text = item
            }
        }
        
        self.addChild(vc)
        self.view.addSubview(vc.view)
        
    }
    
    @IBAction func saveResults(_ sender: Any) {
        ProfilePresenter.setName(name: getName())
        ProfilePresenter.setHeight(height: getHeight())
        ProfilePresenter.setWeight(weight: getWeight())
        ProfilePresenter.setBirth(birth: getBirth())
        ProfilePresenter.setSex(sex: getSex())
        ProfilePresenter.setHand(hand: getHand())
        ProfilePresenter.setPhone(phone: getPhone())
        ProfilePresenter.setSteps(steps: getSteps())
        ProfilePresenter.setSleep(sleep: getSleep())
        ProfilePresenter.setSPressure(sPressure: getSystolicPressure())
        ProfilePresenter.setDPressure(dPressure: getDaitolicPressure())
        ProfilePresenter.setPulse(pulse: getPulse())
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc func textFieldDidChange(textField: UITextField){
        textField.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //print("help")
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
                    self.contentView.frame = CGRect(x: 0, y: self.view.frame.origin.y - (editingTextFieldY! - (keyboardY - 60)), width: self.contentView.bounds.width, height: self.contentView.bounds.height)} , completion: nil)
                
            }
        }
        
    }
    
    //Закрытие клавиатуры
    @objc func kbWillHide(_ notification: Notification){
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseIn, animations: {
            self.contentView.frame = CGRect(x: 0, y: 0, width: self.contentView.bounds.width, height: self.contentView.bounds.height)} , completion: nil)
    }
    
    
    
    //MARK:- GET
    func getName() -> String {
        return nameTextField.text!
    }
    
    func getHeight() -> Int {
        return Int(growthTextField.text!)!
    }
    
    func getWeight() -> Int {
        return Int(widthTextField.text!)!
    }
    
    func getBirth() -> String {
        return dateBirthTextField.text!
    }
    
    func getSex() -> Bool {
        if sexTextView.text! == "Мужской" {
            return true
        } else { return false }
    }
    
    func getHand() -> Bool {
        if sexTextView.text! == "Правая" {
            return true
        } else { return false }
    }
    
    func getPhone() -> String {
        return phoneTextField.text!
    }
    
    func getEmail() -> String {
        return emailTextField.text!
    }
    
    func getSteps() -> Int {
        return Int(stepsTextField.text!)!
    }
    
    func getSleep() -> Int {
        return Int(sleepTextField.text!)!
    }
    
    func getSystolicPressure() -> Int {
        return Int(systolicPressureTextField.text!)!
    }
    
    func getDaitolicPressure() -> Int {
        return Int(daitolicPressureTextField.text!)!
    }
    
    func getPulse() -> Int {
        return Int(pulseTextField.text!)!
    }
    
    
    //MARK:- SET
    func setName(newName: String) {
        nameTextField.text = newName
    }
    
    func setHeight(newHeight: Int) {
        growthTextField.text = String(newHeight)
    }
    
    func setWeight(newWeight: Int){
        widthTextField.text = String(newWeight)
    }
    
    func setBirth(newBirth: String) {
        dateBirthTextField.text = newBirth
    }
    
    func setSex(newSex: Bool) {
        if newSex {
            sexTextView.text = "Мужской"
        } else { sexTextView.text = "Женский" }
    }
    
    func setHand(newHand: Bool) {
        handTextField.text = String(newHand)
        if newHand {
            handTextField.text = "Правая"
        } else { handTextField.text = "Левая" }
    }
    
    func setPhone(newPhone: String) {
        phoneTextField.text = newPhone
    }
    
    func setEmail() {
        emailTextField.text = UserDefaults.standard.value(forKey: "contact") as! String
    }
    
    func setSteps(newSteps: Int) {
        stepsTextField.text = String(newSteps)
    }
    
    func setSleep(newSleep: Int) {
        sleepTextField.text = String(newSleep)
    }
    
    func setSystolicPressure(newSPressure: Int) {
        systolicPressureTextField.text = String(newSPressure)
    }
    
    func setDaitolicPressure(newDPressure: Int) {
        daitolicPressureTextField.text = String(newDPressure)
    }
    
    func setPulse(newPulse: Int) {
        pulseTextField.text = String(newPulse)
    }
    
}

