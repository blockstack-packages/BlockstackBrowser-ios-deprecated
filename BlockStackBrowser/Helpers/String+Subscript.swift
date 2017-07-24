//
//  String+Subscript.swift
//  BlockStackBrowser
//
//  Created by lsease on 7/24/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import Foundation

extension String{
    subscript (r: CountableClosedRange<Int>) -> String? {
        get {
            guard r.lowerBound >= 0, let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound, limitedBy: self.endIndex),
                let endIndex = self.index(startIndex, offsetBy: r.upperBound - r.lowerBound, limitedBy: self.endIndex) else { return nil }
            return String(self[startIndex...endIndex])
        }
    }
}
