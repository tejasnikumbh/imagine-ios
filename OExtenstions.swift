//
//  OExtenstions.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/18/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit
import Foundation

extension String
{
    func trim() -> String
    {
        return self.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceCharacterSet())
    }
}

extension UITableViewCell
{
    func populate(cards: [OStoryCard])
    {
        var i = 1
        while i <= 3*cards.count {
            let image = self.viewWithTag(i) as! UIImageView
            let title = self.viewWithTag(i+1) as! UILabel
            let author = self.viewWithTag(i+2) as! UILabel
            image.image = cards[i/3].image
            title.text = cards[i/3].title
            author.text = "by " + cards[i/3].author
            i += 3
        }
    }
}
