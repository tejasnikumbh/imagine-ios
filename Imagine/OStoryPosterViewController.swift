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
    var window: Window!
    
    @IBOutlet weak var backButton: UIButton!
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animateWithDuration(
            0.4) {
                self.backButton.alpha = 1.0
        }
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        UIView.animateWithDuration(
            0.4) { 
                self.backButton.alpha = 0.0
        }
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    @IBAction func backButtonTapped(sender: UIButton)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
