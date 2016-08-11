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
    var story: OStory? = nil
    var window: OWindow!
    var panDownInteractor: PercentInteractor? = nil
    var panUpInteractor = PercentInteractor()
    var currentInteractor: PercentInteractor? = nil
    var nextInteractor: PercentInteractor? = nil
    var readEnabled = false
    var summaryVisible = false
    var summaryLabel: UILabel! = nil
    var loader:Loader! = nil
    var blankViewForStoryPoster: UIView! = nil
    
    @IBOutlet weak var pullUpView: UIView!
    @IBOutlet weak var pullUpViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var storyCoverScrollView: UIScrollView!
    
    override func viewDidLoad()
    {
        self.storyCoverScrollView.addSubview(window.view)
        super.viewDidLoad()
        addPanGesture()
    }
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        if !summaryVisible {
            self.view.userInteractionEnabled = false
            slideInSummaryFromBottom()
        }
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return .LightContent
    }
    
    func slideInSummaryFromBottom() {
        // Creating the summary label
        summaryLabel = createSummaryLabel()
        view.addSubview(summaryLabel)
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
            let ovalLoader = Loader()
            ovalLoader.alpha = 0.0
            ovalLoader.frame = CGRect(
                x: CGRectGetMidX(self.view.frame) - ovalLoader.width * 0.5,
                y: CGRectGetMidY(self.view.frame) * 0.75 - ovalLoader.height * 0.5,
                width: ovalLoader.width ,
                height: ovalLoader.height)
            self.view.addSubview(ovalLoader)
            
            ovalLoader.bringToLife(0.3)
            ovalLoader.startAnimating()
            self.loader = ovalLoader
            OStoryFactory.storyWithId(self.card.storyId, completion: {
                // Stop loader here in completion block
                NSTimer.scheduledTimerWithTimeInterval(1.0, target: self,
                    selector: #selector(OStoryPosterViewController.storyFetched),
                    userInfo: nil, repeats: false)
                // Also ask to make the pull up button visible
                // Store the story somewhere [after it was fetched from server]
                self.story = OStoryFactory.fetchStory(self.card.storyId, completion: {
                    // Nil right now, but should contain error handling
                })
            })
        })
    }
    func createSummaryLabel() -> UILabel {
        let summaryLabel = UILabel(frame: CGRect(
            x: OConstants.Margin.bigLeft,
            y: view.frame.size.height,
            width: view.frame.size.width - 32,
            height: view.frame.size.width
                * OConstants.Screen.aspectRatioHeightToWidth
                * OConstants.Window.Scaling.Summary.height))
        summaryLabel.font = UIFont(name: OConstants.Fonts.appleSDGothicNeoRegular,
                                   size: 17.0)
        summaryLabel.text = card.summary
        summaryLabel.textColor = UIColor.whiteColor()
        summaryLabel.numberOfLines = 5
        summaryLabel.minimumScaleFactor = 0.5
        summaryLabel.adjustsFontSizeToFitWidth = true
        return summaryLabel
    }
    func storyFetched() {
        loader.stopAnimating()
        view.userInteractionEnabled = true
        // Setup and pull up the read view
        pullUpView.roundCorners([.TopLeft, .TopRight], radius: 10)
        self.pullUpViewBottomConstraint.constant = 0
        UIView.animateWithDuration(0.3, animations:  {
            self.view.layoutIfNeeded()
            }, completion:  { _ in
                self.readEnabled = true
            })
    }
    func panGesture(sender: UIPanGestureRecognizer) {
        let percentThresholdForPanDown:CGFloat = 0.25
        let percentThresholdForPanUp: CGFloat = 0.1
        // convert y-position to downward pull progress (percentage)
        let translation = sender.translationInView(view)
        let verticalMovement = translation.y / view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let dProgress = CGFloat(downwardMovementPercent)
        
        let upwardMovement = fmaxf(Float(-verticalMovement), 0.0)
        let upwardMovementPercent = fminf(upwardMovement, 1.0)
        let uProgress = CGFloat(upwardMovementPercent)
        
        let pannedUp = uProgress >= dProgress
        guard let panDownInteractor = panDownInteractor else { return }
        
        let interactor = pannedUp && readEnabled ? panUpInteractor : panDownInteractor
        currentInteractor = nextInteractor
        nextInteractor = interactor
        let progress = pannedUp && readEnabled ? uProgress : dProgress
        let percentThreshold = pannedUp && readEnabled ? percentThresholdForPanUp : percentThresholdForPanDown
        if currentInteractor != nextInteractor {
            if let currentInteractor = currentInteractor {
                if let nextInteractor = nextInteractor {
                    runInteraction(.Ended, interactor: currentInteractor, pannedUp: pannedUp, progress: progress, percentThreshold: percentThreshold, completion: {
                        self.runInteraction(.Began, interactor: nextInteractor, pannedUp: pannedUp, progress: progress, percentThreshold: percentThreshold)
                    })
                    return
                }
            } else {
                runInteraction(sender.state, interactor: nextInteractor!, pannedUp: pannedUp, progress: progress, percentThreshold: percentThreshold)
                return
            }
        }
        runInteraction(sender.state, interactor: interactor, pannedUp: pannedUp,
                       progress: progress, percentThreshold: percentThreshold)
        return
    }
    func runInteraction(
        state: UIGestureRecognizerState, interactor: PercentInteractor,
        pannedUp: Bool, progress: CGFloat, percentThreshold: CGFloat, completion: EmptyCompletionBlock? = nil)
    {
        switch state {
        case .Began:
            interactor.hasStarted = true
            if pannedUp && readEnabled {
                let storyContainerViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("OStoryContainerViewController")
                    as! OStoryContainerViewController
                storyContainerViewController.story = story
                storyContainerViewController.transitioningDelegate = self
                storyContainerViewController.interactor = panUpInteractor
                storyContainerViewController.posterSnapshot = view.takeSnapshot()
                presentViewController(storyContainerViewController, animated: true, completion: nil)
            } else {
                dismissViewControllerAnimated(true, completion: nil)
            }
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
        if let completion = completion {
            completion()
        }
    }
    func addPanGesture() {
        let pan = UIPanGestureRecognizer(
            target: self, action: #selector(OStoryPosterViewController.panGesture(_:)))
        self.view.addGestureRecognizer(pan)
        self.view.userInteractionEnabled = true
    }
}

extension OStoryPosterViewController: UIViewControllerTransitioningDelegate {
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        let storyContainerShowAnimator = PullUpAnimator()
        return storyContainerShowAnimator
    }
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        let storyContainerHideAnimator = PullDownAnimator()
        return storyContainerHideAnimator
    }
    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return panUpInteractor.hasStarted ? panUpInteractor: nil
    }
    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return panUpInteractor.hasStarted ? panUpInteractor: nil
    }
}