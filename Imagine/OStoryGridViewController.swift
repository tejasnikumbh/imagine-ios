//
//  OStoryGridViewController.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/16/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class OStoryGridViewController: UIViewController {
    // MARK:- View Lifecycle + View Base Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return .LightContent
    }
}

extension OStoryGridViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OStoryGrid.cards.count/OStoryGrid.cardsPerCell
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellType = OStoryGrid.cellTypes[indexPath.row]
        let cell = getCellForRow(tableView, type: cellType)
        cell.populate([OStoryGrid.cards[3*indexPath.row],
                    OStoryGrid.cards[3*indexPath.row + 1],
                    OStoryGrid.cards[3*indexPath.row + 2]])
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return OUtils.StoryGrid.Cell.height(OStoryGrid.cellTypes[indexPath.row])
    }
    
    func getCellForRow(tableView: UITableView, type: Int) -> UITableViewCell {
        switch type {
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

