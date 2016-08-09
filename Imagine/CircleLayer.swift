//
//  CircleLayer.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 8/10/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class CircleLayer: CAShapeLayer {
    var animationDuration = 1.0
    var circlePath: UIBezierPath {
        get { return self.circlePath }
        set { self.path = newValue.CGPath }
    }
    override init() {
        super.init()
        // Default circlePath
        circlePath = UIBezierPath(ovalInRect:
            CGRect(x: 0, y: 0, width: 50.0, height: 50.0))
        fillColor = UIColor.blackColor().CGColor
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func translate(translationInX: CGFloat) {
        CATransaction.begin()
        let translateAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        translateAnimation.fromValue = self.frame.origin.x
        translateAnimation.toValue = self.frame.origin.x + translationInX
        translateAnimation.duration = animationDuration
        translateAnimation.fillMode = kCAFillModeForwards
        translateAnimation.removedOnCompletion = false
        addAnimation(translateAnimation, forKey: nil)
        CATransaction.commit()
    }
    
}
