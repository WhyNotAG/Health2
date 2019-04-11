//
//  HelpSettingsViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 11/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class HelpSettingsViewController: UIViewController {

    @IBOutlet weak var contactsImage: UIWebView!
    @IBOutlet weak var numberPhoneImage: UIWebView!
    @IBOutlet weak var messageImage: UIWebView!
    @IBOutlet weak var soundImage: UIWebView!
    
    @IBOutlet weak var contactsLabel: UILabel!
    @IBOutlet weak var numberPhoneLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var soundLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initImage()
        
        contactsLabel.text = "Список контактов из\nтелефонной книги"
        numberPhoneLabel.text = "Добавить номер\nвручную"
        messageLabel.text = "Набрать текствовое\nсообщение"
        soundLabel.text = "Вставить звуковой файл о экстренной ситуации"
       
    }
    

    func initImage(){
        contactsImage.loadRequest(addSVGImage(name: "Book"))
        numberPhoneImage.loadRequest(addSVGImage(name: "Phone"))
        messageImage.loadRequest(addSVGImage(name: "Message"))
        soundImage.loadRequest(addSVGImage(name: "Notification"))
    }
    
    func addSVGImage(name: String) -> URLRequest {
        let path: String = Bundle.main.path(forResource: name, ofType: "svg")!
        let url: NSURL = NSURL.fileURL(withPath: path) as NSURL
        let request: NSURLRequest = NSURLRequest(url: url as URL)
        return request as URLRequest
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
