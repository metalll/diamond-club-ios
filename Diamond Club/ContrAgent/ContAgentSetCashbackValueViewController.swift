//
//  ContAgentSetCashbackValueViewController.swift
//  Diamond Club
//
//  Created by lezgo on 5/20/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit
import Alamofire
import TTGSnackbar

class ContAgentSetCashbackValueViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    public var target:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defer {
            self.textField.becomeFirstResponder();
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTapDone(_ sender: Any) {
        if ((self.textField.text?.count)! < 1) {
            let snackbar = TTGSnackbar(message: "Operation summ can't be empty", duration: .short)
            snackbar.backgroundColor = UIColor.red
            snackbar.bottomMargin = 260
            snackbar.messageTextAlign = .center
            snackbar.show()
            return;
        } else {
            
            let parameters:Parameters = ["userCashCard":target,
                                         "type":"CASHB",
                                         "value":textField.text ?? ""]
            Alamofire.request("https://diamond-card.herokuapp.com/API/activity", method:.post, parameters: parameters).responseJSON { response in
                
                if (response.response?.statusCode == 200) {
                    self.navigationController?.popViewController(animated: true)
                    defer {
                        let snackbar = TTGSnackbar(message: "Cashack request send to client", duration: .long)
                        snackbar.bottomMargin = 50
                        snackbar.messageTextAlign = .center
                        snackbar.layer.borderColor = UIColor.white.cgColor
                        snackbar.layer.masksToBounds = true
                        snackbar.layer.borderWidth = 1.5
                        snackbar.show()
                    }
                    return;
                } else {
                    self.navigationController?.popViewController(animated: true)
                    defer {
                        let snackbar = TTGSnackbar(message: "Qr code is invalid", duration: .middle)
                        snackbar.backgroundColor = UIColor.red
                        snackbar.messageTextAlign = .center
                        snackbar.bottomMargin = 50
                        snackbar.show()
                        
                    }
                    return;
                }
            }
        }
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent;
    }
    
}
