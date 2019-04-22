//
//  SlideViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 05/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class SlideViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var settingsView: UIView!
    
    @IBOutlet weak var settingsImage: UIWebView!
    @IBOutlet weak var bandImage: UIWebView!
    @IBOutlet weak var profileImage: UIWebView!
    @IBOutlet weak var supportImage: UIWebView!
    @IBOutlet weak var findeImage: UIWebView!
    @IBOutlet weak var newsImage: UIWebView!
    
    @IBOutlet weak var exitButton: UIButton!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageInit()
        emailLabel.text = UserDefaults.standard.value(forKeyPath: "contact") as! String
        nameLabel.text = UserDefaults.standard.value(forKeyPath: "name") as! String
        
        exitButton.layer.cornerRadius = 20.0
        exitButton.layer.borderWidth = 1.0
        exitButton.layer.borderColor = (UIColor(red: 255.0 / 255.0, green: 82.0 / 255.0, blue: 57.0 / 255.0, alpha: 1.0).cgColor)
    }    

    //MARK:- Function
    func imageInit(){
        
        settingsImage.loadRequest(addSVGImage(name: "Settings") as URLRequest)
        bandImage.loadRequest(addSVGImage(name: "Braselet") as URLRequest)
        profileImage.loadRequest(addSVGImage(name: "Avatar") as URLRequest)
        supportImage.loadRequest(addSVGImage(name: "Support") as URLRequest)
        findeImage.loadRequest(addSVGImage(name: "Search") as URLRequest)
        newsImage.loadRequest(addSVGImage(name: "Sound") as URLRequest)

    }
    
    func addSVGImage(name: String) -> NSURLRequest {
        let path: String = Bundle.main.path(forResource: name, ofType: "svg")!
        let url: NSURL = NSURL.fileURL(withPath: path) as NSURL
        let request: NSURLRequest = NSURLRequest(url: url as URL)
        return request
    }
    
    //MARK:- Action
    @IBAction func appSettings(_ sender: Any) {
        sideMenuController?.hideMenu() 
    }
    
    @IBAction func bandSettings(_ sender: Any) {
         sideMenuController?.hideMenu() 
    }
    
    @IBAction func exitFromAccount(_ sender: Any) {
        UserDefaults.standard.set("", forKey: "name")
        UserDefaults.standard.set("", forKey: "contact")
        UserDefaults.standard.set("", forKey: "password")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EnterViewController") as! EnterViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
}
