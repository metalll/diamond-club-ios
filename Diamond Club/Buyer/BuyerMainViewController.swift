//
//  BuyerMainViewController.swift
//  Diamond Club
//
//  Created by user-letsgo6 on 19.02.18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//


import UIKit
import SlideMenuControllerSwift

class BuyerMainViewController: SlideMenuController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainViewController = BuyerHomeViewController()
        self.leftViewController = BuyerMenuViewController()
        self.rightViewController = BuyerRightViewController()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
}
