//
//  AdminMainViewController.swift
//  Diamond Club
//
//  Created by user-letsgo6 on 19.02.18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift


class AdminMainViewController: SlideMenuController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mainViewController = AdminHomeViewController()
        self.leftViewController = AdminMenuViewController()
        self.rightViewController = AdminRightViewController()
        super.awakeFromNib()
    }

}

