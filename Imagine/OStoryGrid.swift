//
//  OStoryGridModel.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/18/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit
import Foundation

class OStoryGrid {
    static var cardsPerCell = 3
    static var cellTypes = [2, 3, 4, 1, 2, 4, 3]
    static var cards: [OStoryCard] = OStoryCardFactory.defaultCards()
    
    static func fetchDetailsFromServer() -> Bool
    {
        // Fetching details for stories from server task.
        // Do this asynchronously
        return true
    }
}