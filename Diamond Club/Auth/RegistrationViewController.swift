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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!
    
    private let inProgressRegistrationString = "Registration..."
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView)))
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    @IBAction func didTapSignUpButton(_ sender: Any) {
        self.didTapView(sender: sender);
        EZLoadingActivity.show(self.inProgressRegistrationString, disableUI: true)
        AuthorizationController.instance.registration(login: login.text!, password: password.text!) { (isSuccess) in
             EZLoadingActivity.hide(isSuccess, animated: true)
        }
    }
    
    @objc func didTapView(sender : Any) {
        self.login.endEditing(true)
        self.password.endEditing(true)
        self.confirmPassword.endEditing(true)
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
