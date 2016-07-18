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
        static func cellHeight(type: Int) -> CGFloat
        {
            let heights = [
                OConstants.StoryGrid.typeOneCellHeight,
                OConstants.StoryGrid.typeTwoCellHeight,
                OConstants.StoryGrid.typeThreeCellHeight,
                OConstants.StoryGrid.typeFourCellHeight
            ]
            return heights[type - 1]
        }
        static func window(x: CGFloat, y:CGFloat,
                                          width: CGFloat, height: CGFloat) -> UIView
        {
            let window = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
            // Adding the image view of the particular story
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
            imageView.image = UIImage(named: "home_back")
            imageView.contentMode = .ScaleAspectFill
            
            window.addSubview(imageView)
            window.clipsToBounds = true
            return window
        }
    }
    
    class Validate {
        static func email(email: String) -> Bool
        {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluateWithObject(email)
        }
    }

}