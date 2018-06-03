//
//  BuyerRightViewController.swift
//  Diamond Club
//
//  Created by lezgo on 3/6/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit
import EFQRCode
import QRCode


class BuyerRightViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let stringToInput = AuthorizationController.instance.buyer?.billingCardNum {
            
            let qrCode = QRCode(stringToInput)
            self.imageView.image = qrCode?.image;
        }
    }
}
