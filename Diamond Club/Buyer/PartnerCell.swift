//
//  PartnerCell.swift
//  Diamond Club
//
//  Created by lezgo on 5/20/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit

class PartnerCell: UITableViewCell {

    @IBOutlet weak var contImageView: UIImageView!
    @IBOutlet weak var contLabel: UILabel!
    @IBOutlet weak var contPercent: UILabel!
    
    public func configWithContrAgent(_ config:ContrAgent) {
        self.contImageView.image = convertBase64ToImage(base64String: config.image)
        self.contImageView.clipsToBounds = true;
        self.contImageView.layer.cornerRadius = self.contImageView.frame.size.width / 2.0
        self.contImageView.layer.masksToBounds = true;
        self.contLabel.text = config.contrAgentName;
        self.contPercent.text = (Int32)((config.percent * 100) / 2).description + " %";
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func convertBase64ToImage(base64String: String) -> UIImage {
        
        let decodedData = NSData(base64Encoded: base64String)
        let decodedimage = UIImage(data: decodedData! as Data)
        return decodedimage!
        
    }// end co
}
