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
    struct Margin {
        static let smallLeft = CGFloat(4.0)
        static let smallRight = CGFloat(4.0)
        static let smallTop = CGFloat(4.0)
        static let smallBottom = CGFloat(4.0)
        static let mediumLeft = CGFloat(8.0)
        static let mediumRight = CGFloat(8.0)
        static let mediumTop = CGFloat(8.0)
        static let mediumBottom = CGFloat(8.0)
        static let bigLeft = CGFloat(16.0)
        static let bigRight = CGFloat(16.0)
        static let bigTop = CGFloat(16.0)
        static let bigBottom = CGFloat(16.0)
    }
    struct Screen {
        static let bounds = UIScreen.mainScreen().bounds
        static let width = UIScreen.mainScreen().bounds.size.width
        static let height = UIScreen.mainScreen().bounds.size.height
        static let aspectRatioHeightToWidth =
            UIScreen.mainScreen().bounds.size.height/UIScreen.mainScreen().bounds.size.width
    }
    struct StoryGrid {
        static let gapWidth = CGFloat(1.0)
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
                static let slideUpOnCardExpand = CGFloat(0.2)
            }
            struct Author {
                static let leftMargin = CGFloat(0.075)
                static let upperMargin = CGFloat(0.88)
                static let width = CGFloat(0.97)
                static let height = CGFloat(0.0525)
                static let fontSize = CGFloat(0.0325)
                static let slideUpOnCardExpand = CGFloat(0.2)
            }
            struct Summary {
                static let height = CGFloat(0.35)
            }
            struct Duration {
                static let smallWindow = 0.6
                static let bigWindow = 0.5
            }
        }
    }
}