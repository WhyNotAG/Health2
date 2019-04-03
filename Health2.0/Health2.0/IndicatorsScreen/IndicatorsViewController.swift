//
//  IndicatorsViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 02/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class IndicatorsViewController: UIViewController {
    
    //MARK:- Views
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
    }
    
}
