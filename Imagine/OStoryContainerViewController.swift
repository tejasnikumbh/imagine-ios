//
//  OStoryContainerViewController.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/25/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit
import Photos
import AssetsLibrary
import LiquidFloatingActionButton

class OStoryContainerViewController: UIViewController {
    
    var posterSnapshot: UIImage? = nil
    var card: OStoryCard? = nil
    var activate = false
    var interactor: PercentInteractor? = nil
    
    var liquidButton: LiquidFloatingActionButton!
    var liquidButtonCells: [LiquidFloatingCell] = []
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var storyContent: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        addStory()
        addPanDownGesture()
        addLongPressGesture()
    }
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        if liquidButton == nil {
            addLiquidButton()
        }
        let margins = OConstants.Margin.extraBigTop + OConstants.Margin.bigTop + OConstants.Margin.extraBigBottom
        let height = storyContent.bounds.height + storyTitle.bounds.height + margins
        contentViewHeightConstraint.constant = height
    }
    
    func addStory()
    {
        guard let card = card else { return }
        guard let story = OStoryFactory.fetchStory(card.storyId, completion: nil) else { return }
        storyTitle.text = card.title
        storyContent.text = story.text()
        storyContent.font = UIFont(name: OConstants.Fonts.appleSDGothicNeoRegular,
                                   size: OConstants.Screen.width * 0.048)
    }
    func addLiquidButton()
    {
        addLiquidButtonCells()
        let frame = CGRect(
            x: OConstants.Margin.bigLeft,
            y: view.frame.height - OConstants.LiquidButton.height - OConstants.Margin.bigBottom,
            width: OConstants.LiquidButton.width, height: OConstants.LiquidButton.height)
        liquidButton = LiquidButtonViewUtils.createButton(frame, style: .Up, color: UIColor.linkedInBlue(), image: UIImage(named: "share")!, datasource: self, delegate: self)
        liquidButton.alpha = 0.0
        view.addSubview(liquidButton)
    }
    func addLiquidButtonCells()
    {
        liquidButtonCells.append(LiquidButtonViewUtils.cellFactory("insta"))
        liquidButtonCells.append(LiquidButtonViewUtils.cellFactory("fb"))
        liquidButtonCells.append(LiquidButtonViewUtils.cellFactory("twitter"))
    }
    func addPanDownGesture()
    {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(OStoryContainerViewController.panDownGesture(_:)))
        pan.delegate = self
        contentView.addGestureRecognizer(pan)
    }
    func addLongPressGesture()
    {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(OStoryContainerViewController.longPressGesture(_:)))
        longPress.delegate = self
        storyContent.addGestureRecognizer(longPress)
        storyContent.userInteractionEnabled = true
    }
    func longPressGesture(sender: UILongPressGestureRecognizer)
    {
        switch sender.state {
        case .Began:
            let scene = UIImageView(frame: self.view.frame)
            scene.image = card?.image
            scene.contentMode = .ScaleAspectFill
            scene.alpha = 0.0
            scene.userInteractionEnabled = true
            view.addSubview(scene)
            scene.bringToLife()
            break
        case .Ended:
            let scene = view.subviews.last
            scene!.kill(0.4, completion: {
                scene!.removeFromSuperview()
            })
            break
        default:
            break
        }
    }
    func panDownGesture(sender: UIPanGestureRecognizer)
    {
        let percentThreshold:CGFloat = 0.1
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

extension OStoryContainerViewController: UIGestureRecognizerDelegate {
    // MARK:- UIGestureRecognizer Delegate Methods
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer,shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool
    {
        return true
    }
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool
    {
        if gestureRecognizer.isKindOfClass(UILongPressGestureRecognizer) {
            return true
        } else { // Pan Down Gesture Recognizer
            return contentScrollView.contentOffset.y <= 0
        }
    }
}

extension OStoryContainerViewController: LiquidFloatingActionButtonDataSource, LiquidFloatingActionButtonDelegate {
    // MARK:- Liquid Floating Action Button Datasource methods
    func cellForIndex(index: Int) -> LiquidFloatingCell
    {
        return liquidButtonCells[index]
    }
    func numberOfCells(liquidFloatingActionButton: LiquidFloatingActionButton) -> Int
    {
        return liquidButtonCells.count
    }
    // MARK:- Liquid Floating Action Button Delegate Methods
    func liquidFloatingActionButton(liquidFloatingActionButton: LiquidFloatingActionButton, didSelectItemAtIndex index: Int)
    {
        guard let posterSnapshot = posterSnapshot else { return }
        if index == 0 { self.shareToInstagram(posterSnapshot) }
        if index == 1 { self.shareToFacebook(posterSnapshot) }
        if index == 2 { self.shareToTwitter(posterSnapshot) }
    }
    
}

extension OStoryContainerViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        guard let liquidButton = liquidButton else { return }
        let contentOffSet = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let screenHeight = view.frame.height
        let fadeInRange = CGFloat(150.0)
        if contentOffSet < fadeInRange {
            liquidButton.alpha = fmin(contentOffSet/fadeInRange, 1.0)
            return
        }
        if contentOffSet + screenHeight > contentHeight - fadeInRange {
            liquidButton.alpha = fmin((contentHeight - contentOffSet - screenHeight)/fadeInRange, 1.0)
            return
        }
        liquidButton.alpha = 1.0
    }
}
