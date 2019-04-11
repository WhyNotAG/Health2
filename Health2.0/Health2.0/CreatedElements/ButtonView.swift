//
//  ButtonView.swift
//  Health2.0
//
//  Created by Александр Голубкин on 04/04/2019.
//  Copyright © 2019 Александр Голубкин. All rights reserved.
//

import UIKit

class ButtonView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (someAction(_:elements:)))
        self.mask!.addGestureRecognizer(gesture)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView(){
        layer.cornerRadius = 15
    }
    
    @objc func someAction(_ sender:UITapGestureRecognizer, elements: UIViewController){
       let nextResponder = self.next as? UIViewController
        nextResponder?.navigationController?.pushViewController(elements, animated: true)
        
    }
}

extension UIView {
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}
