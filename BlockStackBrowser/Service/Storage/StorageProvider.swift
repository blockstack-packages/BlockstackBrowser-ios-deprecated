//
//  StorageProvider.swift
//  BlockStackBrowser
//
//  Created by lsease on 7/24/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit

protocol StorageProvider {
    static func shared() -> StorageProvider
    func setup()
    func isAuthorized() -> Bool
    func logIn(from controller: UIViewController)
    func logout()
}
