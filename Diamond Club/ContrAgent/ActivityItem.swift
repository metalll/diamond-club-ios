//
//  ActivityItem.swift
//  Diamond Club
//
//  Created by lezgo on 5/27/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit

class ActivityItem: NSObject {
    var activityId:Int32 = 0
    var initiatorId:Int32 = 0
    var targerId:Int32 = 0
    var type:String = ""
    var operationValue:Float = 0
    var date:Int64 = 0
    var dateOffset:Int64 = 0
    var isActiveOperation:Bool = false
    var isSuccessComplete:Bool = false
    var preparedTagetOperationValue:Float = 0
    
    
    override init() {
        super.init();
    
    }

    public convenience init(json:[String : Any]) {
        self.init();
        self.activityId = json["activityId"] as! Int32
        self.targerId = json["targetId"] as! Int32
        self.initiatorId = json["initiatorId"] as! Int32
        self.type = json["type"] as! String
        self.operationValue = (json["operationValue"] as! NSString).floatValue
        self.date = json["date"] as! Int64
        self.dateOffset = json["dateOffset"] as! Int64
        self.isActiveOperation = json["isActiveOperation"] as! Bool
        self.isSuccessComplete = json["isSuccessComplete"] as! Bool
        self.preparedTagetOperationValue = (json["preparedTagetOperationValue"] as! NSString).floatValue
    }
    
    
}
