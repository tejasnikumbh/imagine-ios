//
//  Window.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/20/16.
//  Copyright © 2016 Personal. All rights reserved.
//
import UIKit

class OWindow: NSObject {
    var view:UIView! = nil
    var storyTitle: UILabel! = nil
    var storyAuthor: UILabel! = nil
    var storyThumbnail: UIImageView! = nil
    init(x: CGFloat, y:CGFloat,
        width: CGFloat, height: CGFloat,
        card: OStoryCard)
    {
        super.init()
        let window = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        // Adding story thumbnail
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageView.image = card.image
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        // This is at index 0
        self.storyThumbnail = imageView
        window.addSubview(imageView)
        
        // Adding story name and author
        let titleWidth = width * OConstants.Window.Scaling.Title.width
        let text = card.title
        let font = UIFont.storyTitleFont(height*OConstants.Window.Scaling.Title.fontSize)
        let titleHeight = UILabel.heightForView(text, font: font, width: titleWidth)
        let storyTitle = UILabel(frame:
            CGRect(
                x: width * OConstants.Window.Scaling.Title.leftMargin,
                y: height * OConstants.Window.Scaling.Author.upperMargin - titleHeight,
                width: titleWidth,
                height: titleHeight))
        storyTitle.text = text
        storyTitle.font = font
        storyTitle.numberOfLines = 0
        storyTitle.textColor = UIColor.whiteColor()
        
        let storyAuthor = UILabel(frame:
            CGRect(
                x: width*OConstants.Window.Scaling.Author.leftMargin,
                y: height*OConstants.Window.Scaling.Author.upperMargin,
                width: width*OConstants.Window.Scaling.Author.width,
                height: height*OConstants.Window.Scaling.Author.height))
        storyAuthor.font = UIFont.storyAuthorFont(height*OConstants.Window.Scaling.Author.fontSize)
        storyAuthor.minimumScaleFactor = 0.5
        storyAuthor.text = "by " + card.author
        storyAuthor.textColor = UIColor.whiteColor()
        
        // This is at index 1
        self.storyTitle = storyTitle
        window.addSubview(storyTitle)
        // This is at index 2
        self.storyAuthor = storyAuthor
        window.addSubview(storyAuthor)
        
        // Adding gradient
        let startPoint = CGFloat(0.30)
        let bounds = CGRect(x: 0, y: height*startPoint,
                            width: width, height: height*(1.0 - startPoint))
        let gradient = OUtils.UI.gradient(
            bounds,
            topColor: UIColor.clearColor().CGColor,
            bottomColor: UIColor.blackColor().CGColor,
            opacity: 0.8)
        window.layer.insertSublayer(gradient, atIndex: 1) //Index 1
        window.clipsToBounds = true
        window.userInteractionEnabled = true
        view = window
    }
}
