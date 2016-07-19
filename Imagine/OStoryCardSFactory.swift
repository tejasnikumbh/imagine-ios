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
    static func defaultCards() -> [OStoryCard]
    {
        return parseCards()
    }
    static func parseCards() -> [OStoryCard]
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
            "image": "d",
            "title": "Time",
            "author": "Sanchar Sharma",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "b",
            "title": "Black Holes",
            "author": "Stephen Hawking",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "storm",
            "title": "Storm's End",
            "author": "Nina J Lu",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "e",
            "title": "Nature",
            "author": "Arunima Gupta",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "ice_bucket",
            "title": "Winter",
            "author": "Chetan Patil",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "b",
            "title": "Gimmick",
            "author": "Rahul Gandhi",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "a",
            "title": "Wineyard",
            "author": "Phoebe",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "diagon",
            "title": "Diagon Alley",
            "author": "Chaudhari Noam",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "b",
            "title": "The Bridge",
            "author": "Steven Spielberg",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "burning",
            "title": "The Burning Train",
            "author": "Samantha Truth",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "home_back",
            "title": "Creed",
            "author": "Roy Gibiano",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "c",
            "title": "Hotel Suites",
            "author": "Jill Jackson",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "b",
            "title": "Troy",
            "author": "Nick La Rooy",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "a",
            "title": "Just in Time",
            "author": "Gaetano",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "d",
            "title": "Plastic Nutcase",
            "author": "Romeoro Griffin",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "g",
            "title": "Tumultous",
            "author": "God Watson",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "storm",
            "title": "Storm's End",
            "author": "Jon Snow",
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