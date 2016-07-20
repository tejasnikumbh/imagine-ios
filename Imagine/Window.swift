//
//  Window.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/20/16.
//  Copyright © 2016 Personal. All rights reserved.
//
import UIKit

class Window: NSObject {
    var view:UIView! = nil
    
    init(x: CGFloat, y:CGFloat,
                       width: CGFloat, height: CGFloat,
                       card: OStoryCard)
    {
        let window = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        // Adding story thumbnail
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageView.image = card.image
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
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
        storyTitle.text = card.title
        storyTitle.textColor = UIColor.whiteColor()
        
        let storyAuthor = UILabel(frame:
            CGRect(
                x: width*OConstants.Window.Scaling.Author.leftMargin,
                y: height*OConstants.Window.Scaling.Author.upperMargin,
                width: width*OConstants.Window.Scaling.Author.width,
                height: height*OConstants.Window.Scaling.Author.height))
        storyAuthor.font = UIFont.italicSystemFontOfSize(height*OConstants.Window.Scaling.Author.fontSize)
        storyAuthor.minimumScaleFactor = 0.5
        storyAuthor.text = card.author
        storyAuthor.textColor = UIColor.whiteColor()
        
        // This is at index 1
        window.addSubview(storyTitle)
        // This is at index 2
        window.addSubview(storyAuthor)
        
        // Adding gradient
        let bounds = CGRect(x: 0, y: height/2.0, width: width, height: height/2.0)
        let gradient = OUtils.UX.gradient(bounds, topColor: UIColor.clearColor().CGColor, bottomColor: UIColor.blackColor().CGColor, opacity: 0.8)
        window.layer.insertSublayer(gradient, atIndex: 1) //Index 2
        window.clipsToBounds = true
        view = window
    }
}
