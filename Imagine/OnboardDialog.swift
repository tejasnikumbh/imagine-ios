//
//  OnboardDialog.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 8/10/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class OnboardDialog: UIView {
    var duration: Double = 1.0
    var dialogWidth: CGFloat!
    var dialogHeight: CGFloat!
    var dialogCornerRadius: CGFloat!
    var leftCircle: CircleLayer!
    var rightCircle: CircleLayer!
    var centerRect: RectangleLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        dialogWidth = frame.size.width
        dialogHeight = frame.size.height
        dialogCornerRadius = dialogHeight * 0.5
        self.addDialogLayers()
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addDialogLayers() {
        centerRect = RectangleLayer()
        centerRect.animationDuration = duration
        centerRect.rectPath = UIBezierPath(rect: CGRect(x: dialogHeight * 0.5, y: 0, width: 0, height: dialogHeight))
        leftCircle = CircleLayer()
        leftCircle.animationDuration = duration
        leftCircle.circlePath = UIBezierPath(ovalInRect: CGRect(x: 0, y: 0, width: dialogHeight, height: dialogHeight))
        rightCircle = CircleLayer()
        rightCircle.animationDuration = duration
        rightCircle.circlePath = UIBezierPath(ovalInRect: CGRect(x: 0, y: 0, width: dialogHeight, height: dialogHeight))
        self.layer.addSublayer(centerRect)
        self.layer.addSublayer(leftCircle)
        self.layer.addSublayer(rightCircle)
    }
    func expand(text: String) {
        leftCircle.translate(-dialogWidth * 0.5 - dialogHeight * 0.5)
        rightCircle.translate(dialogWidth * 0.5 - dialogHeight * 0.5)
        centerRect.expandHorizontal(dialogWidth, dialogHeight: dialogHeight)
    }
}
