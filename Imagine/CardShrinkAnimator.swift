//
//  CardShinkAnimator.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/21/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class CardShrinkAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var duration = 0.4
    var destinationFrame = CGRectZero
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval
    {
        return duration
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning)
    {
        let containerView = transitionContext.containerView()!
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)! as! OStoryPosterViewController
        let initialFrame = fromView.frame
        let finalFrame = destinationFrame
        
        let xShrinkFactor = finalFrame.width/initialFrame.width
        let yShrinkFactor = finalFrame.height/initialFrame.height
        let shrinkTransform = CGAffineTransformMakeScale(xShrinkFactor, yShrinkFactor)
        
        containerView.addSubview(toView)
        containerView.bringSubviewToFront(fromView)
        UIView.animateKeyframesWithDuration(
            duration,
            delay: 0.0,
            options: .CalculationModeCubic,
            animations: {
                UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 1/4, animations: { 
                    fromViewController.pullUpView.frame.origin.y += fromViewController.pullUpView.frame.height
                })
                UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 1,
                    animations: {
                    fromView.transform = shrinkTransform
                    fromView.center = CGPoint(
                        x: CGRectGetMidX(finalFrame),
                        y: CGRectGetMidY(finalFrame))
                    fromViewController.window.storyTitle.frame.origin.y += OConstants.Screen.height*OConstants.Window.Scaling.Title.slideUpOnCardExpand
                    fromViewController.window.storyAuthor.frame.origin.y += OConstants.Screen.height*OConstants.Window.Scaling.Author.slideUpOnCardExpand
                    fromViewController.summaryLabel.frame.origin.y += OConstants.Screen.height*OConstants.Window.Scaling.Summary.height
                    fromViewController.statusBarGradient.alpha = 0.0
                })
                UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 3/4, animations: {
                    fromViewController.summaryLabel.alpha = 0.0
                    fromViewController.pullUpView.alpha = 0.0
                })
                
            }) { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}
