//
//  AppDelegate.swift
//  BlockStackBrowser
//
//  Created by lsease on 6/26/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        //handle authorization requests from 3rd party apps
        if let scheme = url.scheme, scheme == "blockstack", let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems
        {
            let appId = queryItems.filter({ $0.name == "id"}).first?.value
            let name = queryItems.filter({ $0.name == "name"}).first?.value
            
            if let topVC = topViewController(), let appId = appId, let name = name
            {
                let alert = UIAlertController(title: "Authorization Request", message: "\(name) would like access to your Blockstack profile", preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "Authorize", style: .default, handler: { (action) in
                    let url = URL(string: "bs\(appId)://token?token=12341234")!
                    UIApplication.shared.open(url, options: [:], completionHandler: { (result) in
                        
                    })
                }))
                alert.addAction(UIAlertAction(title: "Decline", style: .destructive, handler: { (action) in
                    let url = URL(string: "bs\(appId)://token?result=denied")!
                    UIApplication.shared.open(url, options: [:], completionHandler: { (result) in
                        
                    })
                }))
                topVC.present(alert, animated: true, completion: nil)
                return true
            }
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
    
    func topViewController() -> UIViewController?
    {
        if let nav = window?.rootViewController as? UINavigationController
        {
            return nav.topViewController
        }
        return nil
    }

}

