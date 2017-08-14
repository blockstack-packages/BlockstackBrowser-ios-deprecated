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
        case password = 0, logout
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
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if indexPath.row == AccountRows.password.rawValue
        {
            cell.textLabel?.text = "Change Password"
        }else if indexPath.row == AccountRows.logout.rawValue
        {
            cell.textLabel?.text = "Log Out"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //on logout clear all data and show the onboarding VC
        if(indexPath.row == AccountRows.logout.rawValue)
        {
            UserDataService.shared().logout()
            
            let dashboard = navigationController!.viewControllers.first as! DashboardController
            navigationController!.popToRootViewController(animated: true)
            dashboard.checkForOnboarding()
        }
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
