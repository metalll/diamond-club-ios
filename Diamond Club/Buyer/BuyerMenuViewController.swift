//
//  BuyerMenuViewController.swift
//  Diamond Club
//
//  Created by lezgo on 3/6/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit
import MFCard


class BuyerMenuViewController: UIViewController,MFCardDelegate {
    func cardDoneButtonClicked(_ card: Card?, error: String?) {
        
    }
    
    func cardTypeDidIdentify(_ cardType: String) {
        
    }
    
    
    @IBOutlet weak var avatarImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = (AuthorizationController.instance.buyer?.name)! + " " + (AuthorizationController.instance.buyer?.secondName)!
        
        self.waitingPointsLabel.text = "\(AuthorizationController.instance.buyer?.shadowBalance ?? 0)"
        self.activePointsLabel.text = "\(AuthorizationController.instance.buyer?.balance ?? 0)"
        
        if ((AuthorizationController.instance.buyer?.avatarImage.count)! > 0) {
            self.avatarImageView.image = convertBase64ToImage(base64String: (AuthorizationController.instance.buyer?.avatarImage)!)
            self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.width / 2.0
            self.avatarImageView.layer.masksToBounds = true
        }
        
        
    }
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var activePointsLabel: UILabel!
    
    
    @IBOutlet weak var waitingPointsLabel: UILabel!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapMessageArhive(_ sender: Any) {
        self.slideMenuController()?.closeLeftNonAnimation();
        self.slideMenuController()?.navigationController?.pushViewController(BuyerMessagesArhive(), animated: true);
    }
    
    
    @IBAction func didTapEdit(_ sender: Any) {
        self.slideMenuController()?.closeLeftNonAnimation();
        self.slideMenuController()?.navigationController?.pushViewController(EditBuyerViewController(), animated: true);
    }
    
    @IBAction func didTapInfo(_ sender: Any) {
        self.slideMenuController()?.closeLeftNonAnimation();
        self.slideMenuController()?.navigationController?.pushViewController(BuyerInfoViewController(), animated: true);
    }
    
    @IBAction func didTapAbout(_ sender: Any) {
        self.slideMenuController()?.closeLeftNonAnimation();
        self.slideMenuController()?.navigationController?.pushViewController(AboutDiamondClub(), animated: true);
    }
    
    @IBAction func didTapSettings(_ sender: Any) {
        self.slideMenuController()?.closeLeftNonAnimation();
        self.slideMenuController()?.navigationController?.pushViewController(BuyerSettingsViewController(), animated: true);
    }
    
    @IBAction func didTapHistory(_ sender: Any) {
        
        var myCard : MFCardView
        myCard  = MFCardView(withViewController: (self.slideMenuController()?.navigationController)!)
        
        myCard.delegate = self
        myCard.autoDismiss = true
        myCard.toast = true
        myCard.cardImage = UIImage(named: "backround");
        
        myCard.backChromeColor = UIColor.purple;
        myCard.showCard();
    }
    
    
    
    
    @IBAction func didTapLogout(_ sender: Any) {
        
        
        
        let alert = UIAlertController(title: "Logout", message: "Did you want logout?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            
            
            self.slideMenuController()?.navigationController?.setNavigationBarHidden(false, animated: false); self.slideMenuController()?.navigationController?.setViewControllers([(UIApplication.shared.keyWindow?.rootViewController?.storyboard?.instantiateViewController(withIdentifier: "ROOT"))!], animated: true);
            
            
        }));
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
        
    }
    
    func convertImageToBase64(image: UIImage) -> String {
        
        let imageData = UIImagePNGRepresentation(image)
        let base64String = imageData?.base64EncodedString()
        
        return base64String!
        
    }// end convertImageToBase64
    
    
    // prgm mark ----
    
    // convert images into base64 and keep them into string
    
    func convertBase64ToImage(base64String: String) -> UIImage {
        
        let decodedData = NSData(base64Encoded: base64String)
        
        
        let decodedimage = UIImage(data: decodedData! as Data)
        
        return decodedimage!
        
    }// end convertBase64ToImage
}
