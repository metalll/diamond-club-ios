//
//  Buyer.swift
//  Diamond Club
//
//  Created by user-letsgo6 on 19.02.18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit

class Buyer: NSObject {
    
    
    override init() {
        
        self.balance = 0
        self.foreignId = 0
        self.foreignAdminId = 0
        self.foreignTargetBuyerId = 0;
        self.id = 0
        self.isActive = false
        self.percent = ""
        self.shadowBalance = 0
        self.billingCardNum = ""
        self.cashbackCardNumber = ""
        self.email = ""
        self.userID = -1
    }
    
    public var balance:Float
    public var foreignAdminId:Int32
    public var foreignId:Int32
    public var foreignTargetBuyerId:Int32
    public var id:Int32
    public var isActive:Bool
    public var percent:String
    public var shadowBalance:Float
    public var billingCardNum:String
    public var cashbackCardNumber:String
    public var email:String
    public var userID:Int32

}
