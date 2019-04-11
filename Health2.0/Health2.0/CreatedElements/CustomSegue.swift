//
//  CustomSegue.swift
//  Health2.0
//
//  Created by Александр Голубкин on 09/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    
    override func perform() {
        let window = UIApplication.shared.windows.first!
        let rootController = window.rootViewController!
        UIView.transition(from: rootController.view, to: destination.view, duration: 0.4, options: [.allowAnimatedContent, .layoutSubviews]) { _ in
            window.rootViewController = self.destination
        }
    }
}
