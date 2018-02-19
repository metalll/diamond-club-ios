//
//  LGAuthorizationController.swift
//  Diamond Club
//
//  Created by user-letsgo6 on 19.02.18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit

class AuthorizationController: NSObject {
    
    public var admin:Admin? = nil
    public var buyer:Buyer? = nil
    public var contAgent:ContrAgent? = nil;
    
    override init() {
        super.init()
    }
    
    var authorizedUser = NSNull()
    
    public static let sharedInstance = AuthorizationController()
    
    public func authorize(login:String, password:String, completion:(Bool)->Void) {
        if (login.count == 0 || password.count == 0) {
            completion(false);
            return;
        }
        
    }
    
    public func registration(login:String,password:String, completion:(Bool)->Void) {
        return;
    }
    
    
}

