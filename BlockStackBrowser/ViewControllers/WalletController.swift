//
//  WalletController.swift
//  BlockStackBrowser
//
//  Created by lsease on 6/28/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit

class WalletController: UIViewController {
    
    @IBOutlet var sendView: UIView!
    @IBOutlet var receiveView : UIView!
    @IBOutlet var segment : UISegmentedControl!
    @IBOutlet var sendToCode : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendToCode.image = "23r1234jklasjf".toQRCode()
        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
