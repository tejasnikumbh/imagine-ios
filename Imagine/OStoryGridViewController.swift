//
//  OStoryGridViewController.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/16/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class OStoryGridViewController: UIViewController {
    var selectedWindow: UIView!
    var selectedWindowFrame: CGRect!
    var interactor = PercentInteractor()
    var dialogView: Strip!
    var dialogText: UILabel!
    @IBOutlet weak var storyGridTableView: UITableView!
    
    // MARK:- View Lifecycle + View Base Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        showStrip()
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        hideStrip()
    }
    
    func setupViews()
    {
        let gradientView = OUtils.UI.statusBarGradient()
        self.storyGridTableView.addSubview(gradientView)
    }
    func showStrip()
    {
        let dialogWidth = 100.0
        let dialogHeight = 32.0
        let dialogX = Double(view.frame.width * 0.5)
        let dialogY = Double(OConstants.Screen.height - OConstants.Margin.bigBottom) - dialogHeight
        let initialFrame = CGRect(x: dialogX, y: dialogY, width: dialogWidth, height: dialogHeight)
        let finalFrame = CGRect(x: dialogX - dialogWidth * 0.5, y: dialogY, width: dialogWidth, height: dialogHeight)
        let shortStoryDialog = Strip(frame: initialFrame, color: UIColor.linkedInBlue().CGColor)
        dialogView = shortStoryDialog
        let dialogLabel = UILabel(frame: finalFrame)
        dialogLabel.text = "Short Stories"
        dialogLabel.textAlignment = .Center
        dialogLabel.textColor = UIColor.whiteColor()
        dialogLabel.font = UIFont.storyContentFont(16.0)
        dialogLabel.minimumScaleFactor = 0.85
        dialogLabel.adjustsFontSizeToFitWidth = true
        dialogLabel.alpha = 0.0
        dialogText = dialogLabel
        
        view.addSubview(dialogView)
        view.addSubview(dialogText)
        dialogView.expand({
            self.dialogText.bringToLife(0.4)
        })
    }
    func hideStrip()
    {
        dialogView.kill(0.4, completion: {
            self.dialogView.removeFromSuperview()
        })
        dialogText.kill(0.4, completion: {
            self.dialogText.removeFromSuperview()
        })
    }
}

extension OStoryGridViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int
    {
        return OStoryGrid.cards.count/OStoryGrid.cardsPerCell
    }
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cellType = OStoryGrid.cellTypes[indexPath.row]
        let cellIdentifier = OUtils.StoryGrid.Cell.identifier(cellType)
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! OStoryGridTableViewCell
        dispatch_async(dispatch_get_main_queue()) {
            cell.type = cellType
            cell.cards = [OStoryGrid.cards[3*indexPath.row],
                          OStoryGrid.cards[3*indexPath.row + 1],
                          OStoryGrid.cards[3*indexPath.row + 2]]
            cell.populate()
            cell.actionDelegate = self
        }
        return cell
    }
    func tableView(tableView: UITableView,
                   heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return OUtils.StoryGrid.Cell.height(OStoryGrid.cellTypes[indexPath.row])
    }
}

extension OStoryGridViewController: UIViewControllerTransitioningDelegate {
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        let transition = CardExpandAnimator()
        if selectedWindowFrame.width < OConstants.Screen.width*0.5 {
            transition.duration = OConstants.Window.Scaling.Duration.smallWindow
        } else {
            transition.duration = OConstants.Window.Scaling.Duration.bigWindow
        }
        transition.originFrame = selectedWindowFrame
        return transition
    }
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        let transition = CardShrinkAnimator()
        if selectedWindowFrame.width < OConstants.Screen.width*0.5 {
            transition.duration = OConstants.Window.Scaling.Duration.smallWindow
        } else {
            transition.duration = OConstants.Window.Scaling.Duration.bigWindow
        }
        transition.destinationFrame = selectedWindowFrame
        return transition
    }
    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) ->UIViewControllerInteractiveTransitioning?
    {
        return interactor.hasStarted ? interactor: nil
    }
}

extension OStoryGridViewController: OStoryPosterPresentationProtocol {
    func presentStoryPoster(cardView: UIView, card: OStoryCard)
    {
        selectedWindow = cardView
        selectedWindowFrame = cardView.superview!.convertRect(cardView.frame, toView: nil)
        let posterViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("OStoryPosterViewController") as! OStoryPosterViewController
        posterViewController.card = card
        posterViewController.panDownInteractor = interactor
        let window = OWindow(x: 0, y: 0,
                             width: OConstants.Screen.width,
                             height: OConstants.Screen.height,
                             card: card)
        posterViewController.window = window
        posterViewController.transitioningDelegate = self
        presentViewController(posterViewController, animated: true, completion: nil)
    }
}

