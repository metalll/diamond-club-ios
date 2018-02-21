//
//  RegistrationViewController.swift
//  Diamond Club
//
//  Created by user-letsgo6 on 19.02.18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit
import EZLoadingActivity


class RegistrationViewController: UIViewController {
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
     private let inProgressRegistrationString = "Registration..."
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapSignUpButton(_ sender: Any) {
        EZLoadingActivity.show(self.inProgressRegistrationString, disableUI: true)
        AuthorizationController.instance.registration(login: login.text!, password: password.text!) { (isSuccess) in
             EZLoadingActivity.hide(isSuccess, animated: true)
        }
    }
}
