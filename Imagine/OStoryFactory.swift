//
//  OStoryFactory.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 8/1/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit
import SwiftyJSON

struct OStoryFactory {
    static func storyWithId(id: String, completion: EmptyCompletionBlock?) -> OStory?
    {
        return fetchStory(id, completion: completion)
    }
    static func fetchStory(id: String, completion: EmptyCompletionBlock?) -> OStory?
    {
        let storyDataJSON: [[String: AnyObject]] =
            [
                
                [
                "id": "0",
                "images": ["time_hop"],
                    "paragraphs": ["Something was off today. The sheets were all messed up, but somehow they felt very ‘in place’. The clock with it’s shiny glass surface showed a weird time. Or so it felt. The hands were aligned perfectly together, as if hinting towards something singular. Was the clock trying to say something? Inanimate things don’t speak. Jose was well aware of this. But then again, Jose was a hopeless creative. He always liked imagining things.",
                        
                        "Off he went to make his morning cup of black coffee. It raised his metabolism, it would help him be slim. Jose knew exactly where the cup would be, it was washed and kept at exactly the place it should have been. It was almost as if Jose’s hand knew where to find it. “Routine, meh” Jose justified, though a weird part of his brain was spiking off yet again, trying to find hidden meaning in the uncanny perfectness of the organization of this process. It almost seemed as though it had been ages since he had tried something different.",
                        
                        "The swing was stationary. Jose was fancy. His front yard had a lot of big trees and a swing. Jose enjoyed sitting on the swing. Yet again though, Jose had forgotten to put the sheets on the swing’s seat. “When would I get accustomed to putting the sheets on every night?”, he asked his inner self.",
                        
                        "The day went by and Jose decided to work again. “The client would want this to be over in a week”, he reminded himself. He looked at the painting with an examining eye. Somehow he knew exactly what part he wanted painted today. He had a very clear picture of what it would look like when it was over. This was partly due to skill, partly due to his imagination. Jose was proud of himself. He finished with the day’s work and the part looked exactly as he had pictured it in his head. He was a genius at this. Or so he felt.",
                        
                        "The night was close. Jose started looking at the starry night sky. He thanked God for blessing him with the mind that he had, with the skill that he had, and with the life that he had. The sky had a lot of secrets, he thought. “Oh how insignificant am I, sitting on the terrace of this calm bungalow at the outskirts of the city, amidst nature, on a tiny little dot called earth”, he thought. Just then, out of the blue, he saw a shooting star. “These are very rare”, he thought. Jose was excited. “Let’s make a wish”, he said to himself. Foolish as though it might sound to the rational mind, Jose thought magic exists.  “Oh lord”, he said, “Let all days be like this one. And let me be happy forever”, Jose said, as he wished nothing more in life. With a smile on his face, Jose went off to sleep.",
                        
                        "Jose woke up the next morning. Something was off today. The sheets were all messed up, but somehow they felt very ‘in place’…",
                
                        "Something was off today. The sheets were all messed up, but somehow they felt very ‘in place’…"],
                "map": ["0": "0"],
            ],
            [
                "id": "1",
                "images": ["time_hop"],
                "paragraphs": ["Something was off today. The sheets were all messed up, but somehow they felt very ‘in place’. The clock with it’s shiny glass surface showed a weird time. Or so it felt. The hands were aligned perfectly together, as if hinting towards something singular. Was the clock trying to say something? Inanimate things don’t speak. Jose was well aware of this. But then again, Jose was a hopeless creative. He always liked imagining things.",
                        
                    "Off he went to make his morning cup of black coffee. It raised his metabolism, it would help him be slim. Jose knew exactly where the cup would be, it was washed and kept at exactly the place it should have been. It was almost as if Jose’s hand knew where to find it. “Routine, meh” Jose justified, though a weird part of his brain was spiking off yet again, trying to find hidden meaning in the uncanny perfectness of the organization of this process. It almost seemed as though it had been ages since he had tried something different.",
                        
                    "Off he went, the swing was stationary. Jose was fancy. His front yard had a lot of big trees and a swing. Jose often enjoyed sitting on it. Yet again though, Jose had forgotten to put the sheets on the swing’s seat, and it was wet. “When would I get accustomed to putting the sheets on every night?”, he asked his inner self.",
                        
                    "The day went by and Jose decided to start off on his work again. “The client would want this to be over in a week”, he reminded himself. He looked at the painting with an examining eye. Somehow he exactly knew what part to paint today. He had a very clear picture of what it would look like when it was over, and this was partly due to skill, partly due to his imagination. Jose was proud of himself, when he finished with the day’s work and the part looked exactly as he had pictured it in his head. He was a genius at this. Or so he felt.",
                        
                    "The night was close. Jose started looking at the starry night sky. He thanked God for blessing him with the mind that he had, with the skill that he had, and with the Life that he had. The sky had a lot of secrets, he thought. “Oh how insignificant I am, sitting on the terrace of this calm Bungalow at the outskirts of the city, amidst nature, on a tiny little dot called earth”, he thought. Just then, out of the blue, he saw a shooting star. “These are very rare”, he thought. Jose was excited. “Let’s make a wish”, he said to himself. Foolish as though it might sound to the rational mind, Jose thought magic exists.  “Oh lord”, he said, “Let all days be like this one. And let me be happy forever”, Jose said, as he wished nothing more in life. With a smile on his face, Jose went off to sleep.",
                        
                    "Something was off today. The sheets were all messed up, but somehow they felt very ‘in place’…"],
                    "map": ["0": "0"],
                ],
                [
                    "id": "2",
                    "images": ["bridge"],
                    "paragraphs": ["Was magic real? Could it ever be? Freddy always thought, his imaginary horses flying wild in the meadows he’d created for them. Unicorns, he thought. Was there a higher power at work? Was there God? Freddy had always been an atheist, but somehow was always left wondering about the working mechanisms of the universe. No matter how many articles he’d read on science being there to justify it all, Freddy could never comprehend Why? Or even the meaning of ‘Why’ , if that made sense.",

                        "Freddy was just another human in the gigantic universe, trying to take it all in, trying to find the ‘meaning of life’. As he strolled past the construction site on his way to the local Supermarket, he thought, Why, oh Why am I this way? Always thinking about weird stuff, never being able to make sense. But then, he thought everybody was the same. ‘People tend to kill their curiosity’ , he thought.",
                        
                        "Freddy tried to define magic. In his mind, calling advanced science magic was an insult to magic. Science is derived from a logical set of rules. Magic is something the mind cannot comprehend. Something so weird that it should not exist in the rational world. What if there was a giant black hole that opened up right now, right there, providing him a portal to another universe? A place where the laws would be different, another big vast world to explore altogether.",
                        
                        "Freddy looked up to find his way again, fearing he had the wrong directions, half wondering why he’d not reached the supermarket yet. And there it was, a big Black Hole with a starlit inside, a portal to another world. Freddy had his mouth wide open."],
                    "map": ["0": "0"],
                ],
                [
                    "id": "3",
                    "images": ["billy_bravado"],
                    "paragraphs": ["Once upon a time, there was this flock of pearl white, fluffy and healthy sheep. These sheep had the best of pastures to graze on, and hope smiled upon them with the widest of grins. The sheep had nothing to fear, were all well raised and well mannered. Their days were often spent meandering in the lawns and laying out in the sun, taking in his majesty’s offering while being totally relaxed and carefree.",
                        
                        "The herd had it’s own problems though. These problems came in the form of a few eccentric thinkers. One of these was our protagonist, Billy. Billy was supposed to be a genius, an ‘out of the box’ thinker, but people considered him borderline paranoid.",
                        
                        "Billy was always of the opinion that their herd was taken care of only because of hidden motives. Something dreadful was about to happen to them, he thought. He always questioned the calm in their well organized and happy lives. He thought there was something wrong. Some force was at work. The owner was not a good man, he thought.",
                        
                        "The other sheep were quick to condemn him, when he shared his fears with them. “You’re an idiot”, they exclaimed, “Why would we leave such a good life for something else. Look the owner is so friendly, he always hugs us.” Billy had given up on them now. May be he was a bit off in the head, he thought sometimes.",
                        
                        "One dark night, Billy’s paranoia got the better of him and he couldn’t sleep. In his half asleep - half awake state he saw a vision.  He saw something horrible. All the sheep in their flock were standing in a long curly queue,just outside a dark cave. The sheep were moving in, one by one. He snooped upon the entrance to the cave, careful not to alert anybody. What he saw there was nothing short of a nightmare. The sheep were first carefully being rid of their fluffy white fur. After that, each sheep would be forcefully pulled into a dark corner, and huge man stood there with a big sword, cutting off the sheep’s head. Blood poured out like water out of a fountain. Each sheep was then skinned and harvested for good meat, and the screams were loud enough to send chills down the spines of the bravest men.",
                        
                        "Billy woke up with a scream. “Meeeeaaaaah”, he yelled out. The scene could not leave Billy’s senses. He was shaken. Given the belief that he had in his genius self, he could not let go off the thought. He decided to flee into the wild.",
        
                        "Billy packed his bags and decided to leave. That fateful night, as he was leaving, he saw his vision turn into reality. Each of the sheep in his flock was being lured into what would be a slaughterhouse. It wasn’t a dream this time, it was real. Billy was right, the sheep would be slayed today. “Nice time to leave” , he thought to himself. “Only if they would’ve listened to me”, he said. Billy could not see the sight of his friends being sheared and slaughtered. He was sweating profusely through his well covered skin. Fearing for his dear life, Billy fled the scene. His Bravado and paranoia had served him well.",
        
                        "As he entered the woods he began rejoicing in his decision making prowess, his genius. He was finally free from the too-good-to-be-true pastures. He was free,or so he thought. All this running had made Billy hungry. He figured he’d have a snack. He unpacked some grass salad he’d bought, and began having it. Suddenly, he heard something behind him. He turned back. It was the wild woods now, not the cared for pastures. Billy was horrified yet again as he stared into the eyes of death, a dire wolf now waiting for it’s fluffy white dinner"],
                    "map": ["0": "0"],
                ],
        
                [
                    "id": "4",
                    "images": ["time_hop"],
                    "paragraphs": ["Something was off today. The sheets were all messed up, but somehow they felt very ‘in place’. The clock with it’s shiny glass surface showed a weird time. Or so it felt. The hands were aligned perfectly together, as if hinting towards something singular. Was the clock trying to say something? Inanimate things don’t speak. Jose was well aware of this. But then again, Jose was a hopeless creative. He always liked imagining things.",
                        
                        "Off he went to make his morning cup of black coffee. It raised his metabolism, it would help him be slim. Jose knew exactly where the cup would be, it was washed and kept at exactly the place it should have been. It was almost as if Jose’s hand knew where to find it. “Routine, meh” Jose justified, though a weird part of his brain was spiking off yet again, trying to find hidden meaning in the uncanny perfectness of the organization of this process. It almost seemed as though it had been ages since he had tried something different.",
                        
                        "Off he went, the swing was stationary. Jose was fancy. His front yard had a lot of big trees and a swing. Jose often enjoyed sitting on it. Yet again though, Jose had forgotten to put the sheets on the swing’s seat, and it was wet. “When would I get accustomed to putting the sheets on every night?”, he asked his inner self.",
                        
                        "The day went by and Jose decided to start off on his work again. “The client would want this to be over in a week”, he reminded himself. He looked at the painting with an examining eye. Somehow he exactly knew what part to paint today. He had a very clear picture of what it would look like when it was over, and this was partly due to skill, partly due to his imagination. Jose was proud of himself, when he finished with the day’s work and the part looked exactly as he had pictured it in his head. He was a genius at this. Or so he felt.",
                        
                        "The night was close. Jose started looking at the starry night sky. He thanked God for blessing him with the mind that he had, with the skill that he had, and with the Life that he had. The sky had a lot of secrets, he thought. “Oh how insignificant I am, sitting on the terrace of this calm Bungalow at the outskirts of the city, amidst nature, on a tiny little dot called earth”, he thought. Just then, out of the blue, he saw a shooting star. “These are very rare”, he thought. Jose was excited. “Let’s make a wish”, he said to himself. Foolish as though it might sound to the rational mind, Jose thought magic exists.  “Oh lord”, he said, “Let all days be like this one. And let me be happy forever”, Jose said, as he wished nothing more in life. With a smile on his face, Jose went off to sleep.",
                        
                        "Something was off today. The sheets were all messed up, but somehow they felt very ‘in place’…"],
                    "map": ["0": "0"],
                ],
                [
                    "id": "5",
                    "images": ["time_hop"],
                    "paragraphs": ["Something was off today. The sheets were all messed up, but somehow they felt very ‘in place’. The clock with it’s shiny glass surface showed a weird time. Or so it felt. The hands were aligned perfectly together, as if hinting towards something singular. Was the clock trying to say something? Inanimate things don’t speak. Jose was well aware of this. But then again, Jose was a hopeless creative. He always liked imagining things.",
                        
                        "Off he went to make his morning cup of black coffee. It raised his metabolism, it would help him be slim. Jose knew exactly where the cup would be, it was washed and kept at exactly the place it should have been. It was almost as if Jose’s hand knew where to find it. “Routine, meh” Jose justified, though a weird part of his brain was spiking off yet again, trying to find hidden meaning in the uncanny perfectness of the organization of this process. It almost seemed as though it had been ages since he had tried something different.",
                        
                        "Off he went, the swing was stationary. Jose was fancy. His front yard had a lot of big trees and a swing. Jose often enjoyed sitting on it. Yet again though, Jose had forgotten to put the sheets on the swing’s seat, and it was wet. “When would I get accustomed to putting the sheets on every night?”, he asked his inner self.",
                        
                        "The day went by and Jose decided to start off on his work again. “The client would want this to be over in a week”, he reminded himself. He looked at the painting with an examining eye. Somehow he exactly knew what part to paint today. He had a very clear picture of what it would look like when it was over, and this was partly due to skill, partly due to his imagination. Jose was proud of himself, when he finished with the day’s work and the part looked exactly as he had pictured it in his head. He was a genius at this. Or so he felt.",
                        
                        "The night was close. Jose started looking at the starry night sky. He thanked God for blessing him with the mind that he had, with the skill that he had, and with the Life that he had. The sky had a lot of secrets, he thought. “Oh how insignificant I am, sitting on the terrace of this calm Bungalow at the outskirts of the city, amidst nature, on a tiny little dot called earth”, he thought. Just then, out of the blue, he saw a shooting star. “These are very rare”, he thought. Jose was excited. “Let’s make a wish”, he said to himself. Foolish as though it might sound to the rational mind, Jose thought magic exists.  “Oh lord”, he said, “Let all days be like this one. And let me be happy forever”, Jose said, as he wished nothing more in life. With a smile on his face, Jose went off to sleep.",
                        
                        "Something was off today. The sheets were all messed up, but somehow they felt very ‘in place’…"],
                    "map": ["0": "0"],
                ],
        
                [
                    "id": "6",
                    "images": ["time_hop"],
                    "paragraphs": ["With a weird beat in the backdrop, Jan was deep in thought. Numbers ran through Jan’s mind like pearls falling off a necklace’s string. Only he knew exactly where they would land, before they could, since he couldn’t help estimating it.",
                        
                        "There was something weird about Jan, everybody knew it. A normal person saw the symbols for 23 and 13 and a multiplication sign when they were asked - “What is 23 times 13 ?”. Jan saw images. Superimposed images. 3 plus 3 was not 6 for him. It was a star with 6 sides. 2 triangles superimposed on one another with opposite orientations.",
                        
                        "If calculations were images, patterns felt like a movie. And who doesn’t like a good story? Jan always liked finding patterns, although his confidence would break in a jiffy if asked to explain his thought process. He was getting tired of it.",
                        
                        "His high score on the test had earned him an interview with a finance giant, a role at their HQ in Amsterdam. Jan was not particularly born with a silver spoon in his mouth. He loved the idea of being financially free. 5 years at this firm, and it would be over, he thought. What he would do later, he had no idea. But his rational mind was pushing him to take a shot at this opportunity.",
                        
                        "Jan shot up like a firework, leaving all other candidates behind. Jan was no candidate, he was the future of the firm. They had to give him an offer. An year into the Job, Jan was bored with life. Splurging money became the norm, and he had no idea why he was doing what he was doing. His mind had begun seeking thrill, than victory, and he was constantly trying to do things now that stimulated his mind. “Is this ‘goose-bumpy’?” , was now his decision philosophy.",
                    
                        "@@_@@DotChar@@_@@",
                        
                        "The betting odds were 80 to 20. The gamblers were of the opinion that the more they bet on the favorable outcome, the more they would earn. Although margins were very, very small this time. The outcome was heavily predicted in favor of one position as opposed to the other. Jan knew what to do in such a situation, his experience had taught him to err on the side of the risk. Greater risk, greater reward.",
                        
                        "Jan, however  was not happy with solely this. He wanted the reward to be much, much higher this time. He wanted to bet everything he had. He wanted to bet the entire firm, if he gained access to the assets. Jan convinced the firm managers to bet with him this time, putting up a significant part of the firm at risk. Though failure would mean total destruction, the managers had sided with Jan on progressively riskier projects, and this had served them well. Jan convinced them to do it yet again. Only this time, the danger was very, very real. Failure was not an option.",
                        
                        "On Judgement Day, Jan raised his brow to type in a command. He was placing his bets. As the last signal was transferred, Jan began scratching his chin with his signature raised brow, deep in thought. As the sun went down, so did the firm.",
                        
                        "@@_@@DotChar@@_@@",
                        
                        "Jan owned a yacht now, he’d named it Grin. The European markets had a new leader now, and legend was that it was formed out of the gains of Judgement Day. Jan’s nameplate said - “Director of Strategy, Blackwater.”"

                        
                    ],

                    "map": ["0": "0"],
                ],
                [
                    "id": "7",
                    "images": ["time_hop"],
                    "paragraphs": ["Something was off today. The sheets were all messed up, but somehow they felt very ‘in place’. The clock with it’s shiny glass surface showed a weird time. Or so it felt. The hands were aligned perfectly together, as if hinting towards something singular. Was the clock trying to say something? Inanimate things don’t speak. Jose was well aware of this. But then again, Jose was a hopeless creative. He always liked imagining things.",
                        
                        "Off he went to make his morning cup of black coffee. It raised his metabolism, it would help him be slim. Jose knew exactly where the cup would be, it was washed and kept at exactly the place it should have been. It was almost as if Jose’s hand knew where to find it. “Routine, meh” Jose justified, though a weird part of his brain was spiking off yet again, trying to find hidden meaning in the uncanny perfectness of the organization of this process. It almost seemed as though it had been ages since he had tried something different.",
                        
                        "Off he went, the swing was stationary. Jose was fancy. His front yard had a lot of big trees and a swing. Jose often enjoyed sitting on it. Yet again though, Jose had forgotten to put the sheets on the swing’s seat, and it was wet. “When would I get accustomed to putting the sheets on every night?”, he asked his inner self.",
                        
                        "The day went by and Jose decided to start off on his work again. “The client would want this to be over in a week”, he reminded himself. He looked at the painting with an examining eye. Somehow he exactly knew what part to paint today. He had a very clear picture of what it would look like when it was over, and this was partly due to skill, partly due to his imagination. Jose was proud of himself, when he finished with the day’s work and the part looked exactly as he had pictured it in his head. He was a genius at this. Or so he felt.",
                        
                        "The night was close. Jose started looking at the starry night sky. He thanked God for blessing him with the mind that he had, with the skill that he had, and with the Life that he had. The sky had a lot of secrets, he thought. “Oh how insignificant I am, sitting on the terrace of this calm Bungalow at the outskirts of the city, amidst nature, on a tiny little dot called earth”, he thought. Just then, out of the blue, he saw a shooting star. “These are very rare”, he thought. Jose was excited. “Let’s make a wish”, he said to himself. Foolish as though it might sound to the rational mind, Jose thought magic exists.  “Oh lord”, he said, “Let all days be like this one. And let me be happy forever”, Jose said, as he wished nothing more in life. With a smile on his face, Jose went off to sleep.",
                        
                        "Something was off today. The sheets were all messed up, but somehow they felt very ‘in place’…"],
                    "map": ["0": "0"],
                ],
 
                [
                    "id": "8",
                    "images": ["purple"],
                    "paragraphs": ["Something was off today. The sheets were all messed up, but somehow they felt very ‘in place’. The clock with it’s shiny glass surface showed a weird time. Or so it felt. The hands were aligned perfectly together, as if hinting towards something singular. Was the clock trying to say something? Inanimate things don’t speak. Jose was well aware of this. But then again, Jose was a hopeless creative. He always liked imagining things.",
                        
                        "Off he went to make his morning cup of black coffee. It raised his metabolism, it would help him be slim. Jose knew exactly where the cup would be, it was washed and kept at exactly the place it should have been. It was almost as if Jose’s hand knew where to find it. “Routine, meh” Jose justified, though a weird part of his brain was spiking off yet again, trying to find hidden meaning in the uncanny perfectness of the organization of this process. It almost seemed as though it had been ages since he had tried something different.",
                        
                        "Off he went, the swing was stationary. Jose was fancy. His front yard had a lot of big trees and a swing. Jose often enjoyed sitting on it. Yet again though, Jose had forgotten to put the sheets on the swing’s seat, and it was wet. “When would I get accustomed to putting the sheets on every night?”, he asked his inner self.",
                        
                        "The day went by and Jose decided to start off on his work again. “The client would want this to be over in a week”, he reminded himself. He looked at the painting with an examining eye. Somehow he exactly knew what part to paint today. He had a very clear picture of what it would look like when it was over, and this was partly due to skill, partly due to his imagination. Jose was proud of himself, when he finished with the day’s work and the part looked exactly as he had pictured it in his head. He was a genius at this. Or so he felt.",
                        
                        "The night was close. Jose started looking at the starry night sky. He thanked God for blessing him with the mind that he had, with the skill that he had, and with the Life that he had. The sky had a lot of secrets, he thought. “Oh how insignificant I am, sitting on the terrace of this calm Bungalow at the outskirts of the city, amidst nature, on a tiny little dot called earth”, he thought. Just then, out of the blue, he saw a shooting star. “These are very rare”, he thought. Jose was excited. “Let’s make a wish”, he said to himself. Foolish as though it might sound to the rational mind, Jose thought magic exists.  “Oh lord”, he said, “Let all days be like this one. And let me be happy forever”, Jose said, as he wished nothing more in life. With a smile on his face, Jose went off to sleep.",
                        
                        "Something was off today. The sheets were all messed up, but somehow they felt very ‘in place’…"],
                    "map": ["0": "0"],
                ]
                
        ]
        
        guard let id = Int(id) else { return nil }
        let dict = JSON(storyDataJSON[id]) // For now, Id is same as the index in JSON Data
        var imageArray: [UIImage] = []
        let images = dict["images"].array
        for imageStr in images! {
            let image = UIImage(named: imageStr.stringValue)
            imageArray.append(image!)
        }
        var paraArray: [String] = []
        let paras = dict["paragraphs"].array
        for para in paras! {
            paraArray.append(para.stringValue)
        }
        
        // Run completion
        if let completion = completion {
            completion()
        }
        return OStory(
            id: dict["id"].stringValue,
            images: imageArray,
            paras: paraArray ,
            paraImageMap: dict["map"].dictionaryObject as! [String: String])
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