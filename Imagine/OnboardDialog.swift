
//
//  OnboardDialog.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 8/11/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class OnboardDialog: UIView {
    var title: String = "Live Paragraphs"
    var message: String = "Lookout for the \u{21B3} marked paragraphs. LONG PRESS on the PARAGRAPHS to see scenes they describe"
    var dialogWidth: CGFloat!
    var dialogHeight: CGFloat!
    var dialogCornerRadius: CGFloat!
    
    convenience init(frame: CGRect, title: String, message: String) {
        self.init(frame: frame)
        self.title = title
        self.message = message
        setupView()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        dialogWidth = frame.size.width
        dialogHeight = frame.size.height
        dialogCornerRadius = dialogHeight * 0.1
        setupView()
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        let titleHeight = 0.3 * dialogHeight
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: dialogWidth, height: titleHeight))
        titleView.backgroundColor = UIColor.linkedInBlue()
        let titleLabel = UILabel(frame: CGRect(x: dialogWidth * 0.1, y: 0, width: dialogWidth * 0.8, height: titleHeight))
        titleLabel.text = title
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.dialogTitleFont(titleHeight * 0.40)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.5
        titleLabel.textAlignment = .Center
        let titleContent = UILabel(frame: CGRect(x: dialogWidth * 0.1, y: dialogWidth * 0.05 + titleHeight, width: dialogWidth * 0.8, height: dialogHeight - titleHeight - dialogWidth * 0.1))
        titleContent.numberOfLines = 0
        titleContent.adjustsFontSizeToFitWidth = true
        titleContent.minimumScaleFactor = 0.5
        titleContent.text = message
        titleContent.textColor = UIColor.storyContentGray()
        titleContent.font = UIFont.storyContentFont(titleHeight * 0.36)
        titleView.addSubview(titleLabel)
        titleView.addSubview(titleContent)
        self.addSubview(titleView)
        self.backgroundColor = UIColor.whiteColor()
        self.layer.cornerRadius = dialogCornerRadius
        self.clipsToBounds = true
    }
}
