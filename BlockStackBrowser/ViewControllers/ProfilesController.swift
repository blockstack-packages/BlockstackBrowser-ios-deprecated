//
//  ProfilesController.swift
//  BlockStackBrowser
//
//  Created by lsease on 6/26/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit
import BlockstackCoreApi_iOS

class ProfilesController: UIViewController {
    

    @IBOutlet var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ProfilesController : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if indexPath.row == 0
        {
            cell.textLabel?.text = "Create New Profile"
            cell.imageView?.image = #imageLiteral(resourceName: "ic_add_circle_outline_black_24px")
        }
        else{
            // Configure the cell...
            cell.textLabel?.text = "1M7j2EUFjz3hkfEwNTWKGWA7KJ8BLeJ5ur"
            cell.imageView?.image = nil
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0
        {
            
        }else{
            performSegue(withIdentifier: "showProfile", sender: tableView)
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
