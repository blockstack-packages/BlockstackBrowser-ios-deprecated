//
//  BackupAccountController.swift
//  BlockStackBrowser
//
//  Created by lsease on 8/22/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit

class BackupAccountController: UIViewController {

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
            let phrase = UserDataService.shared().privateKeyPassphrase(password: passwordText.text!)
            UIAlertController.showAlert(withTitle: "Account Recovery Phrase", andMessage: phrase, from: self)
        }
    }
}
