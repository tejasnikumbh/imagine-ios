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
    // MARK:- varw Lifecycle + View Base Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return .LightContent
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
        cell.type = cellType
        cell.cards = [OStoryGrid.cards[3*indexPath.row],
                    OStoryGrid.cards[3*indexPath.row + 1],
                    OStoryGrid.cards[3*indexPath.row + 2]]
        cell.actionDelegate = self
        cell.populate()
        return cell
    }
    func tableView(tableView: UITableView,
                   heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return OUtils.StoryGrid.Cell.height(OStoryGrid.cellTypes[indexPath.row])
    }
}

extension OStoryGridViewController: OStoryPosterPresentationProtocol, UIViewControllerTransitioningDelegate {
    func presentStoryPoster(cardView: UIView, card: OStoryCard) {
        selectedWindow = cardView
        let posterViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("OStoryPosterViewController") as! OStoryPosterViewController
        posterViewController.card = card
        posterViewController.view = Window(x: 0, y: 0,
                                        width: OConstants.Screen.width,
                                        height: OConstants.Screen.height,
                                        card: card).view
        posterViewController.transitioningDelegate = self
        presentViewController(posterViewController, animated: true, completion: nil)
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let transition = CardExpandAnimator()
        transition.originFrame = selectedWindow.superview!.convertRect(selectedWindow.frame, toView: nil)
        return transition
    }
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
}


