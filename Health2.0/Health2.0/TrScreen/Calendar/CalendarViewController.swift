//
//  CalendarViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 23/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet weak var addCourse: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        addCourse.layer.cornerRadius = 20.0
    }
    

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
