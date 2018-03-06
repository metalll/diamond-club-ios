//
//  ContrAgentMainViewController.swift
//  Diamond Club
//
//  Created by user-letsgo6 on 19.02.18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift


class ContrAgentMainViewController: SlideMenuController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainViewController = ContrAgentMainViewController()
        self.leftViewController = ContrAgentMenuViewController()
        self.rightViewController = ContrAgentRightViewController()
    }

}
