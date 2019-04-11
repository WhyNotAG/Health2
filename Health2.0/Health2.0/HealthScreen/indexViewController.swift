//
//  indexViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 01/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit
import SideMenuSwift
class indexViewController: UIViewController {
    
    //MARK:- indexOutlets
    @IBOutlet weak var indexInfoLabel: UILabel!
    @IBOutlet weak var doctorButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var barbutton: UIBarButtonItem!
    //MARK:- progressOutlets
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    //MARK:- navigationOutlets
    @IBOutlet weak var connectedView: UIView!
    @IBOutlet weak var connectionLabel: UILabel!
    
    //MARK:- statisticOutlets
    @IBOutlet weak var depletionView: UIView!
    @IBOutlet weak var stressView: UIView!
    @IBOutlet weak var energyView: UIView!
    @IBOutlet weak var heartView: UIView!
    
    //MARK: - button
    @IBOutlet weak var measureButton: UIButton!
    
    @IBOutlet weak var slideMenu: UIView!
    
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    var hamburgerIsVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //IndexView
        indexInfoLabel.text = "Ваш индекс здоровья\nотличный"
        doctorButton.layer.cornerRadius = 20
        
       // connectionLabel.adjustsFontSizeToFitWidth = true
        //ProgressView
        progressView.layer.cornerRadius = 15
        
        progressBar.clipsToBounds = true
        progressBar.layer.cornerRadius = 5

        
        //NavigationView
        connectedView.layer.cornerRadius = 15
        measureButton.layer.cornerRadius = 20
        //sideMenuController?.hideMenu()
    }
    
    @IBAction func openMenu(_ sender: Any) {
        sideMenuController?.revealMenu()
    
    }
    
}
