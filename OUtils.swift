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
    class UX {
        static func gradient(bounds: CGRect, topColor: CGColor,
                             bottomColor: CGColor ,opacity: Float? = 0.25) -> CAGradientLayer
        {
            let gradient: CAGradientLayer = CAGradientLayer()
            gradient.frame = bounds
            gradient.colors = [topColor, bottomColor]
            gradient.opacity = opacity!
            return gradient
        }
    }
    
    class Dialog {
        static func displayBox(title: String? = "Once Upon a Time",
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
    }
    class StoryGrid {
        class Cell {
            static func height(type: Int) -> CGFloat
            {
                let frameWidthBi = OConstants.Screen.width/2.0 - OConstants.StoryGrid.gapWidth*2
                let frameWidthTri = OConstants.Screen.width/3.0
                let aspectRatio = OConstants.Screen.height/OConstants.Screen.width
                let heights = [
                    frameWidthBi*aspectRatio,
                    frameWidthTri*aspectRatio,
                    frameWidthTri*aspectRatio*2,
                    frameWidthTri*aspectRatio*2
                ]
                return heights[type - 1]
            }
            static func identifier(type: Int) -> String
            {
                let identifiers = [
                    "OStoryGridTableViewCellOne",
                    "OStoryGridTableViewCellTwo",
                    "OStoryGridTableViewCellThree",
                    "OStoryGridTableViewCellFour",
                ]
                return identifiers[type - 1]
            }
        }
    }
    class Validate {
        static func email(email: String) -> Bool
        {
            let email = email.trim()
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluateWithObject(email)
        }
    }
}