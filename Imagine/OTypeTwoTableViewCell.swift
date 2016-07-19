//
//  OTypeTwoTableViewCell.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/17/16.
//  Copyright © 2016 Personal. All rights reserved.
//
//  =======
//  Design
//  =======
//  |----|----|----|
//  |    |    |    |
//  |    |    |    |
//  |----|----|----|

import UIKit

class OTypeTwoTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let frameWidth = OConstants.Screen.width/3.0
        let frameHeight = OConstants.StoryGrid.typeTwoCellHeight
        
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
        
        let thirdWindow = OUtils.StoryGrid.window(
            frameWidth*2 + OConstants.StoryGrid.gapWidth*4,
            y: OConstants.StoryGrid.gapWidth*2,
            width: frameWidth,
            height: frameHeight,
            storyThumbnailTag: 7,
            storyTitleTag: 8,
            storyAuthorTag: 9)
        
        self.addSubview(firstWindow)
        self.addSubview(secondWindow)
        self.addSubview(thirdWindow)
    }
}
