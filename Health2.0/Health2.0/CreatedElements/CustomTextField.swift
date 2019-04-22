//
//  CustomTextField.swift
//  Health2.0
//
//  Created by Александр Голубкин on 12/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTextField()
    }
    
    private func setupTextField(){
        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 0.5
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.darkGray.cgColor
    }
}

