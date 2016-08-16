//
//  Strip.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 8/10/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class Strip: UIView {
    var duration: Double = 1.0
    var color: CGColor = UIColor.blackColor().CGColor
    var stripWidth: CGFloat!
    var stripHeight: CGFloat!
    var stripCornerRadius: CGFloat!
    var leftCircle: CircleLayer!
    var rightCircle: CircleLayer!
    var centerRect: RectangleLayer!
    
    convenience init(frame: CGRect, color: CGColor) {
        self.init(frame: frame)
        self.color = color
        self.addstripLayers()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        stripWidth = frame.size.width
        stripHeight = frame.size.height
        stripCornerRadius = stripHeight * 0.5
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addstripLayers() {
        centerRect = RectangleLayer()
        centerRect.fillColor = color
        centerRect.animationDuration = duration
        centerRect.rectPath = UIBezierPath(rect: CGRect(x: stripHeight * 0.5, y: 0, width: 0, height: stripHeight))
        leftCircle = CircleLayer()
        leftCircle.fillColor = color
        leftCircle.animationDuration = duration
        leftCircle.circlePath = UIBezierPath(ovalInRect: CGRect(x: 0, y: 0, width: stripHeight, height: stripHeight))
        rightCircle = CircleLayer()
        rightCircle.fillColor = color
        rightCircle.animationDuration = duration
        rightCircle.circlePath = UIBezierPath(ovalInRect: CGRect(x: 0, y: 0, width: stripHeight, height: stripHeight))
        self.layer.addSublayer(centerRect)
        self.layer.addSublayer(leftCircle)
        self.layer.addSublayer(rightCircle)
    }
    func expand(completion: EmptyCompletionBlock? = nil) {
        leftCircle.translate(-stripWidth * 0.5 - stripHeight * 0.5)
        rightCircle.translate(stripWidth * 0.5 - stripHeight * 0.5)
        centerRect.expandHorizontal(stripWidth, stripHeight: stripHeight, completion: completion)
    }
}
