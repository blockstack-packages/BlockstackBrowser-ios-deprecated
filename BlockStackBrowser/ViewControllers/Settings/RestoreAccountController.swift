//
//  RestoreAccountController.swift
//  BlockStackBrowser
//
//  Created by lsease on 8/22/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit

class RestoreAccountController: OnboardingRestoreController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func accountRestored()
    {
        self.navigationController!.popToRootViewController(animated: true)
        UIAlertController.showAlert(withTitle: "Success", andMessage: "Your account has been restored", from: UIViewController.top())
    }
    
}
