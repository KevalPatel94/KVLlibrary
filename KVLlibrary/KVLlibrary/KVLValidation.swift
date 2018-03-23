//
//  KVLValidation.swift
//  KVLLibraries
//
//  Created by Keval Patel on 3/15/18.
//  Copyright © 2018 Keval Patel. All rights reserved.
//

import Foundation
class KVLValidation {
    func validateEmptyString(_ string : String) -> Bool
    {
        if trimWhiteSpace(string) == "" || trimWhiteSpace(string).isEmpty
        {
            return true
        }
        else
        {
            return false
        }
        
    }
    func validateEmailAddress(_ email:String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}", options: .caseInsensitive)
            return !(regex.firstMatch(in: email, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, email.count)) != nil)
            
        } catch {
            return true
        }
    }
    func validateCellNumber(_ cellNumber : String)->Bool
    {
        let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: cellNumber)
        return result
        
    }
    func trimWhiteSpace(_ string: String) -> String {
        return string.trimmingCharacters(in: CharacterSet.whitespaces)
    }
}

