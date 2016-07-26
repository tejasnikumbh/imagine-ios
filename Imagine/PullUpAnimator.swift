//
//  PullUpAnimator.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/25/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class PullUpAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var duration = 0.4
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval
    {
        return duration
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning)
    {
        let containerView = transitionContext.containerView()!
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        toView.frame.origin.y = fromView.frame.height
        containerView.addSubview(toView)
        UIView.animateKeyframesWithDuration(
            duration,
            delay: 0.0,
            options: .CalculationModeCubic,
            animations: { 
                UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 1,
                    animations: {
                    fromView.frame.origin.y -= fromView.frame.height
                    toView.frame.origin.y = 0
                })
            }) { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}
