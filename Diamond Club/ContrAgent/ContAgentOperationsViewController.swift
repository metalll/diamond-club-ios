//
//  ContAgentOperationsViewController.swift
//  Diamond Club
//
//  Created by lezgo on 5/27/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit
import Alamofire

class ContAgentOperationsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    private var dataSource:[ActivityItem] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.title = "Operations"
         self.tableView.register(UINib(nibName: "ActivityTableViewCell", bundle: nil), forCellReuseIdentifier: "ActivityTableViewCell")
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.loadActivites()
        
    }

    private func loadActivites() {
        
        Alamofire.request("https://diamond-card.herokuapp.com/API/activity" , method:.get).responseJSON { response in

            if (response.response?.statusCode == 200) {
                
                if let json = response.result.value as? [String: Any] {
                    
                    if let status = json["status"] as? String {
                        
                        if (status == "OK") {
                            self.loadDataSorce((json["data"] as! [String : Any])["activites"] as! [Any]);
                        } else {
                        }
                    }
                }
            } else {
                
            }
        }
    }
    
    private func loadDataSorce(_ json:[Any]) {
        self.dataSource = [];
        for item in json {
            let tmpItem:[String : Any] = item as! [String : Any];
            let actitvity = ActivityItem(json: tmpItem)
            dataSource.append(actitvity)
        }
        
        let sortedArray = dataSource.sorted {
            $0.date > $1.date
        }
        
        self.dataSource = sortedArray
        
        self.tableView.reloadData();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if ((self.navigationController?.isNavigationBarHidden)!) {
            self.navigationController?.setNavigationBarHidden(false, animated: false);
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ActivityTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "ActivityTableViewCell") as! ActivityTableViewCell
        cell.config(activityItem: dataSource[indexPath.row], isContrAgent: true)
        return cell;
    }
}
