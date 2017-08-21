//
//  OnboardingPassphraseController.swift
//  BlockStackBrowser
//
//  Created by lsease on 8/11/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit

class OnboardingPassphraseController: UIViewController {
    
    //this should be passed in
    var password : String!
    
    private var passphrase : String!
    
    //outlets
    @IBOutlet var passphraseText : UITextView!
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var continueButton : UIButton!
    @IBOutlet var backButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passphrase = UserDataService.shared().generatePassphrase()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard)))
        resetState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continuePressed()
    {
        if(passphraseText.isUserInteractionEnabled == false)
        {
            passphraseText.isUserInteractionEnabled = true
            passphraseText.text = ""
            titleLabel.text = "Re-enter pass phrase"
            backButton.setTitle("Reset")
            passphraseText.becomeFirstResponder()
            continueButton.setTitle("Continue")
        }else
        {
            
            if let text = passphraseText.text, (text == passphrase )// || text == "Override")
            {
                saveAndContinue()
            }else{
                UIAlertController.showAlert(withTitle: "Invalid Entry", andMessage: "The passphrase didn't match", from: self)
                resetState()
            }
        }
    }
    
    func saveAndContinue()
    {
        UserDataService.shared().savePrivateKeyPhrase(passphrase, with: password)
        performSegue(withIdentifier: "continue", sender: nil)
    }
    
    @objc func hideKeyboard()
    {
        passphraseText.resignFirstResponder()
    }
    
    @IBAction func resetState()
    {
        passphraseText.isUserInteractionEnabled = false
        passphraseText.text = passphrase
        backButton.setTitle("Cancel")
        titleLabel.text = "Write down this passphrase to backup your account"
        continueButton.setTitle("I've written it down")
    }
    
    @IBAction func backPressed()
    {
        if(passphraseText.isUserInteractionEnabled == false)
        {
            navigationController!.popViewController(animated: true)
        }
        else
        {
            resetState()
        }
    }
}
