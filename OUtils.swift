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
    class General {
        static func resizeImage(image: UIImage, scale: CGFloat) -> UIImage
        {
            let newWidth = image.size.width * scale
            let newHeight = image.size.height * scale
            let newSize = CGSizeMake(newWidth, newHeight)
            let newRect = CGRectIntegral(CGRectMake(0,0, newSize.width, newSize.height))
            UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
            let context = UIGraphicsGetCurrentContext()
            CGContextSetInterpolationQuality(context, .High)
            let flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, newSize.height)
            CGContextConcatCTM(context, flipVertical)
            CGContextDrawImage(context, newRect, image.CGImage)
            let newImage = UIImage(CGImage: CGBitmapContextCreateImage(context)!)
            UIGraphicsEndImageContext()
            return newImage
        }
        static func createDummyText(text: String) -> String
        {
            var result = text
            result += "\n \n"
            result += text
            result += text
            for _ in Range(0..<6) {
                result += text
                result += "\n \n"
            }
            return result
        }
    }
    class UI {
        static func gradient(bounds: CGRect, topColor: CGColor,
                             bottomColor: CGColor ,opacity: Float? = 0.25) -> CAGradientLayer
        {
            let gradient: CAGradientLayer = CAGradientLayer()
            gradient.frame = bounds
            gradient.colors = [topColor, bottomColor]
            gradient.opacity = opacity!
            return gradient
        }
        static func statusBarGradient() -> UIView
        {
            let frame = CGRect(x: 0, y: 0, width: OConstants.Screen.width, height: 100.0)
            let gradient = OUtils.UI.gradient(
                frame,
                topColor:  UIColor.blackColor().CGColor,
                bottomColor: UIColor.clearColor().CGColor,
                opacity: 0.40)
            let gradientView = UIView(frame: frame)
            gradientView.layer.addSublayer(gradient)
            return gradientView
        }
        class Dialog {
            static func displayBox(title: String? = "Imagine",
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