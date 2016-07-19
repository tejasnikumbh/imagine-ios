//
//  OTypeOneTableViewCell.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/17/16.
//  Copyright © 2016 Personal. All rights reserved.
//
//  =======
//  Design
//  =======
//  |------|------|
//  |      |      |
//  |      |      |
//  |      |      |
//  |------|------|

import UIKit

class OTypeOneTableViewCell: UITableViewCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let frameWidth = OConstants.Screen.width/2.0 - OConstants.StoryGrid.gapWidth
        let frameHeight = OConstants.StoryGrid.typeOneCellHeight
        
        let firstWindow = OUtils.StoryGrid.window(
            0,
            y: OConstants.StoryGrid.gapWidth*2,
            width: frameWidth,
            height: frameHeight,
            storyThumbnailTag: 1,
            storyTitleTag: 2,
            storyAuthorTag: 3)
        
        let secondWindow = OUtils.StoryGrid.window(
            frameWidth + OConstants.StoryGrid.gapWidth*2,
            y: OConstants.StoryGrid.gapWidth*2,
            width: frameWidth,
            height: frameHeight,
            storyThumbnailTag: 4,
            storyTitleTag: 5,
            storyAuthorTag: 6)
        
        self.addSubview(firstWindow)
        self.addSubview(secondWindow)
        
    }
}
