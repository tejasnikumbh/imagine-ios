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
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "d",
            "title": "Time",
            "author": "Sanchar Sharma",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "b",
            "title": "Black Holes",
            "author": "Stephen Hawking",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "storm",
            "title": "Storm's End",
            "author": "Nina J Lu",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "e",
            "title": "Nature",
            "author": "Arunima Gupta",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "ice_bucket",
            "title": "Winter",
            "author": "Chetan Patil",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "rainy",
            "title": "Shower",
            "author": "Rahul Gandhi",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "a",
            "title": "Wineyard",
            "author": "Phoebe",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "diagon",
            "title": "Diagon Alley",
            "author": "Chaudhari Noam",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "b",
            "title": "The Bridge",
            "author": "Steven Spielberg",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "burning",
            "title": "The Burning Train",
            "author": "Samantha Truth",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "home_back",
            "title": "Creed",
            "author": "Roy Gibiano",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "c",
            "title": "Hotel Suites",
            "author": "Jill Jackson",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "b",
            "title": "Troy",
            "author": "Nick La Rooy",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "a",
            "title": "Just in Time",
            "author": "Gaetano",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "rainy",
            "title": "Plastic Nutcase",
            "author": "Romeoro Griffin",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "g",
            "title": "Tumultous",
            "author": "God Watson",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "image": "storm",
            "title": "Storm's End",
            "author": "Jon Snow",
            "summary": "        Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie.Rain man is a story about their adventures cross country",
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
                summary: dict["summary"]!,
                genre: dict["genre"]!,
                soundName: dict["sound_name"]!,
                soundType: dict["sound_type"]!
            )
        }
        return storyCards
    }
}