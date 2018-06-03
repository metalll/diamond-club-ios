//
//  ContrAgentInfoViewController.swift
//  Diamond Club
//
//  Created by lezgo on 5/27/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit

class ContrAgentInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if ((self.navigationController?.isNavigationBarHidden)!) {
            self.navigationController?.setNavigationBarHidden(false, animated: false);
        }
    }
}
