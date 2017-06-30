//
//  ProfileViewController.swift
//  BlockStackBrowser
//
//  Created by lsease on 6/29/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit
import BlockstackCoreApi_iOS

class ProfileViewController: UIViewController {
    
    var isOwned = false
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var imageView : UIImageView!
    @IBOutlet var userNameButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        showQRCode()
    }
    
    func showQRCode()
    {
        imageView.image = addressLabel.text?.toQRCode()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss()
    {
        dismiss(animated: true, completion: nil)
    }
    
}
