//
//  OExtenstions.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/18/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit
import Social
import Photos
import Foundation

extension String
{
    func trim() -> String
    {
        return self.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceCharacterSet())
    }
}
extension NSMutableAttributedString {
    func bold(text:String) -> NSMutableAttributedString {
        let attrs:[String:AnyObject] = [NSFontAttributeName : UIFont(name: "AvenirNext-Medium", size: 12)!]
        let boldString = NSMutableAttributedString(string:"\(text)", attributes:attrs)
        self.appendAttributedString(boldString)
        return self
    }
    func normal(text:String)->NSMutableAttributedString {
        let normal =  NSAttributedString(string: text)
        self.appendAttributedString(normal)
        return self
    }
}
extension UILabel {
    static func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
}
extension UIView {
    static func viewWithColor(color: UIColor, frame: CGRect) -> UIView
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
    func takeSnapshot(withWatermark: Bool) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.mainScreen().scale)
        drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        if withWatermark {
            let imageWithWatermark = UIImageView(image: image)
            let watermarkBackground = UIView(frame: CGRect(x: 16, y: 16, width: 200, height: 40))
            watermarkBackground.backgroundColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.75)
            watermarkBackground.layer.cornerRadius = 8.0
            watermarkBackground.clipsToBounds = true
            
            let watermark = UILabel(frame: CGRect(x: 8, y: 4, width: 192, height: 32))
            watermark.text = "Shared via Imagine App"
            watermark.textAlignment = .Center
            watermark.font = UIFont.storyContentFont(16.0)
            watermark.adjustsFontSizeToFitWidth = true
            watermark.minimumScaleFactor = 0.5
            watermark.textColor = UIColor.whiteColor()
            
            watermarkBackground.addSubview(watermark)
            imageWithWatermark.addSubview(watermarkBackground)
            return imageWithWatermark.takeSnapshot(false)
        }
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
    static func glowYellow() -> UIColor {
        return UIColor(red: 255/255.0, green: 248/255.0, blue: 162/255.0, alpha: 1.0)
    }
    static func storyContentGray() -> UIColor {
        return UIColor(red: 120/255.0, green: 120/255.0, blue: 120/255.0, alpha: 1.0)
    }
    static func storyTitleGray() -> UIColor {
        return UIColor.darkGrayColor()
    }
}
extension UIFont {
    static func storyContentFont(size: CGFloat? = 12.0) -> UIFont {
        return UIFont(name: OConstants.Fonts.appleSDGothicNeoRegular,
                      size: size!)!
    }
    static func storyTitleFont(size: CGFloat? = 12.0) -> UIFont {
        return  UIFont(name: "futura",
                       size: size!)!
    }
    static func storyAuthorFont(size: CGFloat? = 12.0) -> UIFont {
        return UIFont(name: "Futura-MediumItalic",
                      size: size!)!
    }
    static func dialogTitleFont(size: CGFloat? = 12.0) -> UIFont {
        return UIFont(name: OConstants.Fonts.appleSDGothicNeoSemiBold,
                      size: size!)!
    }
    static func dialogContentFont(size: CGFloat? = 12.0) -> UIFont {
        return UIFont(name: OConstants.Fonts.appleSDGothicNeoRegular,
                      size: size!)!
    }
}
extension UIViewController {
    func openShareSheet(image: UIImage) {
        let objectsToShare: [AnyObject] = [image]
        let activityViewController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        activityViewController.excludedActivityTypes = [UIActivityTypeAirDrop]
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    func shareToTwitter(image: UIImage) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            let twitterSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterSheet.setInitialText(OConstants.Sharing.shareTextTwitter)
            twitterSheet.addImage(image)
            self.presentViewController(twitterSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    func shareToFacebook(image: UIImage) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            let facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookSheet.setInitialText(OConstants.Sharing.shareTextFacebook)
            facebookSheet.addImage(image)
            self.presentViewController(facebookSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    func shareToInstagram(image: UIImage)
    {
        var request: PHAssetChangeRequest? = nil
        var object: PHObjectPlaceholder? = nil
        PHPhotoLibrary.sharedPhotoLibrary().performChanges({
            request = PHAssetChangeRequest.creationRequestForAssetFromImage(image)
            object = request?.placeholderForCreatedAsset
        }, completionHandler:
        {
            (success: Bool, error: NSError?) in
            if error != nil { // Guard for error checking
                let message = "Error saving photo"
                let dialog = OUtils.UI.Dialog.displayBox(message: message)
                self.presentViewController(dialog, animated: true, completion:  nil)
                return
            }
            let path = object?.localIdentifier
            let instagramURL = NSURL(string: "instagram://library?AssetPath=" + path!)
            if UIApplication.sharedApplication().canOpenURL(instagramURL!) {
                UIApplication.sharedApplication().openURL(instagramURL!)
            } else {
                let message = "Please install the Instagram app"
                let dialog = OUtils.UI.Dialog.displayBox(message: message)
                self.presentViewController(dialog, animated: true, completion: nil)
            }
        })
    }
}