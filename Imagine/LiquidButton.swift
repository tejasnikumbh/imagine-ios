//
//  CustomDrawingActionButton.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 8/4/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit
import SnapKit
import LiquidFloatingActionButton

public class CustomCell : LiquidFloatingCell {
    var name: String = ""
    init(icon: UIImage, name: String) {
        self.name = name
        super.init(icon: icon)
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public override func setupView(view: UIView) {
        super.setupView(view)
        let label = UILabel()
        label.text = name
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: OConstants.Fonts.appleSDGothicNeoRegular, size: 12)
        addSubview(label)
        label.snp_makeConstraints { make in
            make.left.equalTo(self).offset(-80)
            make.width.equalTo(75)
            make.top.height.equalTo(self)
        }
    }
}

public class CustomDrawingActionButton: LiquidFloatingActionButton {
    override public func createPlusLayer(frame: CGRect) -> CAShapeLayer {
        let plusLayer = CAShapeLayer()
        plusLayer.lineCap = kCALineCapRound
        plusLayer.strokeColor = UIColor.whiteColor().CGColor
        plusLayer.lineWidth = 3.0
        let w = frame.width
        let h = frame.height
        let points = [
            (CGPoint(x: w * 0.25, y: h * 0.35), CGPoint(x: w * 0.75, y: h * 0.35)),
            (CGPoint(x: w * 0.25, y: h * 0.5), CGPoint(x: w * 0.75, y: h * 0.5)),
            (CGPoint(x: w * 0.25, y: h * 0.65), CGPoint(x: w * 0.75, y: h * 0.65))
        ]
        let path = UIBezierPath()
        for (start, end) in points {
            path.moveToPoint(start)
            path.addLineToPoint(end)
        }
        plusLayer.path = path.CGPath
        return plusLayer
    }
}

public class LiquidButtonViewUtils {
    static func createButton(frame: CGRect, style: LiquidFloatingActionButtonAnimateStyle, color: UIColor, image: UIImage,  datasource: LiquidFloatingActionButtonDataSource, delegate: LiquidFloatingActionButtonDelegate) -> LiquidFloatingActionButton
    {
        let floatingActionButton = CustomDrawingActionButton(frame: frame)
        floatingActionButton.animateStyle = style
        floatingActionButton.color = color
        floatingActionButton.image = image
        floatingActionButton.cellRadiusRatio = 0.42
        floatingActionButton.dataSource = datasource
        floatingActionButton.delegate = delegate
        return floatingActionButton
    }
    static func cellFactory(iconName: String) -> LiquidFloatingCell
    {
        let cell = LiquidFloatingCell(icon: UIImage(named: iconName)!)
        return cell
    }
    static func customCellFactory(iconName: String, labelName: String) -> LiquidFloatingCell
    {
        let cell = CustomCell(icon: UIImage(named: iconName)!, name: labelName)
        return cell
    }
}

