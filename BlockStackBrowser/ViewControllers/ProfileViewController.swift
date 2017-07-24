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
    
    var profile : Profile!
    var username : String?
    
    var isOwned = false
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var imageView : UIImageView!
    @IBOutlet var userNameButton : UIButton!
    @IBOutlet var detailsLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        showProfile()
    }
    
    func showProfile()
    {
        addressLabel.text = profile.bitcoinAddress()
        nameLabel.text = profile.name
        
        if (addressLabel.text ?? "").characters.count <= 0
        {
            addressLabel.text = "No Bitcoin Wallet Associated"
        }
        
        if isOwned == false
        {
            userNameButton.isHidden = true
        }
        
        var details = ""
        if let bio = profile.description
        {
            details = details + bio
        }
        
        if let address = profile.address?.addressLocality
        {
            if details.characters.count > 0
            {
                details = details + "\n"
            }
            details = details + address
        }
        detailsLabel.text = details
        
        showQRCode()
    }
    
    func showQRCode()
    {
        if let _ = profile.bitcoinAddress()
        {
            imageView.image = addressLabel.text?.toQRCode()
        }
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
