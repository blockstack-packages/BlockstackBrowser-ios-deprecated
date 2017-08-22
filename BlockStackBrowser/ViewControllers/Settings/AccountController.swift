//
//  AccountController.swift
//  BlockStackBrowser
//
//  Created by lsease on 6/28/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit

class AccountController: UIViewController {
    
    enum AccountRows : Int
    {
        case password = 0, backup, restore, delete, settings
    }
    
     @IBOutlet var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension AccountController : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if indexPath.row == AccountRows.password.rawValue
        {
            cell.textLabel?.text = "Change Password"
        }else if indexPath.row == AccountRows.delete.rawValue
        {
            cell.textLabel?.text = "Delete Account"
        }else if indexPath.row == AccountRows.restore.rawValue
        {
            cell.textLabel?.text = "Restore Account"
        }else if indexPath.row == AccountRows.backup.rawValue
        {
            cell.textLabel?.text = "Backup Account"
        }else if indexPath.row == AccountRows.settings.rawValue
        {
            cell.textLabel?.text = "Api Settings"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //on logout clear all data and show the onboarding VC
        if(indexPath.row == AccountRows.delete.rawValue)
        {
//            UserDataService.shared().logout()
//
//            let dashboard = navigationController!.viewControllers.first as! DashboardController
//            navigationController!.popToRootViewController(animated: true)
//            dashboard.checkForOnboarding()
            performSegue(withIdentifier: "deleteAccount", sender: nil)
        }
        else if indexPath.row == AccountRows.password.rawValue
        {
            performSegue(withIdentifier: "changePassword", sender: nil)
        }
        else if indexPath.row == AccountRows.backup.rawValue
        {
            performSegue(withIdentifier: "backupAccount", sender: nil)
        }
        else if indexPath.row == AccountRows.restore.rawValue
        {
            performSegue(withIdentifier: "restoreAccount", sender: nil)
        }
        else if indexPath.row == AccountRows.settings.rawValue
        {
            performSegue(withIdentifier: "apiSettings", sender: nil)
        }
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
