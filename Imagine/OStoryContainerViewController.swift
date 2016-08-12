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
    }
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        if liquidButton == nil {
            addLiquidButton()
        }
        let indexPath = getFirstScenicParagraphIndexPath()
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if OUser.shouldShowOnboardDialog {
                let isVisible = cell.frame.origin.y < OConstants.Screen.height - OConstants.Margin.bigBottom
                let element = isVisible ? Element.Circle : Element.IndicatorBox
                showOnboardDialog(element)
                OUser.shouldShowOnboardDialog = false
            }
        }
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

// MARK:- StoryContainer TableView Methods
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
            if story.paras[indexPath.row - 1] == "..." || story.paras[indexPath.row - 1] == "END"
            { // Three dots case or END case
                paraMargin = ""
                alignment = .Center
            }
        }
        // Attach scenes to Scenic Paragraphs
        for (key, value) in story.paraImageMap {
            if String(indexPath.row - 1) == key {
                cell.attachScene(story.images[Int(value)!])
                cell.actionDelegate = self
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
            return 32.0
        } else {
            let height = UILabel.heightForView(
                "          " + story.paras[indexPath.row - 1],
                font: UIFont.storyContentFont(OConstants.Screen.width * 0.048),
                width: cellWidth)
            return height + OConstants.Margin.mediumTop + OConstants.Margin.mediumBottom
        }
    }
}

// MARK:- UIGestureRecognizer Delegate Methods
extension OStoryContainerViewController: UIGestureRecognizerDelegate {
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

// MARK:- ScrollViewDelegate Methods
extension OStoryContainerViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView)
    {   // Liquid Button Scroll In
        if liquidButton != nil {
            showLiquidButton(scrollView)
        }
    }
}

// MARK:- Liquid Button Methods
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
    // MARK:- Liquid Button View Helper Methods
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
    func showLiquidButton(scrollView: UIScrollView) {
        let contentOffSet = scrollView.contentOffset.y
        //let contentHeight = scrollView.contentSize.height
        //let screenHeight = view.frame.height
        let fadeInRange = CGFloat(100.0)
        if contentOffSet < fadeInRange {
            liquidButton.alpha = fmin(contentOffSet/fadeInRange, 1.0)
            return
        }
        /*  Fading out the liquid button at the bottom */
        /* 
         if contentOffSet + screenHeight > contentHeight - fadeInRange {
            liquidButton.alpha = fmin((contentHeight - contentOffSet - screenHeight)/fadeInRange, 1.0)
            return
        }*/
        liquidButton.alpha = 1.0
    }
}

// MARK:- Scene show protocol
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

// MARK:- Onboarding Dialog Methods
extension OStoryContainerViewController {
    func showOnboardDialog(element: Element)
    {
        var elementFrame: CGRect? = nil
        var dialogFrame: CGRect!
        switch element {
        case .Circle:
            elementFrame = highlightCircleFrame()
            dialogFrame = onboardDialogFrame(elementFrame)
            break
        case .IndicatorBox:
            elementFrame = highlightIndicatorFrame()
            dialogFrame = onboardDialogFrame(nil)
            break
        default:
            dialogFrame = onboardDialogFrame(nil)
            break
        }
        let highlightView = HighlightView(frame: view.frame, backgroundSnapshot: view.takeSnapshot(false),
                                          highlightElement: element, highlightElementFrame: elementFrame)
        let dialogView = OnboardDialog(frame: dialogFrame)
        highlightView.addSubview(dialogView)
        highlightView.alpha = 0.0
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(OStoryContainerViewController.dismissOnboardDialog(_:)))
        highlightView.addGestureRecognizer(tapGestureRecognizer)
        highlightView.userInteractionEnabled = true
        
        view.addSubview(highlightView)
        highlightView.bringToLife()
    }
    func dismissOnboardDialog(sender: UITapGestureRecognizer) {
        let view = sender.view
        view?.kill()
    }
    func highlightCircleFrame() -> CGRect
    {
        let indexPath =
            getFirstScenicParagraphIndexPath()
        let yPosition = CGFloat(tableView.cellForRowAtIndexPath(indexPath)!.frame.origin.y)
        let onboardCirclePosition = CGPointMake(4.0, yPosition)
        let circleFrame = CGRect(x: onboardCirclePosition.x, y: onboardCirclePosition.y, width: 32.0, height: 32.0)
        return circleFrame
    }
    func highlightIndicatorFrame() -> CGRect
    {
        let width = CGFloat(75.0)
        let height = CGFloat(75.0)
        let x = view.frame.width*0.5 - width*0.5
        let y = view.frame.height*0.5 - height - 75.0 - OConstants.Margin.bigBottom
        let elementFrame = CGRect(x: x, y: y, width: width, height: height)
        return elementFrame
    }
    func onboardDialogFrame(circleFrame: CGRect? = nil) -> CGRect
    {
        let width = CGFloat(200.0)
        let height = CGFloat(150.0)
        let x = view.frame.width*0.5 - width*0.5
        let y = view.frame.height*0.5 - height*0.5
        var dialogFrame = CGRect(x: x, y: y, width: width, height: height)
        if let circleFrame = circleFrame {
            dialogFrame = CGRect(x: circleFrame.origin.x + circleFrame.width + OConstants.Margin.bigLeft, y: circleFrame.origin.y, width: 200, height: 150)
        }
        return dialogFrame
    }
    func getFirstScenicParagraphIndexPath() -> NSIndexPath
    {
        var firstKey = ""
        for (key, _) in story.paraImageMap {
            firstKey = key
        }
        let paraKey = Int(firstKey)! + 1
        return NSIndexPath(forRow: paraKey, inSection: 0)
    }
}
