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
    
    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView)))
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @IBAction func didTapSignIn(_ sender: Any) {
        didTapView(sender: sender);
          EZLoadingActivity.show(self.inProgressLoginString, disableUI: true)
        AuthorizationController.instance.authorize(login: loginField.text!, password: password.text!) { (isSuccess:Bool) in
            EZLoadingActivity.hide(isSuccess, animated: true)
        }
    }
    
    @objc func didTapView(sender : Any) {
        self.loginField.endEditing(true)
        self.password.endEditing(true)
      
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let rect:CGRect = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! CGRect
        self.scrollViewBottom.constant = rect.size.height;
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        self.scrollViewBottom.constant = 0;
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
}
