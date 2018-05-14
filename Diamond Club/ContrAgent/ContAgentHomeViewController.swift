//
//  ContAgentHomeViewController.swift
//  Diamond Club
//
//  Created by lezgo on 3/6/18.
//  Copyright © 2018 user-letsgo6. All rights reserved.
//

import UIKit
import AVFoundation
import QRCodeReader


class ContAgentHomeViewController: UIViewController,QRCodeReaderViewControllerDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    @IBAction func didTapScanner(_ sender: Any)  {
        
        
        
        print("scanner scan");
        
        
        readerVC.delegate = self
        
        // Or by using the closure pattern
        readerVC.completionBlock = { (result: QRCodeReaderResult?) in
            print(result)
        }
        
        // Presents the readerVC as modal form sheet
        readerVC.modalPresentationStyle = .formSheet
        self.slideMenuController()?.navigationController?.present(readerVC, animated: true, completion: nil)
    }
    
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()
    
  
    // MARK: - QRCodeReaderViewController Delegate Methods
    
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult)  {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
        
        abort();
        
    
        
    }
    
    //This is an optional delegate method, that allows you to be notified when the user switches the cameraName
    //By pressing on the switch camera button
    func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
        if let cameraName:String = newCaptureDevice.device.localizedName {
            print("Switching capturing to: \(cameraName)")
        }
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
    }
    
}
