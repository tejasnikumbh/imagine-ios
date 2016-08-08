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
            "image": "him_her",
            "title": "Her",
            "author": "Nina J Lu",
            "summary": "        Their relationship has come to a breaking point. Him and Her are always fighting. He tries to give it one last shot. An everyday story not for the faint of heart.",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "story_id": "2",
            "image": "bridge",
            "title": "The Bridge",
            "author": "Freddy",
            "summary": "        Freddy is a man in his 40s who is tired of the regularity of life. He finds himself wondering about the wonderous ways in which the universe operates, and how insignificant he is. Something changes. ",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "story_id": "3",
            "image": "billy_bravado",
            "title": "Billy's Bravado",
            "author": "Gray Direwolf",
            "summary": "        Billy is a paranoid genius amongst a flock of happy go lucky but foolish sheep. Billy envisions himself as a hero, who has both courage and foresight to make it big. Join Billy on his adventure of a lifetime.",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "story_id": "4",
            "image": "wine_dine",
            "title": "The Man in the Mirror",
            "author": "Tejas Nikumbh",
            "summary": "        Raymond is confused as to why what happened, happened. He tries to reconsider his decisions in life as he makes a life changing discovery. A story of self realization of an important fact of life.",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "story_id": "5",
            "image": "rye_lane",
            "title": "Rye Lane",
            "author": "Old Woman",
            "summary": "        Jimmy and Ron are the best of friends. On a chilly Winter afternoon, they decide to take a walk on their favorite part of the neighborhood, Rye Lane. Watch them live their ordinary life. Or not.",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "story_id": "6",
            "image": "binary_black",
            "title": "Binary Black",
            "author": "Rumi",
            "summary": "        Jan Kadlecky is a mathematical genius who sees patterns in everyday life. Join him as he sails through life experiencing his first few years in the finance world, where his genius is put to test every single day.",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "story_id": "7",
            "image": "agauda",
            "title": "Fortified remains",
            "author": "Rumi",
            "summary": "        Romaltus stands at a pivotal point in his life. He wants to save his legacy, his army, his people. The Golcondas have a huge Navy, and it's might is very visible. Will the Malins survive?",
            "genre": "Life",
            "sound_name": "rain",
            "sound_type": "mp3"
            ],
        [
            "story_id": "8",
            "image": "purple",
            "title": "Purple",
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