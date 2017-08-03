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
    @IBOutlet var editButton : UIButton!
    @IBOutlet var userImage : UIImageView!
    @IBOutlet var addressContainer : UIView!
    @IBOutlet var linkContainer : UIView!
    @IBOutlet var fbButton : UIButton!
    @IBOutlet var twitterButton : UIButton!
    @IBOutlet var githubButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        showProfile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss()
    {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ProfileEditController
        {
            vc.profile = profile
        }
    }
    
}

//MARK: Profile display
extension ProfileViewController
{
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
            editButton.isHidden = true
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
        
        userImage.setImageFromUrl(profile.image?.first?.contentUrl, withDefault: UIImage(named: "avatar.png"), rounding: true, completion: { (loaded) in })
        
        showQRCode()
        showAccounts()
    }
    
    func showQRCode()
    {
        if let _ = profile.bitcoinAddress()
        {
            imageView.image = addressLabel.text?.toQRCode()
        }
    }
    
    func showAccounts()
    {
        if let _ = profile.account.filter({$0.service == Account.ServiceType.facebook.rawValue}).first
        {
            fbButton.isHidden = false
            linkContainer.isHidden = false
        }
        
        if let _ = profile.account.filter({$0.service == Account.ServiceType.twitter.rawValue}).first
        {
            twitterButton.isHidden = false
            linkContainer.isHidden = false
        }
        
        if let _ = profile.account.filter({$0.service == Account.ServiceType.github.rawValue}).first
        {
            githubButton.isHidden = false
            linkContainer.isHidden = false
        }
    }
}

//MARK: Actions
extension ProfileViewController
{
    @IBAction func fbPressed()
    {
        if let identifier = profile.account.filter({$0.service == Account.ServiceType.facebook.rawValue}).first?.identifier
        {
            let url = URL(string: "https://facebook.com/\(identifier)")!
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func twitterPressed()
    {
        if let identifier = profile.account.filter({$0.service == Account.ServiceType.twitter.rawValue}).first?.identifier
        {
            let url = URL(string: "https://twitter.com/\(identifier)")!
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func githubPressed()
    {
        if let identifier = profile.account.filter({$0.service == Account.ServiceType.github.rawValue}).first?.identifier
        {
            let url = URL(string: "https://github.com/\(identifier)")!
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
}
