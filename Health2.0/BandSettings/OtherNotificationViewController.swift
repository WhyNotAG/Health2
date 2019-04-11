//
//  OtherNotificationViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 11/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class OtherNotificationViewController: UIViewController {
    
    @IBOutlet weak var whatsAppImage: UIWebView!
    @IBOutlet weak var viberImage: UIWebView!
    @IBOutlet weak var vkImage: UIWebView!
    @IBOutlet weak var facebookImage: UIWebView!
    @IBOutlet weak var twitterImage: UIWebView!
    @IBOutlet weak var skypeImage: UIWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initImage()

    }
    
    func initImage(){
        whatsAppImage.loadRequest(addSVGImage(name: "WhatsApp"))
        viberImage.loadRequest(addSVGImage(name: "Viber"))
        vkImage.loadRequest(addSVGImage(name: "Vk"))
        facebookImage.loadRequest(addSVGImage(name: "Facebook"))
        twitterImage.loadRequest(addSVGImage(name: "Twitter"))
        skypeImage.loadRequest(addSVGImage(name: "Skype"))
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
