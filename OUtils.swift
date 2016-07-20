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
            let storyTitle = UILabel(frame:
                CGRect(
                    x: width*OConstants.Window.Scaling.Title.leftMargin,
                    y: height*OConstants.Window.Scaling.Title.upperMargin,
                    width: width*OConstants.Window.Scaling.Title.width,
                    height: height*OConstants.Window.Scaling.Title.height))
            storyTitle.font = UIFont(name: "futura",
                                     size: height*OConstants.Window.Scaling.Title.fontSize)
            storyTitle.minimumScaleFactor = 0.5
            storyTitle.numberOfLines = 0
            storyTitle.adjustsFontSizeToFitWidth = true
            storyTitle.text = "Rain Man"
            storyTitle.textColor = UIColor.whiteColor()
            storyTitle.tag = storyTitleTag!
            
            let storyAuthor = UILabel(frame:
                CGRect(
                    x: width*OConstants.Window.Scaling.Author.leftMargin,
                    y: height*OConstants.Window.Scaling.Author.upperMargin,
                    width: width*OConstants.Window.Scaling.Author.width,
                    height: height*OConstants.Window.Scaling.Author.height))
            storyAuthor.font = UIFont.italicSystemFontOfSize(height*OConstants.Window.Scaling.Author.fontSize)
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