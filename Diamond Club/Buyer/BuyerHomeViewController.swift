//
//  BuyerHomeViewController.swift
//  Diamond Club
//
//  Created by lezgo on 3/6/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class Artwork: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    public var id:Int32?
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


class BuyerHomeViewController: UIViewController,MKMapViewDelegate {
    private var dataSource:[ContrAgent] = []
    
    @IBOutlet weak var headerBottom: NSLayoutConstraint!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self;
        self.navigationController?.navigationBar.barStyle = .blackTranslucent;
        self.navigationController?.navigationBar.isTranslucent = true;
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        
        self.navigationController?.navigationItem.title = "Diamond Club"
        self.title = "Diamond Club"
        
        
        if #available(iOS 11.0, *) {
        } else {
            headerBottom.constant = -64;
        }
        // Do any additional setup after loading the view.
        let parameters:Parameters = [:];
        Alamofire.request("https://diamond-card.herokuapp.com/API/contragent/all" , method:.post, parameters: parameters).responseJSON { response in
            
            if (response.response?.statusCode == 200) {
                
                if let json = response.result.value as? [String: Any] {
                    
                    if let status = json["status"] as? String {
                        
                        if (status == "OK") {
                            self.loadDataSorce(json["contrs"] as! [Any]);
                            
                        } else {
                            
                        }
                    }
                }
            } else {
                
            }
        }
        return;
        
        
    }
    
    private func loadSingleBuyer(_ fullInfo : [String : Any]) -> ContrAgent {
        let contAgent = ContrAgent()
        
        
        contAgent.contrAgentBalance = (fullInfo["contrAgentBalance"] as? String)!
        contAgent.contrAgentName = (fullInfo["contrAgentName"] as? String)!
        contAgent.foreingId = (fullInfo["foreingId"] as? Int32)!
        contAgent.id = (fullInfo["id"] as? Int32)!
        contAgent.image = (fullInfo["image"] as? String)!
        contAgent.locationLatitude = (fullInfo["locationLatitude"] as? NSNumber)!.floatValue
        contAgent.locationLongitude = (fullInfo["locationLongitude"] as? NSNumber)!.floatValue
        contAgent.millisecondToAppruveCashback = (fullInfo["millisecondToAppruveCashback"] as? Int64)!
        contAgent.percent =  (fullInfo["percent"] as? NSNumber)!.floatValue
        contAgent.rating = (fullInfo["rating"] as? Float)!
        
        return contAgent;
    }
    
    private func loadDataSorce(_ json:[Any]) {
    self.mapView.removeAnnotations(self.mapView.annotations)
        self.dataSource = [];
        for item in json {
            let tmpItem:[String : Any] = item as! [String : Any];
            
            let contr_agent = loadSingleBuyer(tmpItem)
            self.dataSource.append(contr_agent);
            
            
            let coord = CLLocationCoordinate2DMake(CLLocationDegrees(contr_agent.locationLatitude), CLLocationDegrees(contr_agent.locationLongitude))
            
            let artwork = Artwork(title:contr_agent.contrAgentName,
                                  locationName: "",
                                  discipline: "",
                                  coordinate: coord)
            artwork.id = contr_agent.id
            self.mapView.addAnnotation(artwork)
        }
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
        self.slideMenuController()?.closeLeftNonAnimation();
        self.slideMenuController()?.navigationController?.pushViewController(SharesViewController(), animated: true);
    }
    
    @IBAction func didTapQRCode(_ sender: Any) {
        didTapQrCode(sender);
    }
    
    @IBAction func didTapDiamondOnline(_ sender: Any) {
          self.slideMenuController()?.navigationController?.pushViewController(DiamondOnlineViewController(), animated: true);
    }
}
