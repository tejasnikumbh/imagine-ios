//
//  OStory.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/22/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit
import Foundation

typealias EmptyCompletionBlock = ()->()

class OStory {
    static func fetchDetailsFromServer(completion: EmptyCompletionBlock?) -> Bool
    {
        // Fetching details for stories from server task.
        // Do this asynchronously
        // Call Completion block
        completion!()
        return true
    }
}