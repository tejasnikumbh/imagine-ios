//
//  OUtils.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/17/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit
import Foundation

class OUtils {
    // MARK:- UI Methods
    static func getDisplayDialogBox(title: String? = "Once Upon a Time",
                                     message: String?) -> UIAlertController
    {
        let alertDialog = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.Default,
            handler: nil)
        alertDialog.addAction(okAction)
        return alertDialog
    }
    
    // MARK:- Validity Utils
    static func checkValidEmail(email: String) -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(email)
    }
    
}