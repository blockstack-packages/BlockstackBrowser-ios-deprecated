//
//  Validator.swift
//  Bedkin
//
//  Created by lsease on 11/9/16.
//  Copyright © 2016 Bedkin. All rights reserved.
//

import UIKit


//TODO: validate
class FormatHelper {
    static func formatPhoneTextForApi(textField : UITextField) -> Bool
    {
        
        guard let string = formatPhoneTextForApi(string: textField.text) else
        {
            return false
        }
        
        textField.text = string
        
        return true
    }
    
    static func formatPhoneForEdit(string : String?) -> String?
    {
        guard let _ = string else
        {
            return nil
        }
        
        var formatted = string!
        
        //remove any non numeric characters
        formatted = formatted.components(separatedBy: CharacterSet(charactersIn: "0123456789").inverted).joined()
        
        //if there is a starting 1, remove the 1
        if formatted.characters.first == "1"
        {
            formatted = formatted.substring(from: formatted.index(formatted.startIndex, offsetBy: 1))
        }
        return formatted
    }
    
    static func formatPhoneTextForApi(string : String?) -> String?
    {
        guard let _ = string else
        {
            return nil
        }
        
        var formatted = string!
        
        //remove any non numeric characters
        formatted = formatted.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        //if the number is too short, return false
        if formatted.characters.count < 10
        {
            return nil
        }
        
        //if we have exactly 10 numbers then we should add the us country code
        if formatted.characters.count == 10
        {
            formatted = "+1" + formatted
        }
        
        //ensure we have a + at the beginning
        if(formatted.characters.count > 10 && formatted.characters.first != "+")
        {
            formatted = "+" + formatted
        }
        
        return formatted
    }
    
    static func formatPhoneNumberForDisplay(apiNumber : String?) -> String?
    {
        guard let _ = apiNumber else
        {
            return apiNumber
        }

        //remove everything but numbers
        let newString = apiNumber as NSString!
        let components = newString!.components(separatedBy: CharacterSet.decimalDigits.inverted)
        var decimalString = components.joined()
        
        //find length and if we start with a 1
        let length = decimalString.characters.count
        let char = decimalString.characters.first
        let hasLeadingOne = length > 0 && char == "1"
        
        //if there is an empty string, or it is larger then 10 + 1
        if length == 0 || (length > 10 && !hasLeadingOne) || length > 11
        {
            return apiNumber
        }
        
        var index = 0 as Int
        var formattedString = ""
        
        if hasLeadingOne
        {
            formattedString = formattedString + "+1 "
            index += 1
        }
        if (length - index) > 3
        {
            let start = decimalString.index(decimalString.startIndex, offsetBy: index)
            let end = decimalString.index(start, offsetBy: 3)
            let areaCode = decimalString.substring(with: start..<end)
            formattedString = formattedString + String(format: "(%@) ", areaCode)
            index += 3
        }
        if length - index > 3
        {
            let start = decimalString.index(decimalString.startIndex, offsetBy: index)
            let end = decimalString.index(start, offsetBy: 3)
            let prefix = decimalString.substring(with: start..<end)
            formattedString = formattedString + String(format: "%@-", prefix)
            index += 3
        }
        
        let remainder = decimalString.substring(from: decimalString.index(decimalString.startIndex, offsetBy: index))
        formattedString.append(remainder)
        
        
        return formattedString
    }
    
    static func removePhonePunctuation(from phone : String) -> String
    {
        return phone.replacingOccurrences(of: "+", with: "")
               .replacingOccurrences(of: "-", with: "")
                .replacingOccurrences(of: "(", with: "")
                .replacingOccurrences(of: ")", with: "")
                .replacingOccurrences(of: ".", with: "")
                .replacingOccurrences(of: " ", with: "")
    }
    
    static func isValidEmail(email: String?) -> Bool
    {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    static func isValidPassword(string : String?) -> Bool
    {
        guard let password = string, password.characters.count >= 6 else
        {
            return false
        }
        return true
    }
    
    static func isDigitOfLength(_ test : String?, from rangeStart: Int, to rangeEnd : Int) -> Bool
    {
        guard let string = test else
        {
            return false
        }
        
        guard let _ = Int(string) else
        {
            return false
        }
        
        if string.characters.count > rangeEnd || string.characters.count < rangeStart
        {
            return false
        }
        
        return true
    }
}
