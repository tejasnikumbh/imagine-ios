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
    // MARK:- View Lifecycle + View Base Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        showOnboardDialog()
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func showOnboardDialog()
    {
        let dialogWidth = 160.0
        let dialogHeight = 32.0
        let dialogX = Double(view.frame.width * 0.5)
        let dialogY = Double(view.frame.height) - dialogHeight - 32.0
        let frame = CGRect(x: dialogX, y: dialogY, width: dialogWidth, height: dialogHeight)
        let shortStoryDialog = OnboardDialog(frame: frame)
        view.addSubview(shortStoryDialog)
        shortStoryDialog.expand("SHORT STORIES")
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

