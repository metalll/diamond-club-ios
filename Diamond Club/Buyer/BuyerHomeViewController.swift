//
//  BuyerHomeViewController.swift
//  Diamond Club
//
//  Created by lezgo on 3/6/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit
import MapKit

class BuyerHomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barStyle = .blackTranslucent;
        self.navigationController?.navigationBar.isTranslucent = true;
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        
            self.navigationController?.navigationItem.title = "Diamond Club"
        
            self.title = "Diamond Club"
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapQrCode(_ sender: Any) {
        
        if let slideMenuController = self.slideMenuController() {
            slideMenuController.openRightWithVelocity(0.0);
        }
        
    }
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func didTamMenu(_ sender: Any) {
        if let slideMenuController = self.slideMenuController() {
            slideMenuController.openLeftWithVelocity(0.0);
        }
        
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
