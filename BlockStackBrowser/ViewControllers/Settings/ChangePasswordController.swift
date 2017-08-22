//
//  ChangePasswordController.swift
//  BlockStackBrowser
//
//  Created by lsease on 8/22/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit

class ChangePasswordController: UIViewController {
    
    @IBOutlet var oldPassword : UITextField!
    @IBOutlet var newPassword : UITextField!
    @IBOutlet var confirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updatePressed()
    {
        if UserDataService.shared().passwordCorrect(oldPassword.text) == false
        {
            UIAlertController.showAlert(withTitle: "Incorrect Password", andMessage: "The existing password you entered is not correct", from: self)
            oldPassword.text = ""
            oldPassword.becomeFirstResponder()
            return
        }
        
        guard let pw = newPassword.text, confirmPassword.text == pw else
        {
            UIAlertController.showAlert(withTitle: "Invalid Entry", andMessage: "The new password you entered is not valid.", from: self)
            return
        }
        
        if UserDataService.shared().changePassword(original: oldPassword.text!, new: pw) == false
        {
            UIAlertController.showAlert(withTitle: "Error", andMessage: "Unable to update our password. Please try again.", from: self)
            oldPassword.text = ""
            newPassword.text = ""
            confirmPassword.text = ""
        }
        else{
            navigationController!.popViewController(animated: true)
            UIAlertController.showAlert(withTitle: "Success", andMessage: "Your password has been updated", from: self.navigationController?.parent)
        }
    }

}
