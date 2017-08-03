//
//  ProfilesController.swift
//  BlockStackBrowser
//
//  Created by lsease on 6/26/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit
import BlockstackCoreApi_iOS
import SeaseAssist

class ProfilesController: UIViewController {
    
    var profiles : [Profile] = UserDataService.shared().getUserProfiles()

    @IBOutlet var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nav = segue.destination as? UINavigationController, let vc = nav.topViewController as? ProfileViewController, let index = tableView.indexPathForSelectedRow
        {
            vc.profile = profiles[index.row - 1]
            vc.isOwned = true
        }
    }
}

extension ProfilesController : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count + 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if indexPath.row == 0
        {
            cell.textLabel?.text = "Create New Profile"
            cell.imageView?.image = #imageLiteral(resourceName: "ic_add_circle_outline_black_24px").scalingProportionally(to: CGSize(width: 25, height: 25))
        }
        else{
            // Configure the cell...
            let profile = profiles[indexPath.row - 1]
            cell.textLabel?.text = profile.bitcoinAddress() ?? "?"
            cell.imageView?.image = nil
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0
        {
            let profile = UserDataService.emptyProfile()
            profiles.append(profile)
            UserDataService.shared().addProfile(profile)
            tableView.reloadData()
        }else{
            performSegue(withIdentifier: "showProfile", sender: tableView)
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

