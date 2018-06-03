//
//  FullPartner.swift
//  Diamond Club
//
//  Created by lezgo on 5/20/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit
import MapKit
class FullPartner: UIViewController {

    public var partner:ContrAgent = ContrAgent()
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = partner.contrAgentName;
        self.label.text = partner.contrAgentName;
        self.imageView.image = convertBase64ToImage(base64String: self.partner.image);
        // Do any additional setup after loading the view.
        self.imageView.layer.cornerRadius = self.imageView.bounds.size.height / 2
        self.imageView.layer.masksToBounds = true;
        
        let coord = CLLocationCoordinate2DMake(CLLocationDegrees(partner.locationLatitude), CLLocationDegrees(partner.locationLongitude))
        
        let artwork = Artwork(title: partner.contrAgentName,
                              locationName: "",
                              discipline: "",
                              coordinate: coord)
        
        self.map.addAnnotation(artwork)
        
       
        let viewRegion = MKCoordinateRegionMakeWithDistance(coord, 500, 500)
        let ajustedRegion = self.map.regionThatFits(viewRegion)
        self.map.setRegion(ajustedRegion, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapDirection(_ sender: Any) {
        
        UIApplication.shared.open(URL(string:"http://maps.apple.com/?daddr="+partner.locationLatitude.description+","+partner.locationLongitude.description)!, options: [:]) { (isOk) in
            
        }
    }
    
    @IBAction func didTapGoToSite(_ sender: Any) {
        
        UIApplication.shared.open(URL(string:"https://google.com")!, options: [:]) { (isOk) in
            
        }
    }

    func convertBase64ToImage(base64String: String) -> UIImage {
        let decodedData = NSData(base64Encoded: base64String)
        let decodedimage = UIImage(data: decodedData! as Data)
        return decodedimage!
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
