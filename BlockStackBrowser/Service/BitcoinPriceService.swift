//
//  BitcoinPriceService.swift
//  BlockStackBrowser
//
//  Created by lsease on 7/20/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import Foundation
import QwikHttp

class BitcoinPriceService
{
    static let TickerUrl = "https://blockchain.info/ticker"
    
    public static func currentBitcoinPrice(currency : String = "USD", handler : @escaping (NSNumber?) -> (Void) )
    {
        QwikHttp(TickerUrl, httpMethod: .get).getDictionaryResponse { (result, error, request) in
            if let result = result, let currencyResult = result[currency] as? [String : Any], let price = currencyResult["15m"] as? NSNumber
            {
                handler(price)
            }else{
                handler(nil)
            }
        }
    }
}
