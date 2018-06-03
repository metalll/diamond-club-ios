//
//  ActivityTableViewCell.swift
//  Diamond Club
//
//  Created by lezgo on 5/27/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    @IBOutlet weak var value: UILabel!
    
    @IBOutlet weak var status: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func config(activityItem:ActivityItem,isContrAgent:Bool) {
        self.value.text = NSString(format:"%.2f", activityItem.preparedTagetOperationValue / (isContrAgent ? 1.0 : 2.0)) as String
    }
    
}
