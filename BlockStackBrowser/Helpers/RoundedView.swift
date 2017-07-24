//
//  RoundedView.swift
//  BlockStackBrowser
//
//  Created by lsease on 7/24/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit

class RoundedView : UIView
{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customSetup()
    }
    
    func customSetup()
    {
        self.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.8)
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 6
    }
}
