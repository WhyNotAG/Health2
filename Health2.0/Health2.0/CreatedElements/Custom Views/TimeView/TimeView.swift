//
//  TimeView.swift
//  Health2.0
//
//  Created by Александр Голубкин on 26/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

@IBDesignable class TimeView: UIView {

    var view: UIView!
    
    @IBOutlet weak var timeField: CustomTextField!
    @IBOutlet weak var delButton: UIButton!
    @IBOutlet weak var openImage: UIImageView!
    
    @IBInspectable var timeFieldText: String? {
        get {
            return timeField.text
        }
        
        set(timeFieldText) {
            timeField.text = timeFieldText
        }
    }
    
    @IBInspectable var image: UIImage{
        get {
            return openImage.image!
        }
        
        set(image) {
            openImage.image = image
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
    
    @IBAction func delElements(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    
}
