//
//  ContrAgent.swift
//  Diamond Club
//
//  Created by user-letsgo6 on 19.02.18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit

class ContrAgent: NSObject {
    override init() {
        
        self.contrAgentBalance = "";
        self.contrAgentName = "";
        self.foreingId = 0;
        self.id = 0;
        self.image = "";
        self.locationLatitude = 0;
        self.locationLongitude = 0;
        self.millisecondToAppruveCashback = 0;
        self.percent = 0;
        self.rating = 0;
        self.email = "";
    }
    
    
    
    public var contrAgentBalance:String
    public var contrAgentName:String
    public var foreingId:Int32
    public var id:Int32
    public var image:String
    public var locationLatitude:Float
    public var locationLongitude:Float
    public var millisecondToAppruveCashback:Int64
    public var percent:Float
    public var rating:Float
    public var email:String
    


}
