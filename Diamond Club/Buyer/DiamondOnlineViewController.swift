//
//  DiamondOnlineViewController.swift
//  Diamond Club
//
//  Created by lezgo on 4/9/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit

class DiamondOnlineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Diamond Online";
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden((self.navigationController?.viewControllers.count)! < 2 , animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
