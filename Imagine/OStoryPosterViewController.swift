//
//  OStoryPosterViewController.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/19/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class OStoryPosterViewController: UIViewController {
    var card: OStoryCard!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    @IBAction func backButtonTapped(sender: UIButton)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
