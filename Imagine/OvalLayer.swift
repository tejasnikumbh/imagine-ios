//
//  OvalLayer.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/23/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class OvalLayer: CAShapeLayer {
    
    private var timer: NSTimer! = nil
    private var isAnimating = false
    
    var animationDuration: CFTimeInterval = 0.45
    private var ovalPathSmall: UIBezierPath! = nil
    private var ovalPathLarge: UIBezierPath! = nil
    var ovalPath: UIBezierPath {
        get {
            return self.ovalPath
        }
        set {
            self.ovalPathLarge = newValue
            self.ovalPathSmall = UIBezierPath(ovalInRect:
            CGRect(
                x: newValue.bounds.origin.x + newValue.bounds.size.width*0.35,
                y: newValue.bounds.origin.y + newValue.bounds.size.height*0.35,
                width: newValue.bounds.size.width*0.3,
                height: newValue.bounds.size.height*0.3))
        }
    }
    override init() {
        super.init()
        fillColor = UIColor.whiteColor().CGColor
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimating() {
        if !isAnimating {
            timer = NSTimer.scheduledTimerWithTimeInterval(animationDuration*2, target: self,
                    selector: #selector(OvalLayer.animate), userInfo: nil, repeats: true)
            isAnimating = true
        }
    }
    func stopAnimating() {
        if isAnimating {
            timer.invalidate()
            isAnimating = false
        }
    }
    func animate() {
        self.expand({
            self.contract(nil)
        })
    }
    
    private func expand(completion: EmptyCompletionBlock?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            if completion != nil {
                completion!()
            }
        })
        let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        expandAnimation.fromValue = ovalPathSmall.CGPath
        expandAnimation.toValue = ovalPathLarge.CGPath
        expandAnimation.duration = animationDuration*0.99
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.removedOnCompletion = false
        addAnimation(expandAnimation, forKey: nil)
        CATransaction.commit()
    }
    private func contract(completion: EmptyCompletionBlock?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            if completion != nil {
                completion!()
            }
        })
        let contractAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        contractAnimation.fromValue = ovalPathLarge.CGPath
        contractAnimation.toValue = ovalPathSmall.CGPath
        contractAnimation.duration = animationDuration*0.99
        contractAnimation.fillMode = kCAFillModeForwards
        contractAnimation.removedOnCompletion = false
        addAnimation(contractAnimation, forKey: nil)
        CATransaction.commit()
    }
}
