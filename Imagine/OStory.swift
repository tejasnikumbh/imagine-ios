//
//  OStory.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/22/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit
import SwiftyJSON

struct OStory {
    let id: String
    let title: String
    let images: [UIImage]
    let paras: [String]
    let paraImageMap: [String:String]
}