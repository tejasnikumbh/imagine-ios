//
//  OTypeOneTableViewCell.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/17/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class OTypeOneTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var baseContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let screenBounds = UIScreen.mainScreen().bounds
        let screenWidth = screenBounds.width
        
        let gapWidth = CGFloat(1.0)
        let frameWidth = screenWidth/2.0 - gapWidth
        let frameHeight = CGFloat(216.0)
        
        let firstWindow = createWindow(0, y: 0, width: frameWidth, height: frameHeight)
        let secondWindow = createWindow(frameWidth + gapWidth*2, y: 0, width: frameWidth, height: frameHeight)
        
        self.addSubview(firstWindow)
        self.addSubview(secondWindow)
        
    }
    
    func createWindow(x: CGFloat, y:CGFloat, width: CGFloat, height: CGFloat) -> UIView
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
