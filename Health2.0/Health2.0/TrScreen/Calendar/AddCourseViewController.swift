//
//  AddCourseViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 23/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class AddCourseViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var dateTextField: CustomTextField!
    @IBOutlet weak var daysTextField: CustomTextField!
    @IBOutlet weak var timeTextField: CustomTextField!
    @IBOutlet weak var nameTextField: CustomTextField!
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var formButton: DropDownButton!
    
    @IBOutlet weak var addTimeButton: UIButton!
    @IBOutlet weak var saveCourse: UIButton!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    var datePicker: UIDatePicker?
    var timePicker: UIDatePicker?
    
    var count: Int! = 0
    var timeArr: [TimeView]! = []
    
    var activeField: UITextField!
    let tooBar: UIToolbar! = UIToolbar()
    var scrollHeight: CGFloat!
    
    var constrArr: [NSLayoutConstraint]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveCourse.layer.cornerRadius = 20.0
        nameTextField.delegate = self
        dateTextField.delegate = self
        timeTextField.delegate = self
        daysTextField.delegate = self
        scrollHeight = scrollView.frame.height
        //self.hideKeyboard()
        
        registerForKeyboardNotifications()
        self.view.bringSubviewToFront(formButton)
        formButton.isUserInteractionEnabled = true
        let teste: NSLayoutConstraint
        teste = addTimeButton.topAnchor.constraint(equalTo: timeTextField.bottomAnchor, constant: 16)
        teste.isActive = true
        constrArr.append(teste)
        addTimeButton.layer.cornerRadius = 25.0
        addTimeButton.layer.borderWidth = 1.0
        addTimeButton.layer.borderColor = (UIColor(red: 53.0 / 255.0, green: 125.0 / 255.0, blue: 159.0 / 255.0, alpha: 1.0).cgColor)
        
        
        tooBar.barStyle = UIBarStyle.default
        tooBar.items=[
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Готово", style: UIBarButtonItem.Style.done, target: self, action: #selector(donePressed))]
        tooBar.sizeToFit()
        
        dateTextField.inputAccessoryView = tooBar
        timeTextField.inputAccessoryView = tooBar
        daysTextField.inputAccessoryView = tooBar
        nameTextField.inputAccessoryView = tooBar
        formButton.dropDownMenu.dropDownOptions = ["Таблетки", "Капсула", "Порошок", "Капли", "Инъекция", "Капельница"]
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        dateTextField.inputView = datePicker
        datePicker?.addTarget(self, action: #selector(dateChange(datePicker:)), for: .valueChanged)
        
        //let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        //contentView.addGestureRecognizer(tapGesture)
        
        daysTextField.keyboardType = .numberPad
        
        timeTextField.delegate = self
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        timeTextField.inputView = timePicker
        timePicker?.addTarget(self, action: #selector(timeChange), for: .valueChanged)
        
        let test: NSLayoutConstraint
        test = addTimeButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16)
        constrArr.append(test)
        constrArr.last?.isActive = true
    }
    
    deinit {
        removeForKeyboardNotifications()
    }
    
    @objc func donePressed () {
        
        for el in timeArr{
            if el.timeField.text == activeField.text && el.timeField !== activeField {
                activeField.text = ""
            }
        }
        
        if activeField !== timeTextField && activeField.text == timeTextField.text{
            activeField.text = ""
        }
        view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.nameTextField.resignFirstResponder()
        self.timeTextField.resignFirstResponder()
        self.daysTextField.resignFirstResponder()
        self.dateTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
    
    @objc func dateChange(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateTextField.text = dateFormatter.string(from: datePicker.date)
        //view.endEditing(true)
    }
    
    @objc func timeChange(datePicker: UIDatePicker, dateView: CustomTextField) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        if let element = activeField {
            element.text = dateFormatter.string(from: datePicker.date)
        } else { timeTextField.text = dateFormatter.string(from: datePicker.date) }
    }
    
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
                view.endEditing(true)
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addTime(_ sender: Any) {
        count += 1
        let tf: TimeView
        if timeArr.count <= 5{
            if timeArr.isEmpty{
                 tf = TimeView(frame: CGRect(x: 16, y: timeTextField.frame.minY + timeTextField.frame.height + 16, width: timeTextField.frame.width, height: timeTextField.frame.height))
            } else {
                tf = TimeView(frame: CGRect(x: 16, y: timeArr.last!.frame.minY + timeArr.last!.frame.height + 16, width: timeArr.last!.frame.width, height: timeArr.last!.frame.height))
            }
            
            self.stackView.addArrangedSubview(tf)
            tf.delButton.addTarget(self, action: #selector(delElement(time:)), for: .touchUpInside)
            
            for el in constrArr {
                el.isActive = false
            }
            
            
            tf.timeField.inputAccessoryView = tooBar
        
            tf.timeField.font = UIFont(name: "GothamPro-Bold", size: 17)
            tf.timeField.textColor = .darkGray
            
            let spacerView = UIView(frame:CGRect(x:0, y:0, width:5, height:5))
            tf.timeField.leftViewMode = UITextField.ViewMode.always
            tf.timeField.leftView = spacerView
            
            addPicker(selectedView: tf.timeField)
            timeArr.append(tf)
            scrollHeight += tf.frame.height / 2
            //print(scrollHeight)
            
            //contentView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollHeight)
            scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollHeight)
            //scrollView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollHeight)
            
            self.contentView.sendSubviewToBack(tf)
            //test.isActive = false
        }
    }
    
    @objc func delElement(time: UIButton){
        timeArr.removeAll(where:{$0.delButton === time})
        
        for el in timeArr {
            print(el.timeField.text)
        }
    }
    
    
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
        
        let editingTextFieldY: CGFloat! = self.activeField.frame.origin.y
        
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
    
    func addPicker(selectedView: CustomTextField){
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        selectedView.inputView = timePicker
        timePicker?.addTarget(self, action: #selector(timeChange), for: .allEvents)
        selectedView.delegate = self
    }
}






protocol dropDownProtocol {
    func dropDownPressed(string: String)
}



class DropDownButton : UIButton, dropDownProtocol {
    
    func dropDownPressed(string: String) {
        self.setTitle(" \(string)", for: .normal)
        self.dismissDropDown()
    }
    
    
    var dropDownMenu = DropDownView()
    var height = NSLayoutConstraint()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        dropDownMenu = DropDownView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        dropDownMenu.delegate = self
        dropDownMenu.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func didMoveToSuperview() {
        self.superview?.addSubview(dropDownMenu)
        self.superview?.bringSubviewToFront(dropDownMenu)
        
        height = dropDownMenu.heightAnchor.constraint(equalToConstant: 0)
    }
    var isOpen = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dropDownMenu.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropDownMenu.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropDownMenu.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        if !isOpen {
            isOpen = true
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 260
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropDownMenu.layoutIfNeeded()
                self.dropDownMenu.center.y += self.dropDownMenu.frame.height / 2
            }, completion: nil)
        } else {
            isOpen = false
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropDownMenu.center.y -= self.dropDownMenu.frame.height / 2
                self.dropDownMenu.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    func viewWillLayoutSubviews() {
        dropDownMenu.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropDownMenu.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropDownMenu.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    func dismissDropDown(){
        isOpen = false
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropDownMenu.center.y -= self.dropDownMenu.frame.height / 2
            self.dropDownMenu.layoutIfNeeded()
        }, completion: nil)
    }
    
}

class DropDownView: UIView, UITableViewDelegate, UITableViewDataSource{
    var dropDownOptions = [String]()
    var tableView = UITableView()
    
    var delegate: dropDownProtocol!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(hex: "#F8F9FA")

        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
        
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text = dropDownOptions[indexPath.row]
        cell.backgroundColor = UIColor(hex: "#F8F9FA")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.dropDownPressed(string: dropDownOptions[indexPath.row])
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}
