//
//  RootNavigationController.swift
//  Diamond Club
//
//  Created by lezgo on 3/6/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit

class RootNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.subribe()
        // Do any additional setup after loading the view.
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name:NSNotification.Name(rawValue: NSNotificationCenterDidSingUpNotification), object: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func subribe() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(RootNavigationController.didReciveNotification(notification:)),
                                               name: NSNotification.Name(rawValue: NSNotificationCenterDidSingUpNotification),
                                               object: nil)
    }

    
    @objc func didReciveNotification(notification:Notification) {
        
        let viewController = AdminMainViewController();
        
        
        self.viewControllers = [viewController];
        
        
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
