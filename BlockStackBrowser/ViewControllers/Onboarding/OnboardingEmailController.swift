//
//  OnboardingEmailController.swift
//  BlockStackBrowser
//
//  Created by lsease on 8/11/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit

class OnboardingEmailController: UIViewController {
    
    @IBOutlet var emailText : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard)))
    }
    
    @objc func hideKeyboard()
    {
        emailText.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continuePressed()
    {
        if FormatHelper.isValidEmail(email: emailText.text)
        {
            UserDataService.shared().setUserNotificationEmail(emailText.text!)
            performSegue(withIdentifier: "continue", sender: nil)
        }else
        {
            UIAlertController.showAlert(withTitle: "Invalid Entry", andMessage: "You must enter your email address", from: self)
        }
    }
    
}
