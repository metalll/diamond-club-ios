//
//  EditBuyerViewController.swift
//  Diamond Club
//
//  Created by lezgo on 4/9/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit

class EditBuyerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Edit Accout";
        
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
    }
}
