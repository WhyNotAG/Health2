//
//  IndexAndECGViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 12/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class IndexAndECGViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
