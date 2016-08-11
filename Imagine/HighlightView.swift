//
//  HighlightView.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 8/12/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

enum Element {
    case Circle
    case IndicatorBox
    case None
}

class HighlightView: UIView {
    var highlightElement: Element!
    var highlightElementFrame: CGRect!
    var backgroundSnapshot: UIImage!
    convenience init(frame: CGRect,  backgroundSnapshot: UIImage,
                     highlightElement: Element? = nil, highlightElementFrame: CGRect? = nil)
    {
        self.init(frame: frame)
        self.backgroundSnapshot = backgroundSnapshot
        guard let highlightElement = highlightElement,
              let highlightElementFrame = highlightElementFrame else
        {
            setupView()
            return
        }
        self.highlightElement = highlightElement
        self.highlightElementFrame = highlightElementFrame
        setupView()
    }
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupView()
    }
    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView()
    {
        let backgroundBlackView = UIView.viewWithColor(
            UIColor.blackColor().colorWithAlphaComponent(0.50),
            frame: UIScreen.mainScreen().bounds)
        self.addSubview(backgroundBlackView)
        guard let element = self.highlightElement else { return }
        guard let frame = self.highlightElementFrame else { return }
        switch element {
        case .Circle:
            // Setting up the circle layer
            let circle = UIBezierPath(ovalInRect: frame)
            let mask = CAShapeLayer()
            mask.path = circle.CGPath
            // Setting up snapshot view
            let snapshotView = UIImageView(frame: UIScreen.mainScreen().bounds)
            snapshotView.image = backgroundSnapshot
            snapshotView.layer.mask = mask
            backgroundBlackView.addSubview(snapshotView)
            break
        case .IndicatorBox:
            let boxView = UIView(frame:frame)
            boxView.backgroundColor = UIColor.whiteColor()
            boxView.layer.cornerRadius = frame.height * 0.2
            boxView.clipsToBounds = true
            let box = UIImageView(frame: CGRect(x: frame.width * 0.15, y: frame.width * 0.15 , width: frame.width * 0.7, height: frame.width * 0.7))
            box.image = UIImage(named: "indicator")
            box.contentMode = .ScaleAspectFit
            boxView.addSubview(box)
            backgroundBlackView.addSubview(boxView)
            break
        default:
            break
        }
    }
}
