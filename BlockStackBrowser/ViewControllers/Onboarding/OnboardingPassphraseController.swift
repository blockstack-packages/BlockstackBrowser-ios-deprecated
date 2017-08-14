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
    
    private var privateKey : String!
    private var passphrase : String!
    
    //outlets
    @IBOutlet var passphraseText : UITextField!
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var continueButton : UIButton!
    @IBOutlet var backButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        privateKey = UserDataService.shared().generatePrivateKey()
        passphrase = UserDataService.shared().passphraseFromPrivateKey(privateKey)
        
        resetState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continuePressed()
    {
        if(passphraseText.isEnabled == false)
        {
            passphraseText.isEnabled = true
            passphraseText.text = ""
            titleLabel.text = "Re-enter pass phrase"
            backButton.setTitle("Reset")
        }else
        {
            if let text = passphraseText.text, text == passphrase
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
        UserDataService.shared().savePrivateKey(privateKey, with: password)
        performSegue(withIdentifier: "continue", sender: nil)
    }
    
    @IBAction func resetState()
    {
        passphraseText.isEnabled = false
        passphraseText.text = passphrase
        backButton.setTitle("Cancel")
        titleLabel.text = "Write down this passphrase to backup your account"
    }
    
    @IBAction func backPressed()
    {
        if(passphraseText.isEnabled == false)
        {
            navigationController!.popViewController(animated: true)
        }
        else
        {
            resetState()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
