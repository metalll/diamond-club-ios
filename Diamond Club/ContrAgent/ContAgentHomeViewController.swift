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
import MFCard

class ContAgentHomeViewController: UIViewController,QRCodeReaderViewControllerDelegate,MFCardDelegate  {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.layer.cornerRadius = self.imageView.frame.width / 2.0
        self.imageView.layer.masksToBounds = true
        self.nameLabel.text = AuthorizationController.instance.contAgent?.contrAgentName;
   
        if ((AuthorizationController.instance.contAgent?.image.count)! > 0) {
         
            self.imageView.image = convertBase64ToImage(base64String: (AuthorizationController.instance.contAgent?.image)!);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (!(self.navigationController?.isNavigationBarHidden)!) {
            self.navigationController?.setNavigationBarHidden(true, animated: false);
        }
    }
    
    @IBAction func didTapScanner(_ sender: Any)  {
        
        print("scanner scan");

        readerVC.delegate = self
        
        // Or by using the closure pattern
        readerVC.completionBlock = { (result: QRCodeReaderResult?) in
        }
        
        // Presents the readerVC as modal form sheet
        readerVC.modalPresentationStyle = .formSheet
        self.navigationController?.present(readerVC, animated: true, completion: nil)
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
        let navigationController = self.navigationController;
        dismiss(animated: true, completion: {() in
            let vc = ContAgentSetCashbackValueViewController();
            vc.target = result.value;
            navigationController?.pushViewController(vc, animated: true)
        })
}
    
    //This is an optional delegate method, that allows you to be notified when the user switches the cameraName
    //By pressing on the switch camera button
    func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
        
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
    }
    
    func convertBase64ToImage(base64String: String) -> UIImage {
        
        let decodedData = NSData(base64Encoded: base64String)
        let decodedimage = UIImage(data: decodedData! as Data)
        return decodedimage!
        
    }// end convertBase64ToImage
    
    @IBAction func didTapInfo(_ sender: Any) {
        let infoVC = ContrAgentInfoViewController()
        self.navigationController?.pushViewController(infoVC, animated:true);
    }
    
    @IBAction func didTapSetting(_ sender: Any) {
        let settingsVC = ContrAgentSettings()
        self.navigationController?.pushViewController(settingsVC, animated: true);
    }
    
    @IBAction func didTapOperations(_ sender: Any) {
        let operationsVC = ContAgentOperationsViewController()
        self.navigationController?.pushViewController(operationsVC, animated: true);
    }
    @IBAction func didTapBalance(_ sender: Any) {
        var myCard : MFCardView
        myCard  = MFCardView(withViewController: (self.navigationController)!)
        
        myCard.delegate = self
        myCard.autoDismiss = true
        myCard.toast = true
        myCard.cardImage = UIImage(named: "backround");
        
        myCard.backChromeColor = UIColor.purple;
        myCard.showCard();
    }
    
    func cardDoneButtonClicked(_ card: Card?, error: String?) {
        
    }
    
    func cardTypeDidIdentify(_ cardType: String) {
        
    }

    @IBAction func didTapStatistic(_ sender: Any) {
        let contAgentStatisticVC = ContrAgentStatisticViewController()
        self.navigationController?.pushViewController(contAgentStatisticVC, animated: true);
    }
    
    
    
    
    @IBAction func didTapLogout(_ sender: Any) {
        let alert = UIAlertController(title: "Logout", message: "Did you want logout?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            
            AuthorizationController.instance.logout();
            self.navigationController?.setNavigationBarHidden(false, animated: false); self.navigationController?.setViewControllers([(UIApplication.shared.keyWindow?.rootViewController?.storyboard?.instantiateViewController(withIdentifier: "ROOT"))!], animated: true);
            
            
        }));
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent;
    }
}
