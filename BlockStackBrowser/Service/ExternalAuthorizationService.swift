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
        guard let decodedToken = TokenSigner.decodeUnsecured(responseData: requestToken),
            let redirectUri = decodedToken["redirect_uri"] as? String else
        {
            return
        }
        
        //TODO: Create a full response
        let response = createAuthResponse()
        
        //TODO Load values from the supplied app manifest to display app info
        if let signedResponse = TokenSigner.signUnsecured(requestData: response), let topVC = UIViewController.top()
        {
            let alert = UIAlertController(title: "Authorization Request", message: "An App would like access to your Blockstack profile", preferredStyle: .actionSheet)
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
    
    private func createAuthResponse() -> [String : Any]
    {
       return  ["token" : UUID.init().uuidString[0...20] as Any]
    }
}
    


