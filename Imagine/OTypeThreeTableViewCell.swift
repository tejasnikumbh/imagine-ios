//
//  OTypeThreeTableViewCell.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/17/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class OTypeThreeTableViewCell: UITableViewCell {

    @IBOutlet weak var baseContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let screenBounds = UIScreen.mainScreen().bounds
        let screenWidth = screenBounds.width
        
        let gapWidth = CGFloat(1.0)
        let frameWidth = screenWidth/3.0
        let frameHeight = CGFloat(432.0)
        
        let firstWindow = createWindow(0, y: gapWidth*2, width: frameWidth*2 + gapWidth*2, height: frameHeight)
        let secondWindow = createWindow(frameWidth*2 + gapWidth*4, y: gapWidth*2, width: frameWidth, height: frameHeight/2.0 - gapWidth*3)
        let thirdWindow = createWindow(frameWidth*2 + gapWidth*4, y: frameHeight/2.0 + gapWidth, width: frameWidth, height: frameHeight/2.0 - gapWidth)
        self.addSubview(firstWindow)
        self.addSubview(secondWindow)
        self.addSubview(thirdWindow)
        
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
