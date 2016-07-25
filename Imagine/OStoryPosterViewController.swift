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
    var oval:ThreeOvalLoader! = nil
    var loaderLabel: UILabel! = nil
    
    @IBOutlet weak var pullUpView: UIView!
    @IBOutlet weak var pullUpViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var storyCoverScrollView: UIScrollView!
    
    override func viewDidLoad() {
        self.storyCoverScrollView.addSubview(window.view)
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
            height: view.frame.size.width
                * OConstants.Screen.aspectRatioHeightToWidth
                * OConstants.Window.Scaling.Summary.height))
        summaryLabel.font = UIFont(name: "AppleSDGothicNeo-Regular",
                                   size: 17.0)
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
            self.summaryLabel.frame.origin.y -=
                OConstants.Screen.height * OConstants.Window.Scaling.Summary.height
            self.window.storyTitle.frame.origin.y -=
                OConstants.Screen.height * OConstants.Window.Scaling.Title.slideUpOnCardExpand
            self.window.storyAuthor.frame.origin.y -=
                OConstants.Screen.height * OConstants.Window.Scaling.Author.slideUpOnCardExpand
        }, completion: { _ in
            self.summaryVisible = true
            // Start the loader here
            let ovalLoader = ThreeOvalLoader()
            ovalLoader.frame = CGRect(
                x: 0, y: 0,
                width: OConstants.Loader.width,
                height: OConstants.Loader.height)
            ovalLoader.center = CGPoint(
                x: CGRectGetMidX(self.view.frame),
                y: CGRectGetMidY(self.window.storyTitle.frame) -
                   self.window.storyTitle.frame.height)
            let loadingText = UILabel(frame: CGRect(
                x: 0, y:0,
                width: OConstants.Loader.width,
                height: OConstants.Loader.height))
            loadingText.text = "...Fetching Story..."
            loadingText.font = UIFont(name: "AppleSDGothicNeo-Semibold",
                size: 17.0)
            loadingText.textColor = UIColor.whiteColor()
            loadingText.sizeToFit()
            loadingText.center = CGPoint(
                x: CGRectGetMidX(ovalLoader.frame),
                y: CGRectGetMidY(ovalLoader.frame) - ovalLoader.frame.height - OConstants.Margin.mediumTop)
            loadingText.alpha = 0.0
            
            self.view.addSubview(loadingText)
            self.view.addSubview(ovalLoader)
            
            UIView.animateWithDuration(ovalLoader.animationDuration * 0.5,
                animations: { 
                    loadingText.alpha = 1.0
            })
            ovalLoader.startAnimating()
            self.oval = ovalLoader
            self.loaderLabel = loadingText

            OStory.fetchDetailsFromServer({
                // Stop loader here in completion block
                NSTimer.scheduledTimerWithTimeInterval(5.0, target: self,
                    selector: #selector(OStoryPosterViewController.storyFetched),
                    userInfo: nil, repeats: false)
                // Also ask to make the pull up button visible
            })
            
        })
    }
    func storyFetched() {
        self.oval.stopAnimating()
        // Setup and pull up the read view
        pullUpView.roundCorners([.TopLeft, .TopRight], radius: 10)
        self.pullUpViewBottomConstraint.constant = 0
        UIView.animateWithDuration(0.3) {
            self.view.layoutIfNeeded()
            self.loaderLabel.alpha = 0.0
        }
    }
    func addPanGesture() {
        let pan = UIPanGestureRecognizer(
            target: self, action: #selector(OStoryPosterViewController.handleGesture(_:)))
        self.view.addGestureRecognizer(pan)
        self.view.userInteractionEnabled = true
    }
}
