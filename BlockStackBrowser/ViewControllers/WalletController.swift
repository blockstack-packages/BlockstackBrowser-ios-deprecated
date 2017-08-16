//
//  WalletController.swift
//  BlockStackBrowser
//
//  Created by lsease on 6/28/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit
import CDZQRScanningViewController

class WalletController: UIViewController {
    
    @IBOutlet var sendView: UIView!
    @IBOutlet var receiveView : UIView!
    @IBOutlet var segment : UISegmentedControl!
    @IBOutlet var sendToCode : UIImageView!
    @IBOutlet var codeText : UITextField!
    @IBOutlet var usdValueLabel : UILabel!
    @IBOutlet var codeLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //show a QR Code
        codeLabel.text = UserDataService.shared().publicKey()
        sendToCode.image = codeLabel.text?.toQRCode()
        
        //calculate and display the value of USD
        self.usdValueLabel.text = ""
        BitcoinPriceService.currentBitcoinPrice { (price) -> (Void) in
            if let price = price
            {
                self.usdValueLabel.text = "= $" + String(describing: price)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentPressed()
    {
        if(segment.selectedSegmentIndex == 0)
        {
            sendView.isHidden = true
            receiveView.isHidden = false
        }else{
            sendView.isHidden = false
            receiveView.isHidden = true
        }
    }
    
    @IBAction func scanCode()
    {
        let scanVC = CDZQRScanningViewController()!
        let nav = UINavigationController(rootViewController: scanVC)
        scanVC.resultBlock = {(result) in
            if let result = result{
                self.codeText.text = result
            }
            nav.dismiss(animated: true, completion: nil)
        }
        scanVC.errorBlock = {(error) in
            nav.dismiss(animated: true, completion: nil)
        }
        scanVC.cancelBlock = {
            nav.dismiss(animated: true, completion: nil)
        }
        present(nav, animated: true, completion: nil)
    }
    
    @IBAction func copyCode()
    {
        UIPasteboard.general.string = codeLabel.text
    }
    
}
