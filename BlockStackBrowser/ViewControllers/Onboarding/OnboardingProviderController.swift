//
//  OnboardingProviderController.swift
//  BlockStackBrowser
//
//  Created by lsease on 8/11/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit

class OnboardingProviderController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

         NotificationCenter.default.addObserver(self, selector: #selector(self.linked), name: NSNotification.Name(rawValue: Constants.Notifications.dropboxStatusChanged), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dropboxPressed()
    {
        DropboxService.shared().logIn(from: self)
    }
    
    @IBAction func close()
    {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func linked()
    {
        close()
    }

}
