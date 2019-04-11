//
//  DoctorViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 02/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class DoctorViewController: UIViewController {
    
    @IBOutlet weak var connectionView: UIView!
    
    @IBOutlet weak var doctorView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var calendarView: UIView!
    
    @IBOutlet weak var doctorLabel: UILabel!
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var calendarLabel: UILabel!
    
    @IBOutlet weak var doctorImage: UIWebView!
    @IBOutlet weak var cardImage: UIWebView!
    @IBOutlet weak var calendarImage: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        connectionView.layer.cornerRadius = 15
        
        doctorLabel.text = "Консультация\nврача"
        cardLabel.text = "Медицинская\nкарта"
        calendarLabel.text = "Календарь\nконсультаций"
        
        doctorImage.loadRequest(addSVGImage(name: "Doctor") as URLRequest)
        cardImage.loadRequest(addSVGImage(name: "Card") as URLRequest)
        calendarImage.loadRequest(addSVGImage(name: "Calendar") as URLRequest)
        
        
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
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    

}
