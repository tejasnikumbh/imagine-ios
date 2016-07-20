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
        let cell = tableView.dequeueReusableCellWithIdentifier("OStoryGridTableViewCell") as! OStoryGridTableViewCell
        cell.type = cellType
        cell.cards = [OStoryGrid.cards[3*indexPath.row],
                    OStoryGrid.cards[3*indexPath.row + 1],
                    OStoryGrid.cards[3*indexPath.row + 2]]
        cell.populate()
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return OUtils.StoryGrid.Cell.height(OStoryGrid.cellTypes[indexPath.row])
    }
    
}

