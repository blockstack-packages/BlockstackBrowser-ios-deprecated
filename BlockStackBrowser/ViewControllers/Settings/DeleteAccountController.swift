//
//  DeleteAccountController.swift
//  BlockStackBrowser
//
//  Created by lsease on 8/22/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit

class DeleteAccountController: UIViewController {
    
    @IBOutlet var passwordText : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionPressed()
    {
        if UserDataService.shared().passwordCorrect(passwordText.text) == false
        {
            UIAlertController.showAlert(withTitle: "Warning", andMessage: "The password you entered is not correct.", from: self)
        }else
        {
            UserDataService.shared().logout()
            
            let dashboard = navigationController!.viewControllers.first as! DashboardController
            navigationController!.popToRootViewController(animated: true)
            dashboard.checkForOnboarding()
        }
    }
    
}
