//
//  DropboxService.swift
//  BlockStackBrowser
//
//  Created by lsease on 7/21/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import Foundation
import SwiftyDropbox

class MicrosoftOneDriveService : StorageProvider
{
    static let DropboxKey = "xjqmf5zd9q87dpf"
    
    // shared instance
    class func shared() -> StorageProvider {
        struct Singleton {
            static let instance = DropboxService()
        }
        return Singleton.instance
    }
    
    func setup()
    {
        DropboxClientsManager.setupWithAppKey(DropboxService.DropboxKey)
    }
    
    func isAuthorized() -> Bool{
        if let _ = DropboxClientsManager.authorizedClient
        {
            return true
        }
        return false
    }
    
    func logIn(from controller: UIViewController)
    {
        DropboxClientsManager.authorizeFromController(UIApplication.shared,
                                                      controller: controller,
                                                      openURL: { (url: URL) -> Void in
                                                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        })
    }
    
    func logout()
    {
        DropboxClientsManager.unlinkClients()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.Notifications.dropboxStatusChanged), object: nil)
    }
}
