//
//  CardShinkAnimator.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/21/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class CardShinkAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var duration = 0.4
    var destinationFrame = CGRectZero
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()!
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
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
                UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 1,
                    animations: {
                    fromView.transform = shrinkTransform
                    fromView.center = CGPoint(
                        x: CGRectGetMidX(finalFrame),
                        y: CGRectGetMidY(finalFrame))
                })
                UIView.addKeyframeWithRelativeStartTime(3/4, relativeDuration: 1/4, animations: { 
                })
            }) { _ in
                transitionContext.completeTransition(true)
        }
    }
}
