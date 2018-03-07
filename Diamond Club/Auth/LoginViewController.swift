//
//  LoginViewController.swift
//  Diamond Club
//
//  Created by user-letsgo6 on 19.02.18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit
import EZLoadingActivity

class LoginViewController: UIViewController {
    
    private let inProgressLoginString = "Authorization..."
    
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    @IBAction func didTapSignIn(_ sender: Any) {
          EZLoadingActivity.show(self.inProgressLoginString, disableUI: true)
        AuthorizationController.instance.authorize(login: loginField.text!, password: password.text!) { (isSuccess:Bool) in
        
            EZLoadingActivity.hide(isSuccess, animated: true)
            
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
