//
//  RoundedButton.swift
//  Diamond Club
//
//  Created by user-letsgo6 on 21.02.18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func draw(_ rect: CGRect) {
        super.draw(rect);
        self.layer.cornerRadius = 4;
        self.layer.masksToBounds = true
    }
    
    

}
