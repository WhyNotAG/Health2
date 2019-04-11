//
//  TrViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 04/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class TrViewController: UIViewController {

    @IBOutlet weak var connectionView: UIView!
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var lungsView: UIView!
    @IBOutlet weak var vibrationView: UIView!
    @IBOutlet weak var waterView: UIView!
    @IBOutlet weak var dietView: UIView!
    
    //MARK:- Labels
    @IBOutlet weak var calendarLabel: UILabel!
    @IBOutlet weak var lungsLabel: UILabel!
    @IBOutlet weak var vibrationLabel: UILabel!
    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var dietLabel: UILabel!
    
    
    @IBOutlet weak var calendarImage: UIWebView!
    @IBOutlet weak var lungsImage: UIWebView!
    @IBOutlet weak var vibrationImage: UIWebView!
    @IBOutlet weak var waterImage: UIWebView!
    @IBOutlet weak var dietImage: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Views
        connectionView.layer.cornerRadius = 15
        calendarView.layer.cornerRadius = 15
        lungsView.layer.cornerRadius = 15
        vibrationView.layer.cornerRadius = 15
        waterView.layer.cornerRadius = 15
        dietView.layer.cornerRadius = 15
        
        //Labels
        calendarLabel.text = "Календарь приема\nлекарств"
        lungsLabel.text = "Дыхательная\nтерапия"
        vibrationLabel.text = "Вибрационная\nтерапия"
        waterLabel.text = "Гидротерапия"
        dietLabel.text = "Диета"
        
        //Images
        calendarImage.loadRequest(addSVGImage(name: "Calendar") as URLRequest)
        lungsImage.loadRequest(addSVGImage(name: "Lung") as URLRequest)
        vibrationImage.loadRequest(addSVGImage(name: "Vibration") as URLRequest)
        waterImage.loadRequest(addSVGImage(name: "Water") as URLRequest)
        dietImage.loadRequest(addSVGImage(name: "Banana") as URLRequest)
    }
    
    func addSVGImage(name: String) -> NSURLRequest {
        let path: String = Bundle.main.path(forResource: name, ofType: "svg")!
        let url: NSURL = NSURL.fileURL(withPath: path) as NSURL
        let request: NSURLRequest = NSURLRequest(url: url as URL)
        return request
    }
    
    @IBAction func openMenu(_ sender: Any) {
        sideMenuController?.revealMenu()
    }
    
}
