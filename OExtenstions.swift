//
//  OExtenstions.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/18/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit
import Foundation

extension String
{
    func trim() -> String
    {
        return self.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceCharacterSet())
    }
}
extension UIView {
    static func blankView(color: UIColor, frame: CGRect) -> UIView
    {
        let view = UIView(frame: frame)
        view.backgroundColor = color
        return view
    }
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.CGPath
        self.layer.mask = mask
    }
}