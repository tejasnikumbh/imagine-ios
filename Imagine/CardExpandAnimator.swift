//
//  CardExpandAnimator.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/20/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class CardExpandAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var duration = 0.4
    var originFrame = CGRectZero
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval
    {
        return duration
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning)
    {
        let containerView = transitionContext.containerView()!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! OStoryPosterViewController
        let initialFrame = originFrame
        let finalFrame = toView.frame
        
        let xScaleFactor = initialFrame.width/finalFrame.width
        let yScaleFactor = initialFrame.height/finalFrame.height
        
        let scaleTransform = CGAffineTransformMakeScale(xScaleFactor, yScaleFactor)
        let scaleShrinkTransform = CGAffineTransformMakeScale(xScaleFactor*0.92, yScaleFactor*0.96)
        toView.transform = scaleTransform
        toView.center = CGPoint(
            x: CGRectGetMidX(initialFrame),
            y: CGRectGetMidY(initialFrame)
        )
        toView.clipsToBounds = true
        // Add a white view
        containerView.addSubview(UIView.viewWithColor(
            UIColor.whiteColor(),frame: initialFrame))
        containerView.addSubview(toView)
        
        UIView.animateKeyframesWithDuration(
            duration,
            delay: 0.0,
            options: .CalculationModeCubic,
            animations: {
                
                UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 1/3, animations: {
                    toView.transform = scaleShrinkTransform
                    toView.center = CGPoint(
                        x: CGRectGetMidX(initialFrame),
                        y: CGRectGetMidY(initialFrame))
                })
                UIView.addKeyframeWithRelativeStartTime(1/3, relativeDuration: 2/3, animations: {
                    toView.transform = CGAffineTransformIdentity
                    toView.center = CGPoint(
                        x: CGRectGetMidX(finalFrame),
                        y: CGRectGetMidY(finalFrame))
                    toViewController.statusBarGradient.alpha = 1.0
                })
            })
        { _ in
                transitionContext.completeTransition(true)
        }
    }
}
