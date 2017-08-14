//
//  OnboardingRestoreController.swift
//  BlockStackBrowser
//
//  Created by lsease on 8/11/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit

class OnboardingRestoreController: UIViewController {
    
    @IBOutlet var passwordText : UITextField!
    @IBOutlet var confirmationText : UITextField!
    @IBOutlet var passphraseText : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backPressed()
    {
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func continuePressed()
    {
        if let pass = passwordText.text, pass.characters.count > 0, pass == confirmationText.text
        {
            if let passphrase = passphraseText.text
            {
                UserDataService.shared().savePrivateKeyPhrase(passphrase, with: pass)
                dismiss(animated: true, completion: nil)
            }else{
                UIAlertController.showAlert(withTitle: "Invalid Entry", andMessage: "You must enter a valid passphrase", from: self)
            }
            
        }else
        {
            UIAlertController.showAlert(withTitle: "Invalid Entry", andMessage: "You must enter a valid password", from: self)
        }
        
    }

}
