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
import RNCryptor

public typealias GenericCompletionHandler<T> = (_ object: T?, _ error: Error?) -> Void

class UserDataService
{
    private static let UserProfilesKey = "USER_PROFILES"
    private static let PublicKey = "BSK_PUBLIC_KEY"
    private static let PrivateKeyPassphrase = "BSK_PRIVATE_KEY_PASSPHRASE"
    
    //a temporary static variable until actual persistence exists
    public var userProfiles : [Profile] = []
    public var publicKey : String?
    
    
    // shared instance
    class func shared() -> UserDataService {
        struct Singleton {
            static let instance = UserDataService()
        }
        return Singleton.instance
    }
    
    init()
    {
        loadPublicKey()
        loadProfiles()
    }
    
    //reset all data on logout
    public func logout()
    {
        userProfiles = []
        publicKey = nil
        
        //logout all cloud providers
        DropboxService.shared().logout()
        AmazonCloudDriveService.shared().logout()
        GoogleDriveService.shared().logout()
        
        UserDefaults.standard.set(nil, forKey: UserDataService.UserProfilesKey)
        UserDefaults.standard.set(nil, forKey: UserDataService.PublicKey)
        UserDefaults.standard.synchronize()
        
        KeychainWrapper.standard.removeObject(forKey: UserDataService.PrivateKeyPassphrase, withAccessibility: KeychainItemAccessibility.whenUnlockedThisDeviceOnly)
    }
    
    public func loggedIn() -> Bool
    {
        return publicKey != nil
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
    public func generatePassphrase() -> String
    {
        return CryptoUtils.shared().generatePassphrase()
    }
    
    public func savePrivateKeyPhrase(_ privateKeyPhrase : String, with password: String) -> Bool
    {
        if let encrypted = self.encrypt(privateKeyPhrase, with: password)
        {
            KeychainWrapper.standard.set(encrypted, forKey: UserDataService.PrivateKeyPassphrase,
                                         withAccessibility: KeychainItemAccessibility.whenUnlockedThisDeviceOnly)
            
            //derive the public key and save that to the user defaults
            if let pk = privateKeyFromPassphrase(privateKeyPhrase){
                UserDefaults.standard.set(publicKeyFromPrivateKey(pk), forKey: UserDataService.PublicKey)
                UserDefaults.standard.synchronize()
            }
            
            loadPublicKey()
            
            return true
        }
        return false
    }
    
    public func privateKey(password: String) -> String?
    {
        if let phrase = privateKeyPassphrase(password: password)
        {
            return privateKeyFromPassphrase(phrase)
        }
        return nil
    }
    
    public func address() -> String?
    {
        if let pub = publicKey
        {
            return CryptoUtils.shared().address(from: pub)
        }
        return nil
    }
    
    public func passwordCorrect(_ password : String?) -> Bool
    {
        guard let password = password, password.characters.count > 0 else
        {
            return false
        }
        
        if let _ = UserDataService.shared().privateKey(password: password)
        {
            return true
        }else{
            return false
        }
    }
    
    public func changePassword(original : String, new : String) -> Bool
    {
        if let phrase = privateKeyPassphrase(password: original)
        {
            return savePrivateKeyPhrase(phrase, with: new)
        }
        return false
    }
    
    public func privateKeyPassphrase(password: String) -> String?
    {
        if let encrypted =  KeychainWrapper.standard.data(forKey: UserDataService.PrivateKeyPassphrase, withAccessibility: KeychainItemAccessibility.whenUnlockedThisDeviceOnly),
            let phrase = decrypt(encrypted, with: password)
        {
            if CryptoUtils.shared().validatePassphrase(phrase) == true
            {
                return phrase
            }
        }
        return nil
    }
}

//MARK: Helper methods
extension UserDataService
{
    private func encrypt(_ value : String, with password: String) -> Data?
    {
        if let data = value.data(using: .utf8)
        {
            return RNCryptor.encrypt(data: data, withPassword: password)
        }
        return nil
    }
    
    private func decrypt(_ value : Data, with password: String) -> String?
    {
            if let decryptedData = try? RNCryptor.decrypt(data: value, withPassword: password)
            {
                return String(data: decryptedData, encoding: .utf8)
            }
        
        return nil
    }
    
    private func privateKeyFromPassphrase(_ phrase : String) -> String?
    {
        return CryptoUtils.shared().privateKey(from: phrase)
    }
    
    private func publicKeyFromPrivateKey(_ pk : String) -> String
    {
        return CryptoUtils.shared().derivePublicKey(privateKey: pk)
    }
    
    private func loadPublicKey()
    {
        publicKey = UserDefaults.standard.string(forKey: UserDataService.PublicKey)
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
