//
//  OConstants.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/18/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit
import Foundation

class OConstants {
    struct Screen {
        static let bounds = UIScreen.mainScreen().bounds
        static let width = UIScreen.mainScreen().bounds.size.width
        static let height = UIScreen.mainScreen().bounds.size.height
    }
    struct StoryGrid {
        static let gapWidth = CGFloat(1.0)
        static let typeOneCellHeight = CGFloat(216.0)
        static let typeTwoCellHeight = CGFloat(166.0)
        static let typeThreeCellHeight = CGFloat(432.0)
        static let typeFourCellHeight = CGFloat(432.0)
    }
}