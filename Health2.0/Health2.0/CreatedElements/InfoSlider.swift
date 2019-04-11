//
//  InfoSlider.swift
//  Health2.0
//
//  Created by Александр Голубкин on 04/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class InfoSlider: UIProgressView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSlider()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSlider()
    }
    
    private func setupSlider(){
        //self.clipsToBounds = true
        //self.layer.cornerRadius = 5
    }

}
