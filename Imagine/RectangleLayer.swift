//
//  RectangleLayer.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 8/10/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class RectangleLayer: CAShapeLayer {
    var animationDuration = 1.0
    var rectPath: UIBezierPath {
        get { return self.rectPath }
        set { self.path = newValue.CGPath }
    }
    override init() {
        super.init()
        // Default circlePath
        rectPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 50.0, height: 50.0))
        fillColor = UIColor.blackColor().CGColor
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func expandHorizontal(dialogWidth: CGFloat,dialogHeight: CGFloat) {
        CATransaction.begin()
        let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        expandAnimation.fromValue = self.path
        expandAnimation.toValue = UIBezierPath(rect: CGRect(x: self.frame.origin.x - dialogWidth * 0.5, y: self.frame.origin.y, width: dialogWidth, height: dialogHeight)).CGPath
        expandAnimation.duration = animationDuration
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.removedOnCompletion = false
        addAnimation(expandAnimation, forKey: nil)
        CATransaction.commit()
    }
}
