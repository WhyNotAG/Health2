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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        connectionView.layer.cornerRadius = 15
        
        doctorLabel.text = "Консультация\nврача"
        cardLabel.text = "Медицинская\nкарта"
        calendarLabel.text = "Календарь\nконсультаций"
        
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
