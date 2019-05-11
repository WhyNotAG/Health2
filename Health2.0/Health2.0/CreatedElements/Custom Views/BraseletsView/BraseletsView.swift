//
//  BraseletView.swift
//  Health2.0
//
//  Created by Александр Голубкин on 26/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class BraseletView: UIView {

    var view: UIView!
    

    @IBOutlet weak var braseletsLabel: UILabel!
    @IBOutlet weak var braseletsButtom: UIButton!
    @IBOutlet weak var connectButton: UIButton!
    
    @IBInspectable var timeFieldText: String? {
        get {
            return braseletsLabel.text
        }
        
        set(timeFieldText) {
            braseletsLabel.text = timeFieldText
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        
        let nib = UINib(nibName: "TimeView", bundle: bundle)
        
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
}
