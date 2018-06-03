//
//  PartnersViewController.swift
//  Diamond Club
//
//  Created by lezgo on 4/9/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit
import Alamofire

class PartnersViewController: UIViewController, UITableViewDelegate ,UITableViewDataSource {
    
    private var dataSource:[ContrAgent] = []
    
    @IBOutlet weak var tableVIew: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableVIew.register(UINib(nibName: "PartnerCell", bundle: nil), forCellReuseIdentifier: "Partner")
        self.tableVIew.delegate = self;
        self.tableVIew.dataSource = self;
        self.title = "Partners";
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
        // Do any additional setup after loading the view.
    }
    
    
    private func loadDataSorce(_ json:[Any]) {
         self.dataSource = [];
        for item in json {
            let tmpItem:[String : Any] = item as! [String : Any];
           
            let contr_agent = loadSingleBuyer(tmpItem)
            self.dataSource.append(contr_agent);
        }
        self.tableVIew.reloadData()
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden((self.navigationController?.viewControllers.count)! < 2 , animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
            let vc = FullPartner();
            vc.partner = dataSource[indexPath.row];
        self.navigationController?.pushViewController( vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 79;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PartnerCell = self.tableVIew.dequeueReusableCell(withIdentifier: "Partner") as! PartnerCell
        cell.configWithContrAgent(dataSource[indexPath.row])
        return cell;
    }
    
}
