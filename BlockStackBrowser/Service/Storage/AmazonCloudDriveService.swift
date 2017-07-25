//
//  DropboxService.swift
//  BlockStackBrowser
//
//  Created by lsease on 7/21/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import Foundation
import UIKit

class AmazonCloudDriveService : NSObject, StorageProvider
{
    static let AppId = "amzn1.application.12365f40f02c429c946d51cbfa71de0a"
    static let Scopes = ["profile"]
    
    var accessToken : String?
    
    // shared instance
    class func shared() -> StorageProvider {
        struct Singleton {
            static let instance = AmazonCloudDriveService()
        }
        return Singleton.instance
    }
    
    func setup()
    {
        AIMobileLib.getAccessToken(forScopes: AmazonCloudDriveService.Scopes, withOverrideParams: [:], delegate: self)
    }
    
    func isAuthorized() -> Bool{
        return accessToken != nil
    }
    
    func logIn(from controller: UIViewController)
    {
        _ = AIMobileLib.authorizeUser(forScopes: AmazonCloudDriveService.Scopes, delegate: self)
    }
    
    func logout()
    {
        accessToken = nil
        AIMobileLib.clearAuthorizationState(self)
    }
}

extension AmazonCloudDriveService : AIAuthenticationDelegate
{
    func requestDidSucceed(_ apiResult: APIResult!) {
        if apiResult.api == API.getAccessToken, let tokenString = apiResult.result as? String
        {
            accessToken = tokenString
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.Notifications.dropboxStatusChanged), object: nil)
        }
        
        else if apiResult.api == API.clearAuthorizationState
        {
            accessToken = nil
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.Notifications.dropboxStatusChanged), object: nil)
        }
        
        else if apiResult.api == API.authorizeUser
        {
            AIMobileLib.getAccessToken(forScopes: AmazonCloudDriveService.Scopes, withOverrideParams: [:], delegate: self)
        }
        
    }
    
    func requestDidFail(_ errorResponse: APIError!) {
        
    }
}
