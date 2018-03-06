//
//  LGAuthorizationController.swift
//  Diamond Club
//
//  Created by user-letsgo6 on 19.02.18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit
import Alamofire


let NSNotificationCenterDidSingUpNotification = "NSNotificationCenterDidSingUpNotification"

class AuthorizationController: NSObject {
    
    public static let instance = AuthorizationController()
    
    private let authEndpoint:String = "https://diamond-card.herokuapp.com/"
    
    private let loginPath:String = "login"
    private let registrationPath = "Reg"
    private let applyCurrentUserPath = "auth"
    
    private let kLogin = "username"
    private let kPassword = "password"
    
    private let kRegistrationEmail = "email"
    private let kRegistrationPass = "pass"
    private let kRegistrationRePass = "rePass"
    
    public var admin:Admin? = nil
    public var buyer:Buyer? = nil
    public var contAgent:ContrAgent? = nil;
    
    private let kStringStatusOK = "OK"
    
    private let kSuccessCode = 200
    
    override init() {
        super.init()
    }
    
    var authorizedUser = NSNull()
    
    public static let sharedInstance = AuthorizationController()
    
    public func authorize(login:String, password:String, completion:@escaping (Bool)->Void) {
        
        if (login.count == 0 || password.count == 0) {
            completion(false);
            return;
        }
        
        let parameters:Parameters = [kLogin:login,
                                     kPassword:password]
        
        Alamofire.request(authEndpoint + loginPath, method:.post, parameters: parameters).responseString { (responce) in
            
            if (responce.response?.statusCode == self.kSuccessCode) {
                self.applyCurrentUser(completion:completion)
                print("apply user")
            } else {
                
                completion(false);
            }
        }
    }
    
    public func registration(login:String,password:String, completion:@escaping (Bool)->Void) {
        
        let parameters:Parameters = [kRegistrationEmail:login,
                                     kRegistrationPass:password,
                                     kRegistrationRePass:password]
        
        Alamofire.request(authEndpoint + registrationPath, method:.post, parameters: parameters).responseJSON { response in
            
            if (response.response?.statusCode == self.kSuccessCode) {
                
                if let json = response.result.value as? [String: Any] {
                    
                    if let status = json["status"] as? String {
                        
                        if (status == self.kStringStatusOK) {
                            
                            self.authorize(login: login, password: password, completion: completion)
                        } else {
                            
                            completion(false)
                        }
                    }
                }
            } else {
                completion(false);
            }
        }
        return;
    }
    
    public func applyCurrentUser(completion:@escaping (Bool)->Void) {
        
        Alamofire.request(authEndpoint + applyCurrentUserPath, method:.post).responseJSON { (responce) in
            
            if (responce.response?.statusCode == self.kSuccessCode) {
                
                if let json = responce.result.value as? [String: Any] {
                    print("json \(json)")
                    
                    if let data = json["data"] as? [String: Any] {
                        
                        if let role = data["role"] as? String {
                            
                            if (role == "ROLE_BUYER") {
                                self.loadBuyer(json:data)
                                print("load buyer")
                            }
                        }
                    }
                }
                completion(true);
            } else {
                
                completion(false);
            }
        }
    }
    
    private func loadBuyer(json : [String : Any]) {
        
        if let fullInfo = json["fullInfo"] as? [String : Any] {
        
        
        
        self.buyer = Buyer();
        
        self.buyer?.balance = (fullInfo["balance"] as? Float)!
        self.buyer?.foreignAdminId = (fullInfo["foreignAdminId"] as? Int32)!
        self.buyer?.foreignId = (fullInfo["foreignId"] as? Int32)!
        self.buyer?.foreignTargetBuyerId = (fullInfo["foreignId"] as? Int32)!
        self.buyer?.id = (fullInfo["id"] as? Int32)!
        self.buyer?.isActive = (fullInfo["isActive"] as? String)! == "YES"
        self.buyer?.percent = (fullInfo["percent"] as? Float)!
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            print("send push")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: NSNotificationCenterDidSingUpNotification), object: nil,userInfo:["role":"ROLE_BUYER"])
        }
        
        }
        
    }
    
    private func loadContAgent(baseInfo:Dictionary<String,Any?>,fullInfo:Dictionary<String,Any?>) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: NSNotificationCenterDidSingUpNotification), object: nil,userInfo:["role":"ROLE_CONTR_AGENT"])
        }
    }
    
    private func loadAdmin(baseInfo:Dictionary<String,Any?>,fullInfo:Dictionary<String,Any?>) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: NSNotificationCenterDidSingUpNotification), object: nil,userInfo:["role":"ROLE_ADMIN"])
        }
    }
    
}

