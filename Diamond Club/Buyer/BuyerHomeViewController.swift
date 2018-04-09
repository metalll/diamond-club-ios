//
//  BuyerHomeViewController.swift
//  Diamond Club
//
//  Created by lezgo on 3/6/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit
import MapKit


class Artwork: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}

class BuyerHomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barStyle = .blackTranslucent;
        self.navigationController?.navigationBar.isTranslucent = true;
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        
            self.navigationController?.navigationItem.title = "Diamond Club"
        
            self.title = "Diamond Club"
        
        
        
        let artwork = Artwork(title: "ContAgent",
                              locationName: "Odessa",
                              discipline: "Buy your shoose",
                              coordinate: CLLocationCoordinate2D(latitude: 46.469391, longitude: 30.750883))
        mapView.addAnnotation(artwork)
        let artwork1 = Artwork(title: "Zum-zum",
                                                            locationName: "Odessa",
                                                            discipline: "Play",
                                                            coordinate: CLLocationCoordinate2D(latitude: 46.489391, longitude: 30.740883))
        mapView.addAnnotation(artwork1)
        let artwork2 = Artwork(title: "Shop",
                                                            locationName: "Odessa",
                                                            discipline: "Buy eat",
                                                            coordinate: CLLocationCoordinate2D(latitude: 46.489391, longitude: 30.720883))
        mapView.addAnnotation(artwork2)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapQrCode(_ sender: Any) {
        
        if let slideMenuController = self.slideMenuController() {
            if (slideMenuController.isLeftOpen()) {
                slideMenuController.closeLeftNonAnimation();
                
            }
            slideMenuController.openRightWithVelocity(0.0);
        }
        
    }
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func didTamMenu(_ sender: Any) {
        if let slideMenuController = self.slideMenuController() {
            if (slideMenuController.isRightOpen()) {
                slideMenuController.closeRightNonAnimation();
              
            }
              slideMenuController.openLeftWithVelocity(0.0);
        }
        
    }

     @IBAction func didTapPartners(_ sender: Any) {
            self.slideMenuController()?.navigationController?.pushViewController(PartnersViewController(), animated: true);
        
        
     }
    @IBAction func didTapShares(_ sender: Any) {
        
        self.slideMenuController()?.navigationController?.pushViewController(SharesViewController(), animated: true);
        
        
    }
    
    
    
    @IBAction func didTapQRCode(_ sender: Any) {
        didTapQrCode(sender);
    }
    
    
    @IBAction func didTapDiamondOnline(_ sender: Any) {
        
          self.slideMenuController()?.navigationController?.pushViewController(DiamondOnlineViewController(), animated: true);
        
    }
    
    
     // In a storyboard-based application, you will often want to do a little preparation before navigation
 
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
  
    
    
}
