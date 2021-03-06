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
    @IBOutlet var btcValueLabel : UILabel!
    
    @IBOutlet var amountText : UITextField!
    @IBOutlet var passwordText : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hide keyboard on tap
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard)))
        
        //show a QR Code
        codeLabel.text = UserDataService.shared().address()
        sendToCode.image = codeLabel.text?.toQRCode()
        
        let balance = UserDataService.shared().btcBalance()
        btcValueLabel.text = String(format: "%.2f BTC", balance)
        
        //calculate and display the value of USD
        self.usdValueLabel.text = ""
        BitcoinPriceService.currentBitcoinPrice { (price) -> (Void) in
            if let price = price
            {
                self.usdValueLabel.text = "= $" + String(describing: balance * price.floatValue)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func hideKeyboard()
    {
        self.amountText.resignFirstResponder()
        passwordText.resignFirstResponder()
        codeText.resignFirstResponder()
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
    
    @IBAction func sendPressed()
    {
        //TODO: implement
        //for now, validate the password was correct by trying to load the private key
        if UserDataService.shared().passwordCorrect(passwordText.text)
        {
            UIAlertController.showAlert(withTitle: "Success", andMessage: "Sending btc with loaded private key", from: self)
        }else{
            UIAlertController.showAlert(withTitle: "Invalid password", andMessage: "The password you entered was invalid.", from: self)
            passwordText.text = ""
        }
    }
    
}
