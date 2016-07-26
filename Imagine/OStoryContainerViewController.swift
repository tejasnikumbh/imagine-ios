//
//  OStoryContainerViewController.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/25/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class OStoryContainerViewController: UIViewController {
    var interactor: PullUpInteractor? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPanGesture()
    }
    func addPanGesture() {
        let pan = UIPanGestureRecognizer(
            target: self, action: #selector(OStoryContainerViewController.handleGesture(_:)))
        self.view.addGestureRecognizer(pan)
        self.view.userInteractionEnabled = true
    }
    
    func handleGesture(sender: UIPanGestureRecognizer) {
        let percentThreshold:CGFloat = 0.4
        
        // convert y-position to downward pull progress (percentage)
        let translation = sender.translationInView(view)
        let verticalMovement = translation.y / view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)
        guard let interactor = interactor else { return }
        print (progress)
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
