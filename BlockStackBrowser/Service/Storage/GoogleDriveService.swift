//
//  DropboxService.swift
//  BlockStackBrowser
//
//  Created by lsease on 7/21/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import Foundation
import SwiftyDropbox
import Google
import GoogleSignIn

class GoogleDriveService : NSObject, StorageProvider
{
    static let ClientId = "1098865906916-lo3glar3gp09dglcgf47i3r0pq8lqinj.apps.googleusercontent.com"
    static let loginKey = "AIzaSyAoM7lFizJFMF_B2k7WJJtXwqHrpEhGdag"
    
    private let scopes = ["https://www.googleapis.com/auth/drive.file"]
    //private let service = GTLRDriveService()
    
    weak var callingController : UIViewController?
    
    // shared instance
    class func shared() -> StorageProvider {
        struct Singleton {
            static let instance = GoogleDriveService()
        }
        return Singleton.instance
    }
    
    func setup()
    {
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
    }
    
    func isAuthorized() -> Bool{
        return GIDSignIn.sharedInstance().hasAuthInKeychain()
    }
    
    func logIn(from controller: UIViewController)
    {
        callingController = controller
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().scopes = scopes
        GIDSignIn.sharedInstance().clientID = GoogleDriveService.ClientId
        GIDSignIn.sharedInstance().signIn()
    }
    
    func logout()
    {
        GIDSignIn.sharedInstance().signOut()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.Notifications.dropboxStatusChanged), object: nil)
    }
    
}

extension GoogleDriveService : GIDSignInDelegate, GIDSignInUIDelegate
{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.Notifications.dropboxStatusChanged), object: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        callingController!.present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        callingController?.dismiss(animated: true, completion: nil)
    }
}

