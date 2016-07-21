//
//  OStoryGridTableViewCell.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/20/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class OStoryGridTableViewCell: UITableViewCell {
    
    var type: Int! = nil
    var cards: [OStoryCard]! = nil
    var windows: [UIView]! = []
    var actionDelegate: OStoryPosterPresentationProtocol! = nil
    func populate() {
        // Adding white background
        let white = UIView(frame: self.contentView.bounds)
        white.backgroundColor = UIColor.whiteColor()
        self.contentView.addSubview(white)
        // Creating a particular window
        switch type! {
        case 1:
            let frameWidth = OConstants.Screen.width/2.0 - OConstants.StoryGrid.gapWidth
            let frameHeight = OConstants.StoryGrid.typeOneCellHeight
            let firstWindow = Window(
                x: 0,
                y: OConstants.StoryGrid.gapWidth*2,
                width: frameWidth,
                height: frameHeight,
                card: cards[0])
            let secondWindow = Window(
                x: frameWidth + OConstants.StoryGrid.gapWidth*2,
                y: OConstants.StoryGrid.gapWidth*2,
                width: frameWidth,
                height: frameHeight,
                card: cards[1])
            windows.append(firstWindow.view)
            windows.append(secondWindow.view)
            self.contentView.addSubview(firstWindow.view)
            self.contentView.addSubview(secondWindow.view)
            break
        case 2:
            let frameWidth = OConstants.Screen.width/3.0
            let frameHeight = OConstants.StoryGrid.typeTwoCellHeight
            let firstWindow = Window(
                x: 0,
                y: OConstants.StoryGrid.gapWidth*2,
                width: frameWidth,
                height: frameHeight,
                card: cards[0])
            let secondWindow = Window(
                x: frameWidth + OConstants.StoryGrid.gapWidth*2,
                y: OConstants.StoryGrid.gapWidth*2,
                width: frameWidth,
                height: frameHeight,
                card: cards[1])
            let thirdWindow = Window(
                x: frameWidth*2 + OConstants.StoryGrid.gapWidth*4,
                y: OConstants.StoryGrid.gapWidth*2,
                width: frameWidth,
                height: frameHeight,
                card: cards[2])
            windows.append(firstWindow.view)
            windows.append(secondWindow.view)
            windows.append(thirdWindow.view)
            self.contentView.addSubview(firstWindow.view)
            self.contentView.addSubview(secondWindow.view)
            self.contentView.addSubview(thirdWindow.view)
            break
        case 3:
            let frameWidth = OConstants.Screen.width/3.0
            let frameHeight = OConstants.StoryGrid.typeThreeCellHeight
            let firstWindow = Window(
                x: 0,
                y: OConstants.StoryGrid.gapWidth*2,
                width: frameWidth*2 + OConstants.StoryGrid.gapWidth*2,
                height: frameHeight,
                card: cards[0])
            let secondWindow = Window(
                x: frameWidth*2 + OConstants.StoryGrid.gapWidth*4,
                y: OConstants.StoryGrid.gapWidth*2,
                width: frameWidth,
                height: frameHeight/2.0 - OConstants.StoryGrid.gapWidth*3,
                card: cards[1])
            let thirdWindow = Window(
                x: frameWidth*2 + OConstants.StoryGrid.gapWidth*4,
                y: frameHeight/2.0 + OConstants.StoryGrid.gapWidth,
                width: frameWidth,
                height: frameHeight/2.0 - OConstants.StoryGrid.gapWidth,
                card: cards[2])
            windows.append(firstWindow.view)
            windows.append(secondWindow.view)
            windows.append(thirdWindow.view)
            self.contentView.addSubview(firstWindow.view)
            self.contentView.addSubview(secondWindow.view)
            self.contentView.addSubview(thirdWindow.view)
            break
        case 4:
            let frameWidth = OConstants.Screen.width/3.0
            let frameHeight = OConstants.StoryGrid.typeFourCellHeight
            let firstWindow = Window(
                x: 0,
                y: OConstants.StoryGrid.gapWidth*2,
                width: frameWidth,
                height: frameHeight/2.0 - OConstants.StoryGrid.gapWidth*3,
                card: cards[0])
            let secondWindow = Window(
                x: 0,
                y: frameHeight/2.0 + OConstants.StoryGrid.gapWidth,
                width: frameWidth,
                height: frameHeight/2.0 - OConstants.StoryGrid.gapWidth,
                card: cards[1])
            let thirdWindow = Window(
                x: frameWidth + OConstants.StoryGrid.gapWidth*2,
                y: OConstants.StoryGrid.gapWidth*2.0,
                width: frameWidth*2.0,
                height: frameHeight - OConstants.StoryGrid.gapWidth*2,
                card: cards[2])
            windows.append(firstWindow.view)
            windows.append(secondWindow.view)
            windows.append(thirdWindow.view)
            self.contentView.addSubview(firstWindow.view)
            self.contentView.addSubview(secondWindow.view)
            self.contentView.addSubview(thirdWindow.view)
            break
        default:
            break
        }
    }
}

extension OStoryGridTableViewCell {
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print ("Touches Began")
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print ("Touches Moved")
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print ("Touches Ended")
        for touch in touches {
            if touch.view == windows[0] {
                print ("First window touched")
                if self.actionDelegate != nil {
                    self.actionDelegate.presentStoryPoster(touch.view!, card: cards[0])
                } else { return }
            } else if touch.view == windows[1] {
                print ("Second window touched")
                if self.actionDelegate != nil {
                    self.actionDelegate.presentStoryPoster(touch.view!, card: cards[1])
                } else { return }
            } else if touch.view == windows[2] {
                print ("Third window touched")
                if self.actionDelegate != nil {
                    self.actionDelegate.presentStoryPoster(touch.view!, card: cards[2])
                } else { return }
            }
        }
    }
}
