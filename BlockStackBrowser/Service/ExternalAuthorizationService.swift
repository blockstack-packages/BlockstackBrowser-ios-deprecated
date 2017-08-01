//
//  AuthorizationService.swift
//  BlockStackBrowser
//
//  Created by lsease on 7/31/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import Foundation
import SeaseAssist
import BlockstackCoreApi_iOS

class ExteralAuthorizationService
{
    // shared instance
    class func shared() -> ExteralAuthorizationService {
        struct Singleton {
            static let instance = ExteralAuthorizationService()
        }
        return Singleton.instance
    }
    
    init(){
        
    }
    
    public func processAuthorization(with requestToken : String)
    {
        guard let decodedData = TokenSigner.decodeToDataUnsecured(responseData: requestToken),
            let request = AuthRequest.deserialize(from: decodedData),
            let redirectUri = request.redirect_uri else
        {
            return
        }
        
        //read our manifest
        let manifest = request.manifest ?? AppManifest()
        
        //TODO: Create a full response
        let response = createAuthResponse()
        
        //TODO Load values from the supplied app manifest to display app info
        if let signedResponse = TokenSigner.signUnsecuredData(requestData: response.serialize()!), let topVC = UIViewController.top()
        {
            let shortTitle = manifest.shortName ?? "An App"
            let longTitle = manifest.name ?? "Authorization Request"
            let alert = UIAlertController(title: longTitle, message: "\(shortTitle) would like access to your Blockstack profile", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Authorize", style: .default, handler: { (action) in
                let url = URL(string: "\(redirectUri)?authResponse=\(signedResponse)")!
                UIApplication.shared.open(url, options: [:], completionHandler: { (result) in
                    
                })
            }))
            alert.addAction(UIAlertAction(title: "Decline", style: .destructive, handler: { (action) in
                let url = URL(string: "\(redirectUri)?result=denied")!
                UIApplication.shared.open(url, options: [:], completionHandler: { (result) in
                    
                })
            }))
            topVC.present(alert, animated: true, completion: nil)
        }
    }
    
    private func createAuthResponse() -> AuthResponse
    {
        var profile = AuthResponse.Profile()
        var response = AuthResponse()
        response.profile = profile
        profile.givenName = "Test"
        profile.familyName = "User"
        profile.description = "This is my test profile"
        response.authResponseToken = UUID.init().uuidString.substring(to: 16)
        response.appPrivateKey = UUID.init().uuidString.substring(to: 16)
        response.coreSessionToken = UUID.init().uuidString.substring(to: 16)
        response.username = "TestUser2017"
        
        return response
    }
}
    


