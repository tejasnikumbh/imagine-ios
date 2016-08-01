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
    let images: [UIImage]
    let paras: [String]
    let paraImageMap: [String:String]
    
    func text() -> String{
        var content = "          " + paras[0]
        for i in Range(1..<paras.count) {
            content += "\n\n           " + paras[i]
        }
        content += "\n\n"
        return content
    }
}