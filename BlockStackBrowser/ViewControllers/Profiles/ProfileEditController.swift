//
//  ProfileEditController.swift
//  BlockStackBrowser
//
//  Created by lsease on 8/2/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import Foundation
import UIKit
import BlockstackCoreApi_iOS

protocol ProfileEditDelegate
{
    func saveProfile(_ profile : Profile)
}

class ProfileEditController : UIViewController
{
    @IBOutlet var firstName : UITextField!
    @IBOutlet var lastName : UITextField!
    @IBOutlet var bioField : UITextView!
    
    var profileIndex : Int = 0
    var delegate : ProfileEditDelegate?
    
    private var profile : Profile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profile = UserDataService.shared().userProfiles[profileIndex]
        
        //parse name fields
        if let name = profile.givenName
        {
            firstName.text = name
        }
        
        if let name = profile.familyName
        {
            lastName.text = name
        }
        
        //if name pieces aren't broken out, break them out and set them
        if profile.givenName == nil && profile.familyName == nil, let nameSlices = profile.name?.components(separatedBy: " ")
        {
            firstName.text = nameSlices.first
            if nameSlices.count > 1
            {
                lastName.text = nameSlices.last
            }
        }
        
        bioField.text = profile.description
    }
    
    @IBAction func save()
    {
        profile.givenName = firstName.text
        profile.familyName = lastName.text
        
        //assemble full name
        var fullName = ""
        if let first = profile.givenName
        {
            fullName.append(first)
        }
        if let last = profile.familyName
        {
            if fullName.characters.count > 0
            {
                fullName.append(" ")
            }
            fullName.append(last)
        }
        profile.name = fullName
        
        profile.description = bioField.text
        
        UserDataService.shared().userProfiles[profileIndex] = profile
        delegate?.saveProfile(profile)
        
        navigationController?.popViewController(animated: true)
    }
    
}
