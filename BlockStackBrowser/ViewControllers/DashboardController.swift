//
//  DashboardController.swift
//  BlockStackBrowser
//
//  Created by lsease on 6/26/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class DashboardController: UICollectionViewController {

    enum Rows : Int
    {
        case profiles = 0, storage, wallet, account
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //if we have no private key, launch onboarding
        if UserDataService.shared().privateKey == nil
        {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageCollectionViewCell
    
        // Configure the cell
        if indexPath.row == Rows.profiles.rawValue
        {
            cell.imageView.image = #imageLiteral(resourceName: "app-icon-profiles")
            cell.label.text = "Profiles"
        }
        else if indexPath.row == Rows.storage.rawValue
        {
            cell.imageView.image = #imageLiteral(resourceName: "app-icon-storage-light")
            cell.label.text = "Storage"
        }
        else if indexPath.row == Rows.wallet.rawValue
        {
            cell.imageView.image = #imageLiteral(resourceName: "app-icon-wallet-card-flat")
            cell.label.text = "Wallet"
        }
        else if indexPath.row == Rows.account.rawValue
        {
            cell.imageView.image = #imageLiteral(resourceName: "app-icon-settings")
            cell.label.text = "Account"
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == Rows.profiles.rawValue
        {
            performSegue(withIdentifier: "showProfiles", sender: collectionView)
        }
        else if indexPath.row == Rows.storage.rawValue
        {
            performSegue(withIdentifier: "showStorage", sender: collectionView)
        }
        else if indexPath.row == Rows.wallet.rawValue
        {
            performSegue(withIdentifier: "showWallet", sender: collectionView)
        }
        else if indexPath.row == Rows.account.rawValue
        {
            performSegue(withIdentifier: "showAccount", sender: collectionView)
        }
    }

}
