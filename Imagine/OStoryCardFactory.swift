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
        return fetchCards()
    }
    static func fetchCards() -> [OStoryCard]
    {
        let storyCardsData = [
        [
            "story_id": "0",
            "image": "time_hop",
            "title": "Time Hop",
            "author": "Tejas Nikumbh",
            "summary": "        There is something off about the day. Jose is a creative person whose life consists of paintings and imagination. Have a peek into Jose's life while he wonders what is so off about his day, and enjoys his coffee.",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        
        [
            "story_id": "1",
            "image": "storm",
            "title": "Storm's End",
            "author": "Nina J Lu",
            "summary": "        Billy is a paranoid genius amongst a flock of happy go lucky but foolish sheep. Billy envisions himself as a hero, who has both courage and foresight to make it big. Join Billy on his adventure as he tries to warn the sheep of impending doom.",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "story_id": "2",
            "image": "b",
            "title": "Black Holes",
            "author": "Stephen Hawking",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country. Rated and viwed by more than 100 people",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "story_id": "3",
            "image": "billy_bravado",
            "title": "Billy's Bravado",
            "author": "Sanchar Sharma",
            "summary": "        Billy is a paranoid genius amongst a flock of happy go lucky but foolish sheep. Billy envisions himself as a hero, who has both courage and foresight to make it big. Join Billy on his adventure of a lifetime.",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "story_id": "4",
            "image": "c",
            "title": "Hotel Suites",
            "author": "Arunima Gupta",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country. Rated and viwed by more than 100 people",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "story_id": "5",
            "image": "ice_bucket",
            "title": "Winter's Bone",
            "author": "Chetan Patil",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country. Rated and viwed by more than 100 people",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "story_id": "6",
            "image": "rainy",
            "title": "Rain Man",
            "author": "Rahul Gandhi",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country. Rated and viwed by more than 100 people",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "story_id": "7",
            "image": "a",
            "title": "Wineyard",
            "author": "Phoebe",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country. Rated and viwed by more than 100 people",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "story_id": "8",
            "image": "diagon",
            "title": "Diagon Alley",
            "author": "Chaudhari Noam",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country. Rated and viwed by more than 100 people",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ]
        
        ]
        let storyCards = storyCardsData.map {
            dict -> OStoryCard in
            return OStoryCard(
                storyId: dict["story_id"]!,
                image: UIImage(named:dict["image"]!)!,
                title: dict["title"]!,
                author: dict["author"]!,
                summary: dict["summary"]!,
                genre: dict["genre"]!,
                soundName: dict["sound_name"]!,
                soundType: dict["sound_type"]!
            )
        }
        return storyCards
    }
}