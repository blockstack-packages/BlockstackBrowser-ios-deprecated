//
//  StorageController.swift
//  BlockStackBrowser
//
//  Created by lsease on 6/28/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit
import SwiftyDropbox

class StorageController: UIViewController {
    
    enum StorageMethodRows : Int{
        case dropbox = 0
    }
    
    @IBOutlet var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         NotificationCenter.default.addObserver(self, selector: #selector(self.refresh), name: NSNotification.Name(rawValue: Constants.Notifications.dropboxStatusChanged), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func refresh()
    {
        tableView.reloadData()
    }
}

extension StorageController : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if(indexPath.row == StorageMethodRows.dropbox.rawValue)
        {
            cell.textLabel?.text = "Dropbox"
            cell.accessoryType = DropboxService.shared().isAuthorized() ? .checkmark : .disclosureIndicator
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        if(DropboxService.shared().isAuthorized())
        {
            DropboxService.shared().logout()
        }else{
            DropboxService.shared().logIn(from: self)
        }
    }
}
