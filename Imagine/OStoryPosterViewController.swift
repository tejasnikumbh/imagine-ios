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
    var summaryVisible = false
    var summaryLabel: UILabel! = nil
    override func awakeFromNib() {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addPanGesture()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if !summaryVisible {
            slideInSummaryFromBottom()
        }
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
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
    
    func slideInSummaryFromBottom() {
        // Creating the summary label
        let summaryLabel = UILabel(frame: CGRect(
            x: OConstants.Margin.bigLeft,
            y: view.frame.size.height,
            width: view.frame.size.width - 32,
            height: view.frame.size.width*OConstants.Screen.aspectRatioHeightToWidth*OConstants.Window.Scaling.Summary.height))
        summaryLabel.text = card.summary
        summaryLabel.textColor = UIColor.whiteColor()
        summaryLabel.numberOfLines = 0
        summaryLabel.minimumScaleFactor = 0.5
        summaryLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(summaryLabel)
        self.summaryLabel = summaryLabel
        // Animating Summary label
        UIView.animateWithDuration(
        0.4, animations: {
            self.summaryLabel.frame.origin.y -= OConstants.Screen.height*OConstants.Window.Scaling.Summary.height
            self.window.storyTitle.frame.origin.y -= OConstants.Screen.height*OConstants.Window.Scaling.Title.slideUpOnCardExpand
            self.window.storyAuthor.frame.origin.y -= OConstants.Screen.height*OConstants.Window.Scaling.Author.slideUpOnCardExpand
        }, completion: { _ in
            self.summaryVisible = true
            // Start the loader here
            //let ovalLayer = OvalLayer()
            //ovalLayer.ovalPath = UIBezierPath(ovalInRect:
            //    CGRect(x: 0, y: 0, width: 50, height: 50))
            //self.view.layer.addSublayer(ovalLayer)
            let authorWidth = CGFloat((self.window.storyAuthor.text?.characters.count)!)
                                    * self.window.storyAuthor.font.pointSize
            
            let ovalLoader = ThreeOvalLoader()
            ovalLoader.frame = CGRect(
                x: self.window.storyAuthor.frame.origin.x,
                y: self.window.storyAuthor.frame.origin.y +
                   OConstants.Margin.mediumTop,
                width: OConstants.Loader.width,
                height: OConstants.Loader.height)
            ovalLoader.center = CGPoint(
                x: CGRectGetMidX(self.window.storyTitle.frame),
                y: CGRectGetMidY(self.window.storyTitle.frame) -
                   self.window.storyTitle.frame.height)
            self.view.addSubview(ovalLoader)
            ovalLoader.startAnimating()
            OStory.fetchDetailsFromServer({
                // Stop loader here in completion block
                // Also ask to make the pull up button visible
                //ovalLayer.contract()
            })
        })
    }
    func addPanGesture() {
        let pan = UIPanGestureRecognizer(
            target: self, action: #selector(OStoryPosterViewController.handleGesture(_:)))
        self.view.addGestureRecognizer(pan)
        self.view.userInteractionEnabled = true
    }
}
