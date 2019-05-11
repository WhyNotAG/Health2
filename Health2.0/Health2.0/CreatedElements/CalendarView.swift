//
//  CalendarView.swift
//  Health2.0
//
//  Created by Александр Голубкин on 23/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class CalendarView: UIView {

    var mainLabel: UILabel!
    var timeLabel: UILabel!
    var progressBar: UIProgressView!
    var endTimeLabel: UILabel!
    var selectedSwitch: UISwitch!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView(){
        mainLabel.constraints
        addSubview(mainLabel)
        layer.cornerRadius = 15
    }
}
