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
        static func gradient(bounds: CGRect, topColor: CGColor, bottomColor: CGColor ,opacity: Float? = 0.25) -> CAGradientLayer
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
                let heights = [
                    OConstants.StoryGrid.typeOneCellHeight,
                    OConstants.StoryGrid.typeTwoCellHeight,
                    OConstants.StoryGrid.typeThreeCellHeight,
                    OConstants.StoryGrid.typeFourCellHeight
                ]
                return heights[type - 1]
            }
        }
        
        static func window(x: CGFloat, y:CGFloat,
                           width: CGFloat, height: CGFloat,
                           storyThumbnailTag: Int? = nil,
                           storyTitleTag: Int? = nil,
                           storyAuthorTag: Int? = nil) -> UIView
        {
            let window = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
            // Adding story thumbnail
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
            imageView.image = UIImage(named: "home_back")
            imageView.contentMode = .ScaleAspectFill
            imageView.tag = storyThumbnailTag!
            // This is at index 0
            window.addSubview(imageView)
            
            // Adding story name and author
            let scalingFactorTitle = CGFloat(0.085)
            let scalingFactorAuthor = CGFloat(0.035)
            let scalingFactorMarginBig = CGFloat(0.06)
            let scalingFactorMarginSmall = CGFloat(0.015)
            let storyTitle = UILabel(frame:
                CGRect(
                    x: width*scalingFactorMarginBig,
                    y: 3*height/4.0 + width*scalingFactorMarginBig*0.9,
                    width: width - width*scalingFactorMarginBig*2,
                    height: height*scalingFactorTitle*1.3))
            storyTitle.font = UIFont(name: "futura", size: height*scalingFactorTitle)
            storyTitle.minimumScaleFactor = 0.5
            storyTitle.numberOfLines = 0
            storyTitle.adjustsFontSizeToFitWidth = true
            storyTitle.text = "Rain Man"
            storyTitle.textColor = UIColor.whiteColor()
            storyTitle.tag = storyTitleTag!
            
            let storyAuthor = UILabel(frame:
                CGRect(
                    x: width*scalingFactorMarginBig*1.25,
                    y: storyTitle.frame.origin.y + storyTitle.frame.size.height + width*scalingFactorMarginSmall*0.5,
                    width: width - width*scalingFactorMarginSmall*2,
                    height: height*scalingFactorAuthor*1.5))
            storyAuthor.font = UIFont.italicSystemFontOfSize(height*scalingFactorAuthor)
            storyAuthor.minimumScaleFactor = 0.5
            storyAuthor.text = "by Aurther Conan Doyle"
            storyAuthor.textColor = UIColor.whiteColor()
            storyAuthor.tag = storyAuthorTag!
            
            // This is at index 1
            window.addSubview(storyTitle)
            // This is at index 2
            window.addSubview(storyAuthor)
            
            // Adding gradient
            let bounds = CGRect(x: 0, y: height/2.0, width: width, height: height/2.0)
            let gradient = OUtils.UX.gradient(bounds, topColor: UIColor.clearColor().CGColor, bottomColor: UIColor.blackColor().CGColor, opacity: 0.8)
            window.layer.insertSublayer(gradient, atIndex: 1) //Index 2
            window.clipsToBounds = true
            return window
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