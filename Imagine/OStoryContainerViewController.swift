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
    var story: OStory!
    var activate = false
    var interactor: PercentInteractor? = nil
    var liquidButton: LiquidFloatingActionButton!
    var liquidButtonCells: [LiquidFloatingCell] = []

    @IBOutlet weak var tableView: UITableView!
    var panGestureRecognizerForDismiss: UIPanGestureRecognizer? = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        addPanDownGesture()
        //addLongPressGesture()
    }
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        if liquidButton == nil {
            addLiquidButton()
        }
    }
    
    func addLiquidButton()
    {
        addLiquidButtonCells()
        let frame = CGRect(
            x: OConstants.Margin.bigLeft,
            y: view.frame.height - OConstants.LiquidButton.height - OConstants.Margin.bigBottom,
            width: OConstants.LiquidButton.width, height: OConstants.LiquidButton.height)
        liquidButton = LiquidButtonViewUtils.createButton(
            frame, style: .Up, color: UIColor.linkedInBlue(),
            image: UIImage(named: "share")!, datasource: self, delegate: self)
        liquidButton.alpha = 0.0
        view.addSubview(liquidButton)
    }
    func addLiquidButtonCells()
    {
        liquidButtonCells.append(LiquidButtonViewUtils.cellFactory("share"))
        liquidButtonCells.append(LiquidButtonViewUtils.cellFactory("insta"))
        liquidButtonCells.append(LiquidButtonViewUtils.cellFactory("fb"))
        liquidButtonCells.append(LiquidButtonViewUtils.cellFactory("twitter"))
    }
    func addPanDownGesture()
    {
        panGestureRecognizerForDismiss = UIPanGestureRecognizer(target: self, action: #selector(OStoryContainerViewController.panDownGesture(_:)))
        panGestureRecognizerForDismiss!.delegate = self
        tableView.addGestureRecognizer(panGestureRecognizerForDismiss!)
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
    func gestureRecognizer(
        gestureRecognizer: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool
    {
        return true
    }
    func gestureRecognizer(
        gestureRecognizer: UIGestureRecognizer,
        shouldReceiveTouch touch: UITouch) -> Bool
    {
        if gestureRecognizer == panGestureRecognizerForDismiss! {
            return tableView.contentOffset.y <= 0
        } else { return true }
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
    func liquidFloatingActionButton(
        liquidFloatingActionButton: LiquidFloatingActionButton,
        didSelectItemAtIndex index: Int)
    {
        guard let posterSnapshot = posterSnapshot else { return }
        if index == 0 { self.openShareSheet(posterSnapshot) }
        if index == 1 { self.shareToInstagram(posterSnapshot) }
        if index == 2 { self.shareToFacebook(posterSnapshot) }
        if index == 3 { self.shareToTwitter(posterSnapshot) }
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

extension OStoryContainerViewController: OSceneShowProtocol {
    func showScene(image: UIImage)
    {
        let sceneView = UIImageView(frame: view.frame)
        sceneView.image = image
        sceneView.contentMode = .ScaleAspectFill
        sceneView.alpha = 0.0
        sceneView.userInteractionEnabled = true
        view.addSubview(sceneView)
        sceneView.bringToLife()
    }
    func killScene()
    {
        let scene = view.subviews.last
        scene!.kill(0.4, completion: {
            scene!.removeFromSuperview()
        })
    }
}

extension OStoryContainerViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // Extra 1 for Title and 1 for blank view
        return story.paras.count + 2
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("OStoryContentTableViewCell")
            as! OStoryContentTableViewCell
        var paraMargin = "          "
        var alignment = NSTextAlignment.Left
        if indexPath.row > 0 && indexPath.row < story.paras.count + 1 {
            if story.paras[indexPath.row - 1] == "..." { // Three dots case
                paraMargin = ""
                alignment = .Center
            }
        }
        // Attach scenes to Scenic Paragraphs
        for (key, value) in story.paraImageMap {
            if String(indexPath.row - 1) == key {
                cell.attachScene(story.images[Int(value)!])
                cell.actionDelegate = self
                //21B3 also good choice
                //21E5 also good choice
                paraMargin = "\u{21B3}        "
                
            }
        }
        // Populate the current cell [Make use of Cell Factory later]
        if indexPath.row == 0 {
            cell.contentLabel.text = story.title
            cell.contentLabel.font = UIFont.storyTitleFont(48.0)
            cell.contentLabel.adjustsFontSizeToFitWidth = true
            cell.contentLabel.textAlignment = .Center
            cell.contentLabel.textColor = UIColor.storyTitleGray()
        } else if indexPath.row == story.paras.count + 1 { // Last Index
            cell.contentLabel.text = ""
        } else {
            cell.contentLabel.font = UIFont.storyContentFont(OConstants.Screen.width * 0.048)
            cell.contentLabel.text = paraMargin + story.paras[indexPath.row - 1]
            cell.contentLabel.textColor = UIColor.storyContentGray()
            cell.contentLabel.textAlignment = alignment
        }
        cell.contentLabel.numberOfLines = 0
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let cellWidth = OConstants.Screen.width - OConstants.Margin.bigLeft - OConstants.Margin.bigRight
        if indexPath.row == 0 {
            let height = UILabel.heightForView(story.title, font: UIFont.storyTitleFont(48.0), width: cellWidth)
            return height + OConstants.Margin.bigTop * 2
        } else if indexPath.row == story.paras.count + 1 { // Last Index
            return 48.0
        } else {
            let height = UILabel.heightForView(
                "          " + story.paras[indexPath.row - 1],
                font: UIFont.storyContentFont(OConstants.Screen.width * 0.048),
                width: cellWidth)
            return height + OConstants.Margin.mediumTop + OConstants.Margin.mediumBottom
        }
    }
}