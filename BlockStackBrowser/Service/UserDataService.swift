//
//  UserDataService.swift
//  BlockStackBrowser
//
//  Created by lsease on 8/1/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import Foundation
import BlockstackCoreApi_iOS

public typealias GenericCompletionHandler<T> = (_ object: T?, _ error: Error?) -> Void

class UserDataService
{
    private static let UserProfilesKey = "USER_PROFILES"
    private static let PrivateKey = "BSK_PRIVATE_KEY"
    
    //a temporary static variable until actual persistence exists
    public var userProfiles : [Profile] = []
    
    public var privateKey : String?
    
    // shared instance
    class func shared() -> UserDataService {
        struct Singleton {
            static let instance = UserDataService()
        }
        return Singleton.instance
    }
    
    init()
    {
        loadPrivateKey()
        loadProfiles()
    }
    
    //reset all data on logout
    public func logout()
    {
        userProfiles = []
        privateKey = nil
        
        //logout all cloud providers
        DropboxService.shared().logout()
        AmazonCloudDriveService.shared().logout()
        GoogleDriveService.shared().logout()
        
        UserDefaults.standard.set(nil, forKey: UserDataService.UserProfilesKey)
        UserDefaults.standard.set(nil, forKey: UserDataService.PrivateKey)
        UserDefaults.standard.synchronize()
    }
    
}

//MARK: Private / Public Keys
//TODO: Implement methods
extension UserDataService
{
    private func loadPrivateKey()
    {
        privateKey = UserDefaults.standard.string(forKey: UserDataService.PrivateKey)
    }
    
    public func generatePrivateKey() -> String
    {
        return JWTUtils.shared().makeECPrivateKey()
    }
    
    public func savePrivateKey(_ privateKey : String, with password: String)
    {
        self.privateKey = privateKey
        UserDefaults.standard.set(privateKey, forKey: UserDataService.PrivateKey)
    }
    
    public func passphraseFromPrivateKey(_ pk : String) -> String
    {
        //TODO: Implement
        return "One Two Three Four Five Six Seven Eight"
    }
    
    public func publicKeyFromPrivateKey(_ pk : String) -> String
    {
        return JWTUtils.shared().derivePublicKey(privateKey: pk)
    }
    
    public func privateKeyFromPassphrase(_ phrase : String) -> String?
    {
        //TODO: Implement
        return generatePrivateKey()
    }
    
    public func publicKey() -> String?
    {
        if let pk = publicKey()
        {
            return publicKeyFromPrivateKey(pk)
        }else{
            return nil
        }
    }
}


//MARK: Profiles
extension UserDataService
{
    //MARK: Profile methods
    private func loadProfiles()
    {
        if let profileData = UserDefaults.standard.object(forKey: UserDataService.UserProfilesKey) as? Data,
            let profiles = Profile.deserializeArray(from: profileData)
        {
            userProfiles = profiles
        }else{
            
            userProfiles = []
            userProfiles.append(emptyProfile())
            
            saveProfiles()
        }
    }
    
    public func getPrimaryUserProfile() -> Profile?
    {
        return userProfiles.first
    }
    
    public func saveProfiles()
    {
        //TODO: Save to storage
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(userProfiles)
        {
            UserDefaults.standard.set(data, forKey: UserDataService.UserProfilesKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    public func addProfile(_ profile : Profile)
    {
        userProfiles.append(profile)
        saveProfiles()
    }

}

//MARK: Test Data methods
extension UserDataService
{
    func emptyProfile() -> Profile
    {
        let random = arc4random() % 1000
        var userProfile = Profile()
        userProfile.givenName = "Test"
        userProfile.familyName = "User \(random)"
        userProfile.name = "\(userProfile.givenName!) \(userProfile.familyName!)"
        userProfile.description = "This is my test profile"
        
        var btcAccount = Account()
        btcAccount.service = Account.ServiceType.bitcoin.rawValue
        btcAccount.identifier = UUID.init().uuidString[0...24]
        userProfile.account = [btcAccount]
        
        return userProfile
    }
}
