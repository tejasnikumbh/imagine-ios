//
//  OStoryContentTableViewCell.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 8/9/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

protocol OSceneShowProtocol {
    func showScene(image: UIImage)
    func killScene()
}

class OStoryContentTableViewCell: UITableViewCell {
    var scene: UIImage? = nil
    var actionDelegate: OSceneShowProtocol? = nil
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var contentLabelTopConstraint: NSLayoutConstraint!
    
    func attachScene(image: UIImage)
    {
        scene = image
        let longPressGesture = UILongPressGestureRecognizer(
            target: self, action: #selector(OStoryContentTableViewCell.paragraphPressed(_:)))
        self.userInteractionEnabled = true
        self.addGestureRecognizer(longPressGesture)
    }
    func paragraphPressed(sender: UILongPressGestureRecognizer)
    {
        guard let image = scene else { return }
        guard let actionDelegate = actionDelegate else { return }
        switch sender.state {
        case .Began:
            actionDelegate.showScene(image)
            break
        case .Ended:
            actionDelegate.killScene()
            break
        default:
            break
        }
    }
}
