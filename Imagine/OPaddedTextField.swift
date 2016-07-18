//
//  OPaddedTextField.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/16/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class OPaddedTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 16,
                               bottom: 0, right: 0);
    
    override func textRectForBounds(bounds: CGRect) -> CGRect
    {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    override func placeholderRectForBounds(bounds: CGRect) -> CGRect
    {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    override func editingRectForBounds(bounds: CGRect) -> CGRect
    {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
