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
    //a temporary static variable until actual persistence exists
    private var userProfiles : [Profile] = []
    
    // shared instance
    class func shared() -> UserDataService {
        struct Singleton {
            static let instance = UserDataService()
        }
        return Singleton.instance
    }
    
    init()
    {
        loadProfiles()
    }
    
    //MARK: Profile methods
    private func loadProfiles()
    {
        if let profileData = UserDefaults.standard.object(forKey: "USER_PROFILES") as? Data,
            let profiles = Profile.deserializeArray(from: profileData)
        {
            userProfiles = profiles
        }else{
            
            userProfiles = [UserDataService.emptyProfile()]
            
            saveProfiles()
        }
    }
    
    public func getUserProfiles() -> [Profile]
    {
        return userProfiles
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
            UserDefaults.standard.set(data, forKey: "USER_PROFILES")
            UserDefaults.standard.synchronize()
        }
    }
    
    public func addProfile(_ profile : Profile)
    {
        userProfiles.append(profile)
        saveProfiles()
    }
    
}

extension UserDataService
{
    static func emptyProfile() -> Profile
    {
        var userProfile = Profile()
        userProfile.givenName = "Test"
        userProfile.familyName = "User \(UserDataService.shared().userProfiles.count)"
        userProfile.name = "\(userProfile.givenName!) \(userProfile.familyName!)"
        userProfile.description = "This is my test profile"
        
        var btcAccount = Account()
        btcAccount.service = Account.ServiceType.bitcoin.rawValue
        btcAccount.identifier = UUID.init().uuidString[0...24]
        userProfile.account = [btcAccount]
        
        return userProfile
    }
}
