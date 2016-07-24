//
//  ThreeOvalLoader.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/23/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class ThreeOvalLoader: UIView {
    var firstOvalLayer: OvalLayer? = nil
    var secondOvalLayer: OvalLayer? = nil
    var thirdOvalLayer: OvalLayer? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addOvals()
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addOvals() {
        let firstOvalLayer = OvalLayer()
        firstOvalLayer.ovalPath = UIBezierPath(ovalInRect:
            CGRect(x: 0, y: 0,
                width: OConstants.Loader.width * 0.33,
                height: OConstants.Loader.height))
        self.layer.addSublayer(firstOvalLayer)
        self.firstOvalLayer = firstOvalLayer
        
        let secondOvalLayer = OvalLayer()
        secondOvalLayer.ovalPath = UIBezierPath(ovalInRect:
            CGRect(
                x: OConstants.Loader.width * 0.33, y: 0,
                width: OConstants.Loader.width * 0.33,
                height: OConstants.Loader.height))
        self.layer.addSublayer(secondOvalLayer)
        self.secondOvalLayer = secondOvalLayer
        
        let thirdOvalLayer = OvalLayer()
        thirdOvalLayer.ovalPath = UIBezierPath(ovalInRect:
            CGRect(x: OConstants.Loader.width * 0.66, y: 0,
                width: OConstants.Loader.width * 0.33,
                height: OConstants.Loader.height))
        self.layer.addSublayer(thirdOvalLayer)
        self.thirdOvalLayer = thirdOvalLayer
    }
    func startAnimating() {
        var timer = NSTimer.scheduledTimerWithTimeInterval(0, target: self, selector: #selector(ThreeOvalLoader.animateFirst), userInfo: nil, repeats: false)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.225, target: self, selector: #selector(ThreeOvalLoader.animateSecond), userInfo: nil, repeats: false)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.45, target: self, selector: #selector(ThreeOvalLoader.animateThird), userInfo: nil, repeats: false)
    }
    func animateFirst() {
        firstOvalLayer?.startAnimating()
    }
    func animateSecond() {
        secondOvalLayer?.startAnimating()
    }
    func animateThird() {
        thirdOvalLayer?.startAnimating()
    }
}
