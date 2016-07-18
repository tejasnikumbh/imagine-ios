//
//  HomeViewController.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/16/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class StoryGridViewController: UIViewController {

    // Array of story cards models
    let cardsPerCell = 3
    var storyCards: [OStoryCard]!
    var cellTypes: [Int]!
    
    // MARK:- View Lifecycle + View Base Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewSettings()
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return .LightContent
    }
    
    // MARK:- Setup Methods
    func setupViewSettings() {
        storyCards = OStoryCardFactory.defaultStoryCards()
        cellTypes = [2, 3, 4, 1, 2, 4, 3]
        /*
        var i = 0 // Assuming the story card count is a multiple of 3
        while i < storyCards.count {
            // Creates windows of type only 2,3 and 4
            cellTypes.append(Int(arc4random_uniform(3) + 2))
            i += cardsPerCell
        } */
    }
}

extension StoryGridViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Since each row contains 3 story cards
        return storyCards.count/cardsPerCell
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = getCellForRow(tableView, row: cellTypes[indexPath.row])
        
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return OUtils.StoryGrid.cellHeight(cellTypes[indexPath.row])
    }
    
    func getCellForRow(tableView: UITableView, row: Int) -> UITableViewCell {
        switch row {
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("OTypeOne") as! OTypeOneTableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("OTypeTwo") as! OTypeTwoTableViewCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCellWithIdentifier("OTypeThree") as!
            OTypeThreeTableViewCell
            return cell
        case 4:
            let cell = tableView.dequeueReusableCellWithIdentifier("OTypeFour") as! OTypeFourTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("OTypeOne") as! OTypeOneTableViewCell
            return cell
        }
    }
    
}

