//
//  OStoryFactory.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 8/1/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit
struct OStoryFactory {
    static func storyWithId(id: String, completion: EmptyCompletionBlock?) -> OStory
    {
        return fetchStory(id, completion: completion)
    }
    static func fetchStory(id: String, completion: EmptyCompletionBlock?) -> OStory
    {
        let storyData =
            [
                "id": id,
                "images": ["time_hop"],
                "paragraphs": ["Something was off today. The sheets were all messed up, but somehow they felt very ‘in place’. The clock with it’s shiny glass surface showed a weird time. Or so it felt. The hands were aligned perfectly together, as if hinting towards something singular. Was the clock trying to say something? Inanimate things don’t speak. Jose was well aware of this. But then again, Jose was a hopeless creative. He always liked imagining things.",
                    
                    "Off he went to make his morning cup of black coffee. It raised his metabolism, it would help him be slim. Jose knew exactly where the cup would be, it was washed and kept at exactly the place it should have been. It was almost as if Jose’s hand knew where to find it. “Routine, meh” Jose justified, though a weird part of his brain was spiking off yet again, trying to find hidden meaning in the uncanny perfectness of the organization of this process. It almost seemed as though it had been ages since he had tried something different.",
                
                "Off he went, the swing was stationary. Jose was fancy. His front yard had a lot of big trees and a swing. Jose often enjoyed sitting on it. Yet again though, Jose had forgotten to put the sheets on the swing’s seat, and it was wet. “When would I get accustomed to putting the sheets on every night?”, he asked his inner self.",
                
                "The day went by and Jose decided to start off on his work again. “The client would want this to be over in a week”, he reminded himself. He looked at the painting with an examining eye. Somehow he exactly knew what part to paint today. He had a very clear picture of what it would look like when it was over, and this was partly due to skill, partly due to his imagination. Jose was proud of himself, when he finished with the day’s work and the part looked exactly as he had pictured it in his head. He was a genius at this. Or so he felt.",
                
                "The night was close. Jose started looking at the starry night sky. He thanked God for blessing him with the mind that he had, with the skill that he had, and with the Life that he had. The sky had a lot of secrets, he thought. “Oh how insignificant I am, sitting on the terrace of this calm Bungalow at the outskirts of the city, amidst nature, on a tiny little dot called earth”, he thought. Just then, out of the blue, he saw a shooting star. “These are very rare”, he thought. Jose was excited. “Let’s make a wish”, he said to himself. Foolish as though it might sound to the rational mind, Jose thought magic exists.  “Oh lord”, he said, “Let all days be like this one. And let me be happy forever”, Jose said, as he wished nothing more in life. With a smile on his face, Jose went off to sleep.",
                
                "Something was off today. The sheets were all messed up, but somehow they felt very ‘in place’…"],
                "map": ["0": "0"],
            ]
        
        
        let dict = storyData
        var imageArray: [UIImage] = []
        let images = dict["images"] as! [String]
        for imageStr in images {
            let image = UIImage(named: imageStr)
            imageArray.append(image!)
        }
        var paraArray: [String] = []
        let paras = dict["paragraphs"] as! [String]
        for para in paras {
            paraArray.append(para)
        }
        
        // Run completion
        if let completion = completion {
            completion()
        }
        return OStory(
            id: dict["id"] as! String,
            images: imageArray,
            paras: paraArray ,
            paraImageMap: dict["map"]! as! [String : String])
    }
}

    /*
     ==========================================================================
     Fetching data from Server
     ==========================================================================
     let json = JSON(data: dataFromNetworking)
     let json = JSON(jsonObject)
     if let dataFromString = jsonString.dataUsingEncoding(NSUTF8StringEncoding,  allowLossyConversion: false) {
     let json = JSON(data: dataFromString)
     }
     
     ==========================================================================
     Usage of Swifty JSON
     ==========================================================================
     
     //Getting a double from a JSON Array
     let name = json[0].double
     //Getting a string from a JSON Dictionary
     let name = json["name"].stringValue
     //Getting a string using a path to the element
     let path = [1,"list",2,"name"]
     let name = json[path].string
     //Just the same
     let name = json[1]["list"][2]["name"].string
     //Alternatively
     let name = json[1,"list",2,"name"].string
     //With a hard way
     let name = json[].string
     //With a custom way
     let keys:[SubscriptType] = [1,"list",2,"name"]
     let name = json[keys].string
     Loop
     
     //If json is .Dictionary
     for (key,subJson):(String, JSON) in json {
     //Do something you want
     }
     The first element is always a String, even if the JSON is an Array
     
     //If json is .Array
     //The `index` is 0..<json.count's string value
     for (index,subJson):(String, JSON) in json {
     //Do something you want
     }
     */