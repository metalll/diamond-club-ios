//
//  ActionCircleButtons.swift
//  Diamond Club
//
//  Created by lezgo on 3/7/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit

class ActionCircleButtons: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        commonInit()
    }

    private func commonInit() {
        self.imageView?.contentMode = .scaleAspectFit;

        self.imageView?.image = resizeImage(image: (self.imageView?.image)!, targetSize: CGSize(width:(self.imageView?.frame.width)! * 0.3, height:(self.imageView?.frame.width)! * 0.3))
        self.layer.cornerRadius = self.frame.size.height / 2.0
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.init(red: 148.0/255.0, green: 33.0/255.0, blue: 147.0/255.0, alpha: 1.0).cgColor
        
    }
}

func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
    let size = image.size
    
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    
    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
        newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    }
    
    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    
    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
}
