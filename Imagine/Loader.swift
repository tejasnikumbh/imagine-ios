//
//  ThreeOvalLoader.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/23/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class Loader: UIView {
    
    var animationDuration = 0.9
    var firstOvalLayer: OvalLayer? = nil
    var secondOvalLayer: OvalLayer? = nil
    var thirdOvalLayer: OvalLayer? = nil
    var timerFirst: NSTimer? = nil
    var timerSecond: NSTimer? = nil
    var timerThird: NSTimer? = nil
    var width = UIScreen.mainScreen().bounds.size.height * 0.108
    var height = UIScreen.mainScreen().bounds.size.height * 0.0474
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        self.addBackgroundView()
        self.addOvals()
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimating() {
        timerFirst = NSTimer.scheduledTimerWithTimeInterval(
            0, target: self,
            selector: #selector(Loader.animateFirst),
            userInfo: nil, repeats: false)
        timerSecond = NSTimer.scheduledTimerWithTimeInterval(
            0.225, target: self,
            selector: #selector(Loader.animateSecond),
            userInfo: nil, repeats: false)
        timerThird = NSTimer.scheduledTimerWithTimeInterval(
            0.45, target: self,
            selector: #selector(Loader.animateThird),
            userInfo: nil, repeats: false)
    }
    func stopAnimating() {
        UIView.animateWithDuration(0.4, animations: {
            self.alpha = 0.0
            }, completion: { _ in
                self.hidden = true
                self.timerFirst?.invalidate()
                self.timerSecond?.invalidate()
                self.timerThird?.invalidate()
        })
    }
    
    //MARK:- Private Methods
    private func addOvals() {
        let firstOvalLayer = OvalLayer()
        firstOvalLayer.ovalPath = UIBezierPath(ovalInRect:
            CGRect(
                x: self.width * 0.14,
                y: self.height * 0.34,
                width: self.width * 0.15,
                height: self.width * 0.15))
        self.layer.addSublayer(firstOvalLayer)
        self.firstOvalLayer = firstOvalLayer
        let secondOvalLayer = OvalLayer()
        secondOvalLayer.ovalPath = UIBezierPath(ovalInRect:
            CGRect(
                x: self.width * 0.43,
                y: self.height * 0.34,
                width: self.width * 0.15,
                height: self.width * 0.15))
        self.layer.addSublayer(secondOvalLayer)
        self.secondOvalLayer = secondOvalLayer
        let thirdOvalLayer = OvalLayer()
        thirdOvalLayer.ovalPath = UIBezierPath(ovalInRect:
            CGRect(
                x: self.width * 0.72,
                y: self.height * 0.34,
                width: self.width * 0.15,
                height: self.width * 0.15))
        self.layer.addSublayer(thirdOvalLayer)
        self.thirdOvalLayer = thirdOvalLayer
    }
    private func addBackgroundView() {
        let blackView = UIView(frame: CGRect(
            x: 0,y: 0, width: self.width, height: self.height))
        blackView.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.65)
        blackView.roundCorners([.AllCorners], radius: self.height * 0.4)
        self.addSubview(blackView)
    }
    @objc private func animateFirst() {
        firstOvalLayer?.startAnimating()
    }
    @objc private func animateSecond() {
        secondOvalLayer?.startAnimating()
    }
    @objc private func animateThird() {
        thirdOvalLayer?.startAnimating()
    }
}
