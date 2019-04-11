//
//  LaunchScreenViewController.swift
//  Health2.0
//
//  Created by Александр Голубкин on 11/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        perform(#selector(showRegistrationScreen), with: nil, afterDelay: 1.2)
    }
    
    @objc func showRegistrationScreen(){
        performSegue(withIdentifier: "showSplashScreen", sender: self)
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
