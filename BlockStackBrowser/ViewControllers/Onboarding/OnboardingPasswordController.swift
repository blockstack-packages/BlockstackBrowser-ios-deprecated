//
//  OnboardingPasswordController.swift
//  BlockStackBrowser
//
//  Created by lsease on 8/11/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit

class OnboardingPasswordController: UIViewController {
    
    @IBOutlet var passwordText : UITextField!
    @IBOutlet var confirmationText : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard)))
        // Do any additional setup after loading the view.
    }
    @objc func hideKeyboard()
    {
        passwordText.resignFirstResponder()
        confirmationText.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continuePressed()
    {
        if let pass = passwordText.text, pass.characters.count > 0, pass == confirmationText.text
        {
            performSegue(withIdentifier: "continue", sender: nil)
        }else
        {
            UIAlertController.showAlert(withTitle: "Invalid Entry", andMessage: "You must enter a valid password", from: self)
        }
    }
    
    @IBAction func cancelPressed()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? OnboardingPassphraseController, let pw = passwordText.text
        {
            vc.password = pw
        }
    }
 

}
