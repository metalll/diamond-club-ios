//
//  DiamondClubRootViewController.swift
//  Diamond Club
//
//  Created by lezgo on 5/27/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit

class DiamondClubRootViewController: UIViewController {

    @IBOutlet weak var singInButton: RoundedButton!
    @IBOutlet weak var signUpButton: RoundedButton!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signUpButton.alpha = 0
        self.singInButton.alpha = 0
        
        AuthorizationController.instance.applyCurrentUser { (isOk) in
            if (!isOk) {
                self.activityIndicatorView.stopAnimating()
                self.signUpButton.alpha = 1
                self.singInButton.alpha = 1
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
