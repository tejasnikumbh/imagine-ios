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
    struct Window {
        // Left margin and width are scaled w.r.t Window width
        // Upper margin and height are scaled w.r.t Window height
        // Font size is scaled w.r.t Window height
        struct Scaling {
            struct Title {
                static let leftMargin = CGFloat(0.06)
                static let upperMargin = CGFloat(0.77)
                static let width = CGFloat(0.88)
                static let height = CGFloat(0.1105)
                static let fontSize = CGFloat(0.09)
            }
            struct Author {
                static let leftMargin = CGFloat(0.075)
                static let upperMargin = CGFloat(0.8835)
                static let width = CGFloat(0.97)
                static let height = CGFloat(0.0525)
                static let fontSize = CGFloat(0.035)
            }
        }
    }
}