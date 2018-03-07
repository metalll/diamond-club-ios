//
//  BuyerRightViewController.swift
//  Diamond Club
//
//  Created by lezgo on 3/6/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit
import EFQRCode



class BuyerRightViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        if let stringToInput = AuthorizationController.instance.buyer?.cashbackCardNumber {
            
            if let image = EFQRCode.generate(
                content: stringToInput,
                watermark: UIImage(named: "qr_logo")?.toCGImage()
                ) {
                
                self.imageView.image = UIImage.init(cgImage: image);
                
                print("Create QRCode image success: \(image)")
            } else {
                print("Create QRCode image failed!")
            }
            
            
        }
    }
        


    

}
