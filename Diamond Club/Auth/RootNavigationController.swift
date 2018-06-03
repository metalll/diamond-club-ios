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
    
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func subribe() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(RootNavigationController.didReciveNotification(notification:)),
                                               name: NSNotification.Name(rawValue: NSNotificationCenterDidSingUpNotification),
                                               object: nil)
    }
    
    
    @objc func didReciveNotification(notification:Notification) {
        
        let role = notification.userInfo!["role"] as! String
        var viewController:UIViewController? = nil;
        switch role {
        case "ROLE_BUYER":
            viewController = BuyerMainViewController(mainViewController: BuyerHomeViewController(),leftMenuViewController: BuyerMenuViewController(),rightMenuViewController: BuyerRightViewController())
            break
        case "ROLE_CONTR_AGENT":
            viewController = ContAgentHomeViewController();
            break
        case "ROLE_ADMIN":
            viewController = AdminMainViewController()
            break
            
        default: break
            
        }
        
        self.setNavigationBarHidden(true, animated: true)
        self.viewControllers = [viewController!];
       
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
}
