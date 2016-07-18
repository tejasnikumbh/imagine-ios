//
//  OStoryCardStore.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/18/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit
import Foundation

struct OStoryCardFactory {
    static func defaultStoryCards() -> [OStoryCard]
    {
        return parseStoryCards()
    }
    static func parseStoryCards() -> [OStoryCard]
    {
        let storyCardsData = [
        [
            "image": "home_back",
            "title": "Rain Man",
            "author": "Tejas Nikumbh",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "home_back",
            "title": "Rain Man",
            "author": "Tejas Nikumbh",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "home_back",
            "title": "Rain Man",
            "author": "Tejas Nikumbh",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "home_back",
            "title": "Rain Man",
            "author": "Tejas Nikumbh",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "home_back",
            "title": "Rain Man",
            "author": "Tejas Nikumbh",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "home_back",
            "title": "Rain Man",
            "author": "Tejas Nikumbh",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "home_back",
            "title": "Rain Man",
            "author": "Tejas Nikumbh",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "home_back",
            "title": "Rain Man",
            "author": "Tejas Nikumbh",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "home_back",
            "title": "Rain Man",
            "author": "Tejas Nikumbh",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "home_back",
            "title": "Rain Man",
            "author": "Tejas Nikumbh",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "home_back",
            "title": "Rain Man",
            "author": "Tejas Nikumbh",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "home_back",
            "title": "Rain Man",
            "author": "Tejas Nikumbh",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "home_back",
            "title": "Rain Man",
            "author": "Tejas Nikumbh",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "home_back",
            "title": "Rain Man",
            "author": "Tejas Nikumbh",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "home_back",
            "title": "Rain Man",
            "author": "Tejas Nikumbh",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "home_back",
            "title": "Rain Man",
            "author": "Tejas Nikumbh",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "home_back",
            "title": "Rain Man",
            "author": "Tejas Nikumbh",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "home_back",
            "title": "Rain Man",
            "author": "Tejas Nikumbh",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        
        ]
        
        let storyCards = storyCardsData.map {
            dict -> OStoryCard in
            return OStoryCard(
                image: UIImage(named:dict["image"]!)!,
                title: dict["title"]!,
                author: dict["author"]!,
                genre: dict["genre"]!,
                soundName: dict["sound_name"]!,
                soundType: dict["sound_type"]!
            )
        }
        
        return storyCards
    }

}