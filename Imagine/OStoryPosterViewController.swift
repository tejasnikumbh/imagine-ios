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
    var interactor: CardShrinkInteractor? = nil
    
    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let pan = UIPanGestureRecognizer(
            target: self, action: #selector(OStoryPosterViewController.handleGesture(_:)))
        self.view.addGestureRecognizer(pan)
        self.view.userInteractionEnabled = true
    }
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
    func handleGesture(sender: UIPanGestureRecognizer) {
        let percentThreshold:CGFloat = 0.08
        
        // convert y-position to downward pull progress (percentage)
        let translation = sender.translationInView(view)
        let verticalMovement = translation.y / view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)
        guard let interactor = interactor else { return }
        
        switch sender.state {
        case .Began:
            interactor.hasStarted = true
            dismissViewControllerAnimated(true, completion: nil)
        case .Changed:
            interactor.shouldFinish = progress > percentThreshold
            interactor.updateInteractiveTransition(progress)
        case .Cancelled:
            interactor.hasStarted = false
            interactor.cancelInteractiveTransition()
        case .Ended:
            interactor.hasStarted = false
            interactor.shouldFinish
                ? interactor.finishInteractiveTransition()
                : interactor.cancelInteractiveTransition()
        default:
            break
        }
    }
}
