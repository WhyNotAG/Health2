//
//  IndicateViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 04/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class IndicateViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func openMenu(_ sender: Any) {
        sideMenuController?.revealMenu()
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
