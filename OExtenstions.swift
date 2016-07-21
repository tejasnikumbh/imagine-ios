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
    static func whiteView(frame: CGRect) -> UIView
    {
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.whiteColor()
        return view
    }
}