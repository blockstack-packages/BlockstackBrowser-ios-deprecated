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
        case dropbox = 0, google, amazon, microsoft
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
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if(indexPath.row == StorageMethodRows.dropbox.rawValue)
        {
            cell.textLabel?.text = "Dropbox"
            
        }
        else if(indexPath.row == StorageMethodRows.google.rawValue)
        {
            cell.textLabel?.text = "Google Drive"
        }
        else if(indexPath.row == StorageMethodRows.amazon.rawValue)
        {
            cell.textLabel?.text = "Amazon Cloud Drive"
            
        }
        else if(indexPath.row == StorageMethodRows.microsoft.rawValue)
        {
            cell.textLabel?.text = "Microsoft OneDrive"
        }
        
        cell.accessoryType = .none
        if let service = provider(for: indexPath)
        {
            cell.accessoryType = service.isAuthorized() ? .checkmark : .disclosureIndicator
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        if let storageProvider = provider(for: indexPath)
        {
            if storageProvider.isAuthorized()
            {
                storageProvider.logout()
            }else{
                storageProvider.logIn(from: self)
            }
        }
    }
    
    func provider(for indexPath: IndexPath) -> StorageProvider?
    {
        if indexPath.row == StorageMethodRows.dropbox.rawValue
        {
            return DropboxService.shared()
        }
        
        if indexPath.row == StorageMethodRows.google.rawValue
        {
            return GoogleDriveService.shared()
        }
        
        return nil
    }
}
