//
//  UserDataService.swift
//  BlockStackBrowser
//
//  Created by lsease on 8/1/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import Foundation
import BlockstackCoreApi_iOS
import SwiftKeychainWrapper

public typealias GenericCompletionHandler<T> = (_ object: T?, _ error: Error?) -> Void

class UserDataService
{
    private static let UserProfilesKey = "USER_PROFILES"
    private static let PrivateKeyPassphrase = "BSK_PRIVATE_KEY_PASSPHRASE"
    
    //a temporary static variable until actual persistence exists
    public var userProfiles : [Profile] = []
    
    private var privateKeyPassphrase : String?
    
    // shared instance
    class func shared() -> UserDataService {
        struct Singleton {
            static let instance = UserDataService()
        }
        return Singleton.instance
    }
    
    init()
    {
        loadPrivateKeyPassphrase()
        loadProfiles()
    }
    
    //reset all data on logout
    public func logout()
    {
        userProfiles = []
        privateKeyPassphrase = nil
        
        //logout all cloud providers
        DropboxService.shared().logout()
        AmazonCloudDriveService.shared().logout()
        GoogleDriveService.shared().logout()
        
        UserDefaults.standard.set(nil, forKey: UserDataService.UserProfilesKey)
        UserDefaults.standard.synchronize()
        
        KeychainWrapper.standard.removeObject(forKey: UserDataService.PrivateKeyPassphrase, withAccessibility: KeychainItemAccessibility.whenUnlockedThisDeviceOnly)
    }
    
    public func loggedIn() -> Bool
    {
        return privateKeyPassphrase != nil
    }
}

//MARK: BTC balance
extension UserDataService
{
    public func btcBalance() -> Float
    {
        return 1
    }
    
}

//MARK: Private / Public Keys
extension UserDataService
{
    private func loadPrivateKeyPassphrase()
    {
        if let passphrase = KeychainWrapper.standard.string(forKey: UserDataService.PrivateKeyPassphrase, withAccessibility: KeychainItemAccessibility.whenUnlockedThisDeviceOnly)
        {
            self.privateKeyPassphrase = passphrase
        }
    }
    
    
    public func generatePassphrase() -> String
    {
        return CryptoUtils.shared().generatePassphrase()
    }
    
    public func savePrivateKeyPhrase(_ privateKeyPhrase : String, with password: String)
    {
        KeychainWrapper.standard.set(privateKeyPhrase, forKey: UserDataService.PrivateKeyPassphrase, withAccessibility: KeychainItemAccessibility.whenUnlockedThisDeviceOnly)
        loadPrivateKeyPassphrase()
    }
    
    public func publicKeyFromPrivateKey(_ pk : String) -> String
    {
        return CryptoUtils.shared().derivePublicKey(privateKey: pk)
    }
    
    private func privateKeyFromPassphrase(_ phrase : String) -> String?
    {
        return CryptoUtils.shared().privateKey(from: phrase)
    }
    
    public func publicKey() -> String?
    {
        if let pk = privateKey()
        {
            return publicKeyFromPrivateKey(pk)
        }else{
            return nil
        }
    }
    
    public func privateKey() -> String?
    {
        if let phrase = privateKeyPassphrase
        {
            return privateKeyFromPassphrase(phrase)
        }
        return nil
    }
    
    public func address() -> String?
    {
        if let pub = publicKey()
        {
            return CryptoUtils.shared().address(from: pub)
        }
        return nil
    }
}


//MARK: Profiles
extension UserDataService
{
    public func setUserNotificationEmail(_ email : String)
    {
        //TODO: implement
    }
    
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
        userProfile.givenName =  "User \(random)"
        userProfile.familyName = ""
        userProfile.name = "\(userProfile.givenName!) \(userProfile.familyName!)"
        userProfile.description = ""
        
        var btcAccount = Account()
        btcAccount.service = Account.ServiceType.bitcoin.rawValue
        let phrase = CryptoUtils.shared().makeECPrivateKey()
        let pubKey = CryptoUtils.shared().derivePublicKey(privateKey: phrase)
        let address = CryptoUtils.shared().address(from: pubKey)
        btcAccount.identifier = address
        userProfile.account = [btcAccount]
        
        return userProfile
    }
}
