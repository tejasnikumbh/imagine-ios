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
    var actionDelegate: OStoryPosterPresentationProtocol! = nil
    
    override func awakeFromNib() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(OStoryGridTableViewCell.cellTapped(_:)))
        self.addGestureRecognizer(tap)
    }
    
    //MARK:- Interface Methods
    func populate() {
        // Adding white background
        let white = UIView(frame: self.contentView.bounds)
        white.backgroundColor = UIColor.whiteColor()
        self.contentView.addSubview(white)
        // Creating a particular window
        let frameWidth = OConstants.Screen.width/3.0
        let frameHeight = OUtils.StoryGrid.Cell.height(type!)
        var firstWindow: OWindow! = nil
        var secondWindow: OWindow! = nil
        var thirdWindow: OWindow! = nil
        switch type! {
        case 1: // Two equiwidth windows
            firstWindow = OWindow(
                x: 0,
                y: OConstants.StoryGrid.gapWidth*2,
                width: frameWidth * 1.5,
                height: frameHeight - OConstants.StoryGrid.gapWidth*2,
                card: cards[0])
            secondWindow = OWindow(
                x: frameWidth * 1.5 + OConstants.StoryGrid.gapWidth*2,
                y: OConstants.StoryGrid.gapWidth*2,
                width: frameWidth * 1.5,
                height: frameHeight - OConstants.StoryGrid.gapWidth*2,
                card: cards[1])
        case 2: // Three Equi width windows Layout
            firstWindow = OWindow(
                x: 0,
                y: OConstants.StoryGrid.gapWidth*2,
                width: frameWidth,
                height: frameHeight - OConstants.StoryGrid.gapWidth*2,
                card: cards[0])
            secondWindow = OWindow(
                x: frameWidth + OConstants.StoryGrid.gapWidth*2,
                y: OConstants.StoryGrid.gapWidth*2,
                width: frameWidth,
                height: frameHeight - OConstants.StoryGrid.gapWidth*2,
                card: cards[1])
            thirdWindow = OWindow(
                x: frameWidth*2 + OConstants.StoryGrid.gapWidth*4,
                y: OConstants.StoryGrid.gapWidth*2,
                width: frameWidth,
                height: frameHeight - OConstants.StoryGrid.gapWidth*2,
                card: cards[2])
           break
        case 3: // Big left window small 2 right ones
            firstWindow = OWindow(
                x: 0,
                y: OConstants.StoryGrid.gapWidth*2,
                width: frameWidth*2 + OConstants.StoryGrid.gapWidth*2,
                height: frameHeight - OConstants.StoryGrid.gapWidth*2,
                card: cards[0])
            secondWindow = OWindow(
                x: frameWidth*2 + OConstants.StoryGrid.gapWidth*4,
                y: OConstants.StoryGrid.gapWidth*2,
                width: frameWidth,
                height: frameHeight/2.0 - OConstants.StoryGrid.gapWidth*2,
                card: cards[1])
            thirdWindow = OWindow(
                x: frameWidth*2 + OConstants.StoryGrid.gapWidth*4,
                y: frameHeight/2.0 + OConstants.StoryGrid.gapWidth*2,
                width: frameWidth,
                height: frameHeight/2.0 - OConstants.StoryGrid.gapWidth*2,
                card: cards[2])
            break
        case 4: // Big right one, small 2 left ones
            firstWindow = OWindow(
                x: 0,
                y: OConstants.StoryGrid.gapWidth*2,
                width: frameWidth,
                height: frameHeight/2.0 - OConstants.StoryGrid.gapWidth*2,
                card: cards[0])
            secondWindow = OWindow(
                x: 0,
                y: frameHeight/2.0 + OConstants.StoryGrid.gapWidth*2,
                width: frameWidth,
                height: frameHeight/2.0 - OConstants.StoryGrid.gapWidth*2,
                card: cards[1])
            thirdWindow = OWindow(
                x: frameWidth + OConstants.StoryGrid.gapWidth*2,
                y: OConstants.StoryGrid.gapWidth*2,
                width: frameWidth*2.0,
                height: frameHeight - OConstants.StoryGrid.gapWidth*2,
                card: cards[2])
            break
        default:
            break
        }
        firstWindow.view.tag = 1
        secondWindow.view.tag = 2
        self.contentView.addSubview(firstWindow.view)
        self.contentView.addSubview(secondWindow.view)
        if type! != 1 {
            thirdWindow.view.tag = 3
            self.contentView.addSubview(thirdWindow.view)
        }
    }
    
    // MARK:- Private Methods
    @objc private func cellTapped(gestureRecognizer: UITapGestureRecognizer) {
        let touchPoint = gestureRecognizer.locationInView(self)
        for v in (gestureRecognizer.view?.subviews[0].subviews)! {
            if v.tag == 1 && v.frame.contains(touchPoint){
                self.actionDelegate.presentStoryPoster(v, card: cards[0])
                break
            } else if v.tag == 2 && v.frame.contains(touchPoint){
                self.actionDelegate.presentStoryPoster(v, card: cards[1])
                break
            } else if v.tag == 3 && v.frame.contains(touchPoint){
                self.actionDelegate.presentStoryPoster(v, card: cards[2])
                break
            }
        }
    }
}

