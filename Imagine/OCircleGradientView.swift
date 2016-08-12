//
//  OCircleGradientView.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 8/12/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class OCircleGradientView: UIView {
    override func drawRect(rect: CGRect) {
        let colors = [
            UIColor.blackColor().colorWithAlphaComponent(0.8).CGColor,
            UIColor.blackColor().colorWithAlphaComponent(0.0).CGColor
        ]
        let context = UIGraphicsGetCurrentContext()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bottomCenter = CGPointMake(center.x, center.y)
        let gradient = CGGradientCreateWithColors(colorSpace, colors, nil)
        CGContextDrawRadialGradient(context, gradient, bottomCenter, 0, bottomCenter, 110, .DrawsBeforeStartLocation)
        self.layer.transform = CATransform3DMakeScale(3, 1, 1)
    }
}