//
//  testViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 05/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class testViewController: UIViewController {

    @IBOutlet weak var testba: UIButton!
    @IBOutlet weak var testb: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func testbutton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        
        self.didMove(toParent: SlideViewController())
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
