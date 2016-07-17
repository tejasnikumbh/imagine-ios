//
//  HomeViewController.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/16/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK:- View Lifecycle + View Base Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return .LightContent
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = getCellForRow(tableView, row: indexPath.row)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 216
        case 1:
            return 166
        case 2:
            return 432
        case 3:
            return 432
        default:
            return 216
        }
    }
    
    func getCellForRow(tableView: UITableView, row: Int) -> UITableViewCell {
        switch row {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("OTypeOne") as! OTypeOneTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("OTypeTwo") as! OTypeTwoTableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("OTypeThree") as!
            OTypeThreeTableViewCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCellWithIdentifier("OTypeFour") as! OTypeFourTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("OTypeOne") as! OTypeOneTableViewCell
            return cell
        }
    }
    
}

