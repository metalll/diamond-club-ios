//
//  BuyerSettingsViewController.swift
//  Diamond Club
//
//  Created by lezgo on 4/9/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit

class BuyerSettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings";
        
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
