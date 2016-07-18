//
//  OTypeThreeTableViewCell.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/17/16.
//  Copyright © 2016 Personal. All rights reserved.
//
//  =======
//  Design
//  =======
//  |---------|-----|
//  |         |     |
//  |         |     |
//  |         |-----|
//  |         |     |
//  |         |     |
//  |---------|-----|

import UIKit

class OTypeThreeTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let frameWidth = OConstants.Screen.width/3.0
        let frameHeight = OConstants.StoryGrid.typeThreeCellHeight
        
        let firstWindow = OUtils.StoryGrid.window(
            0,
            y: OConstants.StoryGrid.gapWidth*2,
            width: frameWidth*2 + OConstants.StoryGrid.gapWidth*2,
            height: frameHeight)
        
        let secondWindow = OUtils.StoryGrid.window(
            frameWidth*2 + OConstants.StoryGrid.gapWidth*4,
            y: OConstants.StoryGrid.gapWidth*2,
            width: frameWidth,
            height: frameHeight/2.0 - OConstants.StoryGrid.gapWidth*3)
        
        let thirdWindow = OUtils.StoryGrid.window(
            frameWidth*2 + OConstants.StoryGrid.gapWidth*4,
            y: frameHeight/2.0 + OConstants.StoryGrid.gapWidth,
            width: frameWidth,
            height: frameHeight/2.0 - OConstants.StoryGrid.gapWidth)
        
        self.addSubview(firstWindow)
        self.addSubview(secondWindow)
        self.addSubview(thirdWindow)
        
    }

}
