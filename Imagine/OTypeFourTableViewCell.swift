//
//  OTypeFourTableViewCell.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/17/16.
//  Copyright © 2016 Personal. All rights reserved.
//
//  =======
//  Design
//  =======
//  |----|----------|
//  |    |          |
//  |    |          |
//  |----|          |
//  |    |          |
//  |    |          |
//  |----|----------|

import UIKit

class OTypeFourTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        let frameWidth = OConstants.Screen.width/3.0
        let frameHeight = OConstants.StoryGrid.typeFourCellHeight
        
        let firstWindow = OUtils.StoryGrid.window(
            0,
            y: OConstants.StoryGrid.gapWidth*2,
            width: frameWidth,
            height: frameHeight/2.0 - OConstants.StoryGrid.gapWidth*3)
        
        let secondWindow = OUtils.StoryGrid.window(
            0,
            y: frameHeight/2.0 + OConstants.StoryGrid.gapWidth,
            width: frameWidth,
            height: frameHeight/2.0 - OConstants.StoryGrid.gapWidth)
        
        let thirdWindow = OUtils.StoryGrid.window(
            frameWidth + OConstants.StoryGrid.gapWidth*2,
            y: OConstants.StoryGrid.gapWidth*2.0,
            width: frameWidth*2.0,
            height: frameHeight - OConstants.StoryGrid.gapWidth*2)
        
        self.addSubview(firstWindow)
        self.addSubview(secondWindow)
        self.addSubview(thirdWindow)
    }
    
}
