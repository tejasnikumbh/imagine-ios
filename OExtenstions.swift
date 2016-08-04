//
//  OExtenstions.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/18/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit
import Foundation

extension String
{
    func trim() -> String
    {
        return self.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceCharacterSet())
    }
}
extension UIView {
    static func blankView(color: UIColor, frame: CGRect) -> UIView
    {
        let view = UIView(frame: frame)
        view.backgroundColor = color
        return view
    }
    func roundCorners(corners:UIRectCorner, radius: CGFloat) -> Void
    {
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.CGPath
        self.layer.mask = mask
    }
    func takeSnapshot() -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.mainScreen().scale)
        drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    func bringToLife(duration: NSTimeInterval? = 0.4, completion: EmptyCompletionBlock? = nil) -> Void
    {
        dispatch_async(dispatch_get_main_queue()) {
            UIView.animateWithDuration(
                duration!,
                animations: {
                    self.alpha = 1.0
                },
                completion: { _ in
                    guard let completion = completion else { return }
                    completion()
            })
        }
    }
    func kill(duration: NSTimeInterval? = 0.4, completion: EmptyCompletionBlock? = nil) -> Void
    {
        dispatch_async(dispatch_get_main_queue()) { 
            UIView.animateWithDuration(
                duration!,
                animations: {
                    self.alpha = 0.0
                },
                completion: { _ in
                    guard let completion = completion else  { return }
                    completion()
            })
        }
    }
}
extension UIColor {
    static func airbnbPink() -> UIColor {
        return UIColor(red: 253/255.0, green: 92/255.0, blue: 99/255.0, alpha: 1.0)
    }
    static func paperGray() -> UIColor {
        return UIColor(red: 235/255.0, green: 235/255.0, blue: 235/255.0, alpha: 1.0)
    }
    static func algaeGreen() -> UIColor {
        return UIColor(red: 105/255.0, green: 210/255.0, blue: 153/255.0, alpha: 1.0)
    }
    static func linkedInBlue() -> UIColor {
        return UIColor(red: 0/255.0, green: 115/255.0, blue: 179/255.0, alpha: 1.0)
    }
}