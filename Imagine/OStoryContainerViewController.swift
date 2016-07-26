//
//  OStoryContainerViewController.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/25/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class OStoryContainerViewController: UIViewController {
    var card: OStoryCard? = nil
    var activate = false
    var interactor: PercentInteractor? = nil
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var storyContent: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        addStory()
        addPanDownGesture()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let margins = CGFloat(32.0 + 16.0 + 32.0)
        let height = storyContent.bounds.height + storyTitle.bounds.height + margins
        contentViewHeightConstraint.constant = height
    }
    func addStory() {
        guard let card = card else { return }
        storyTitle.text = card.title
        // Dummy Method to create loads of text
        let text = createDummyText(card.summary)
        storyContent.text = text
        storyContent.font = UIFont(name: "AppleSDGothicNeo-Regular",
                                   size: OConstants.Screen.width * 0.048)
    }
    func createDummyText(text: String) -> String {
        var result = text
        result += "\n \n"
        result += text
        result += text
        for _ in Range(0..<6) {
            result += text
            result += "\n \n"
        }
        return result
    }
    func addPanDownGesture() {
        let pan = UIPanGestureRecognizer(
            target: self, action: #selector(OStoryContainerViewController.panDownGesture(_:)))
        pan.delegate = self
        contentView.addGestureRecognizer(pan)
    }
    
    func panDownGesture(sender: UIPanGestureRecognizer) {
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

extension OStoryContainerViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool
    {
        return true
    }
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool
    {
        return contentScrollView.contentOffset.y <= 0
    }
}