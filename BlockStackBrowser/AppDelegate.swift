//
//  AppDelegate.swift
//  BlockStackBrowser
//
//  Created by lsease on 6/26/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit
import BlockstackCoreApi_iOS
import SwiftyDropbox
import Google
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        DropboxService.shared().setup()
        GoogleDriveService.shared().setup()
        AmazonCloudDriveService.shared().setup()
        
        // Override point for customization after application launch.
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        //handle authorization requests from 3rd party apps
        if let scheme = url.scheme, scheme == "blockstack",
            let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems,
            let requestToken = queryItems.filter({ $0.name == "authRequest"}).first?.value
        {
            ExteralAuthorizationService.shared().processAuthorization(with: requestToken)
            return true
        }
            
        //handle dropbox auth
        else if let authResult = DropboxClientsManager.handleRedirectURL(url) {
            switch authResult {
            case .success:
                print("Success! User is logged into Dropbox.")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.Notifications.dropboxStatusChanged), object: nil)
            case .cancel:
                print("Authorization flow was manually canceled by user!")
            case .error(_, let description):
                print("Error: \(description)")
            }
            return true
        }
            
        //google drive auth
        else if let scheme = url.scheme, scheme.contains("com.googleusercontent.apps") {
            let sourceApplication = options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String
            let annotation = options[UIApplicationOpenURLOptionsKey.annotation]
            return GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication: sourceApplication,
                                                 annotation: annotation)
        }
            
        //amazon auth
        else if let scheme = url.scheme, scheme.contains("amzn") {
            let sourceApplication = options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String
            return AIMobileLib.handleOpen(url, sourceApplication: sourceApplication)
        }
        
        return false
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
}

