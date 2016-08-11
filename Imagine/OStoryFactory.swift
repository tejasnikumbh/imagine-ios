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
                "title": "Time Hop",
                "images": ["time_hop"],
                    "paragraphs": ["Something was off today. The sheets were all messed up, but somehow they felt very ‘in place’. The clock with it’s shiny glass surface showed a weird time. Or so it felt. The hands were aligned perfectly together, as if hinting towards something singular. Was the clock trying to say something? Inanimate things don’t speak. Jose was well aware of this. But then again, Jose was a hopeless creative. He always liked imagining things.",
                        
                        "Off he went to make his morning cup of black coffee. It raised his metabolism, it would help him be slim. Jose knew exactly where the cup would be, it was washed and kept at exactly the place it should have been. It was almost as if Jose’s hand knew where to find it. “Routine, meh” Jose justified, though a weird part of his brain was spiking off yet again, trying to find hidden meaning in the uncanny perfectness of the organization of this process. It almost seemed as though it had been ages since he had tried something different.",
                        
                        "The swing was stationary. Jose was fancy. His front yard had a lot of big trees and a swing. Jose enjoyed sitting on the swing. Yet again though, Jose had forgotten to put the sheets on the swing’s seat. “When would I get accustomed to putting the sheets on every night?”, he asked his inner self.",
                        
                        "The day went by and Jose decided to work again. “The client would want this to be over in a week”, he reminded himself. He looked at the painting with an examining eye. Somehow he knew exactly what part he wanted painted today. He had a very clear picture of what it would look like when it was over. This was partly due to skill, partly due to his imagination. Jose was proud of himself. He finished with the day’s work and the part looked exactly as he had pictured it in his head. He was a genius at this. Or so he felt.",
                        
                        "The night was close. Jose started looking at the starry night sky. He thanked God for blessing him with the mind that he had, with the skill that he had, and with the life that he had. The sky had a lot of secrets, he thought. “Oh how insignificant am I, sitting on the terrace of this calm bungalow at the outskirts of the city, amidst nature, on a tiny little dot called earth”, he thought. Just then, out of the blue, he saw a shooting star. “These are very rare”, he thought. Jose was excited. “Let’s make a wish”, he said to himself. Foolish as though it might sound to the rational mind, Jose thought magic exists.  “Oh lord”, he said, “Let all days be like this one. And let me be happy forever”, Jose said, as he wished nothing more in life. With a smile on his face, Jose went off to sleep.",
                        
                        "Jose woke up the next morning. Something was off today. The sheets were all messed up, but somehow they felt very ‘in place’…"],
                "map": ["1": "0"],
                ],
                [
                    "id": "1",
                    "title": "Fortified Remains",
                    "images": ["agauda"],
                    "paragraphs": ["The battle would go down in history as one of the most fierce ones on the costal lines. The Navy was huge, the ships sailing with all their might. This would be the end, Romaltus thought. He’d defended the fort for a long time. His lineage resided here. He wasn’t going to let go so easily. They would fight with all their might. He knew it. His army of guards, although small, was as fierce as the mightiest men.",
                        
                        "The big tower overlooked the sea like a guardian. It could protect them against the might of the Navy today. Romaltus drew the Malin sigil on a little brick at the bottom of the tower. He placed it inside a carefully crafted socket, so as to secure it tightly at the foot of the tower. A secret. A superstition. As long as the brick stays hidden with the sigil on it, the clan lives. Or so the Malins thought.",
                        
                        "Everyone had their hearts pounding heavily. They would fight hard tonight. They were here to make history. Romaltus had a strategy in place should the army invade. They would lure them inside the fort into the open grounds. Romaltus’ army would stand on the high platform to kill them with spears. This should dampen their spirits, he thought.",
                        
                        "The first of their ships hit the shores with a loud thud. Out came hundreds of men, with the finest of armor and battle gear. They were thirsty for blood. One could see it in their eyes and war cries. Romaltus gathered his finest men and secured the gates. The strongest of gates couldn’t hold the men with their huge Battering Rams. The gate was broken wide open. The army gushed inside through the narrow entrance.",
                        
                        "The plan was to get to the high platform now. May be this could work, Romaltus thought. “Oh Lord, save us all tonight. We shall serve you with all our might”, he prayed. God had other plans for the Malins. The Navy crushed the Malins, and took the fort. Romaltus died with no tears in his eyes. He was the bravest of the Malins. But there was only so much he could do.",
                        
                        "It almost felt as if he’d woken up from a dream. Ron quickly lifted his hand off the brick. The Malin sigil lit up. The Malins were right. The clan had lived. The brick had a story to tell."],
                    "map": ["1": "0"],
                ],
                [
                    "id": "2",
                    "title": "The Bridge",
                    "images": ["bridge"],
                    "paragraphs": ["Was magic real? Could it ever be? Freddy always thought, his imaginary horses flying wild in the meadows he’d created for them. Unicorns, he thought. Was there a higher power at work? Was there God? Freddy had always been an atheist, but somehow was always left wondering about the working mechanisms of the universe. No matter how many articles he’d read on science being there to justify it all, Freddy could never comprehend Why? Or even the meaning of ‘Why’ , if that made sense.",

                        "Freddy was just another human in the gigantic universe, trying to take it all in, trying to find the ‘meaning of life’. As he strolled past the construction site on his way to the local Supermarket, he thought, Why, oh Why am I this way? Always thinking about weird stuff, never being able to make sense. But then, he thought everybody was the same. ‘People tend to kill their curiosity’ , he thought.",
                        
                        "Freddy tried to define magic. In his mind, calling advanced science magic was an insult to magic. Science is derived from a logical set of rules. Magic is something the mind cannot comprehend. Something so weird that it should not exist in the rational world. What if there was a giant black hole that opened up right now, right there, providing him a portal to another universe? A place where the laws would be different, another big vast world to explore altogether.",
                        
                        "Freddy looked up to find his way again, fearing he had the wrong directions, half wondering why he’d not reached the supermarket yet. And there it was, a big Black Hole with a starlit inside, a portal to another world. Freddy had his mouth wide open."],
                    "map": ["0": "0", "1": "0", "2":"0", "3": "0"],
                ],
                [
                    "id": "3",
                    "title": "Billy's Bravado",
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
                    "title": "The Man in the Mirror",
                    "images": ["wine_dine"],
                    "paragraphs": ["Raymond woke up to a busy morning. He had little time left before the meeting. Today was a big day for him. He was supposed to lead his team into the meeting with their morale’s at an all time high. This was important for them. He had to convince the client of their prowess, this contract could change their life.",
                        
                        "The meeting was to happen at a fancy restaurant, overlooking the London Bridge. He ordered the finest of wines for his clients. With his sunglasses off, he looked like one of the men from the super secret spy society, all chic and ready to roll.",
                        
                        "As he began explaining their approach to the problem and resources at hand, he noticed something weird, the page with the technical capabilities of the team was missing. Raymond was furious. This was an important part of his presentation. Not having this would mean that the meeting could go down in flames. And it very well did.",
                        
                        "The client was pissed off at the incompetency of the team to handle something as simple as having all the documents in place. The company lost a contract, Raymond lost his job. The incompetent person didn’t. This was not his fault. Raymond ended up realizing he depended too much on someone else, and should have done it himself, since the project was this important. He should have realized this while reviewing the brochure, he thought. And rightly so.",
                        
                        "But this story is not about the contract. Raymond had a mortgage to pay, and being out of a job didn’t help. He’d decided to move into his parent’s house for some time, since it was time for him to save up a bit.",
                        
                        "To his disappointment , however, he realized that he wasn’t wanted there. His girlfriend dumped him, his friends started hanging out less with him. He was beginning to feel alone. He somehow felt that all the relationships he’d formed through his life were very artificial.",
                        
                        "He left his parent’s house and began living in his car. He would go to the nearby gym to shower and brush. This was awkward and new, but it was better than the other options, Raymond thought.",
                        
                        "As he was brushing his teeth, looking at the mirror, Raymond thought, why did all of this happen? What happened to all those relationships I’d formed over the years? Why aren’t they worked out? Why is it that when he needs them the most, all the important people in his life have backed out of helping him? He was trying to recollect ONE person who would help him in this time of need. Someone who was a guardian angel. Someone who thought he mattered and was important enough to be taken care of.",
                        
                        "Just then, he realized something important. He stared deep into the mirror, and smiled with a wide grin on his face. The Man in the Mirror grinned back. He’d found his guardian angel."],
                    "map": ["1": "0"],
                ],
                [
                    "id": "5",
                    "title": "Rye Lane",
                    "images": ["rye_lane"],
                    "paragraphs": ["Jimmy was strolling down the the boulevard. He had his best friend with him, Ron. Jimmy lived a laid back life. So did Ron. Everybody was happy. It was a fine little world they had for themselves. Sometimes, Jimmy would feel sad. He wasn’t very attracted to the mediocre life he lived. He did not want it to be this way, but he did not think much. He loved his friends. A stroll down Peckham’s Rye Lane would always calm his mind.",
                        
                        "It was a cold winter afternoon. Jimmy could see the trees moving in tandem with the wind. His jacket couldn’t hold the wind. Jimmy was feeling cold. Ron had a thick overcoat on, he seemed pretty comfortable. Jimmy knew, deep down inside, Ron had something to tell Jimmy.",
                    
                        "“Spill it out”, he said. “Nothing”, blurted Ron. “Oh come on now.”, insisted Jimmy. Ron knew this was it, he was going to spill it out now, no matter how hard he tried. “She said no.”, Ron said, with a deep sense of sadness in his voice.",
                    
                        "“Well, shit happens. She’s not the only one”, said Jimmy. The lane was pretty empty today. The pathway was clear, and it felt good to be lonely in the streets somehow. Jimmy began feeling good about himself. He began enjoying the whistling sound the winds produced.",
                    
                        "He saw a can of beer straight up ahead. Jimmy gave it a small nudge. Out came a beetle. Or some insect that looked like a beetle. “Look at it”, Jimmy said. “Do you think it is happy? It was living in a fucking can. Do you think these things matter to it at all?  Sometime I wonder, if animals have better lives than us. Less things to think about, less worries.”",
                    
                        "“True”, said Ron. But I’m not a beetle and I really liked her. “Fuck it Jimmy , you won’t understand. ” Ron felt like Jimmy was not able to understand him at all. He was not at all consoling and Ron thought Jimmy was in a way happy about what had happened to him.",
                    
                        "“Fuck you, Jimmy”. Ron said. An older woman passed by. “Who are you talking to, young man?”, she said."],
                    "map": ["1": "0"],
                ],
                [
                    "id": "6",
                    "title": "Binary Black",
                    "images": ["binary_black"],
                    "paragraphs": ["With a weird beat in the backdrop, Jan was deep in thought. Numbers ran through Jan’s mind like pearls falling off a necklace’s string. Only he knew exactly where they would land, before they could, since he couldn’t help estimating it.",
                        
                        "There was something weird about Jan, everybody knew it. A normal person saw the symbols for 23 and 13 & a multiplication sign when they were asked - “What is 23 times 13 ?”. Jan saw images. Superimposed images. 3 plus 3 was not 6 for him. It was a star with 6 sides. 2 triangles superimposed on one another with opposite orientations.",
                        
                        "If calculations were images, patterns felt like a movie. And who doesn’t like a good story? Jan always liked finding patterns, although his confidence would break in a jiffy if asked to explain his thought process. He was getting tired of it.",
                        
                        "His high score on the test had earned him an interview with a finance giant, a role at their HQ in Amsterdam. Jan was not particularly born with a silver spoon in his mouth. He loved the idea of being financially free. 5 years at this firm, and it would be over, he thought. What he would do later, he had no idea. But his rational mind was pushing him to take a shot at this opportunity.",
                        
                        "Jan shot up like a firework, leaving all other candidates behind. Jan was no candidate, he was the future of the firm. They had to give him an offer. An year into the Job, Jan was bored with life. Splurging money became the norm, and he had no idea why he was doing what he was doing. His mind had begun seeking thrill, than victory, and he was constantly trying to do things now that stimulated his mind. “Is this ‘goose-bumpy’?” , was now his decision philosophy.",
                    
                        "...",
                        
                        "The betting odds were 80 to 20. The gamblers were of the opinion that the more they bet on the favorable outcome, the more they would earn. Although margins were very, very small this time. The outcome was heavily predicted in favor of one position as opposed to the other. Jan knew what to do in such a situation, his experience had taught him to err on the side of the risk. Greater risk, greater reward.",
                        
                        "Jan, however  was not happy with solely this. He wanted the reward to be much, much higher this time. He wanted to bet everything he had. He wanted to bet the entire firm, if he gained access to the assets. Jan convinced the firm managers to bet with him this time, putting up a significant part of the firm at risk. Though failure would mean total destruction, the managers had sided with Jan on progressively riskier projects, and this had served them well. Jan convinced them to do it yet again. Only this time, the danger was very, very real. Failure was not an option.",
                        
                        "On Judgement Day, Jan raised his brow to type in a command. He was placing his bets. As the last signal was transferred, Jan began scratching his chin with his signature raised brow, deep in thought. As the sun went down, so did the firm.",
                        
                        "...",
                        
                        "Jan owned a yacht now, he’d named it Grin. The European markets had a new leader now, and legend was that it was formed out of the gains of Judgement Day. Jan’s nameplate said - “Director of Strategy, Blackwater.”"

                        
                    ],

                    "map": ["1": "0"],
                ],
                [
                    "id": "7",
                    "title": "Her",
                    "images": ["him_her"],
                    "paragraphs": ["She was arguing with him again. Their weekly squabbles had a taken a turn wherein they would end up fighting like cats and dogs, every single day. She was beginning to feel that it was breaking apart. Although they were madly in love with each other, somehow, something wasn’t working. Something didn’t feel right.",
                        
                        "Their fights at night would not let him sleep now. Raging thoughts and disturbances ran through his mind like a storm. This was also affecting his performance at work. David was pissed off now. Half his mind said quit it, the other half wanted it to work.",
                        
                        "One fateful night, as they were squabbling yet again, she got off the bed, and stormed off. The bedroom door shut with a loud ‘THUD’. David pondered what he’d done this time. This wasn’t needed, he thought. He convinced himself to get up and convince her this time. He wanted to make it all right.",
                        
                        "He got off the bed, and as he began walking towards the door. Suddenly, David heard a whimpering noise coming out of the space underneath the bed. He thought it was some sort of an animal. As he picked up the sheet to look beneath, he was horrified. There she was, his wife, scared as a mouse. He could hear her squealing… “W-Wh-Who was she?”"],
                    "map": ["3": "0"],
                ],
                [
                    "id": "8",
                    "title": "Purple Street",
                    "images": ["purple"],
                    "paragraphs": ["Jason was walking along the Purple Street. It was his first visit here. And his father was keen on making him understand the nuances of their universe. Every shop in Purple Street had a monument attached to it. Each shop had a story to tell. Suddenly, 11 year old Jason saw a flipping coin.",
                        
                        "The coin was floating in mid air, flipping around it’s diameter, covered by a glass. “Why and how is that coin floating in mid air?”, Jason asked his dad. Dad was eager to explain. David never had a supporting father, and was left to explore the world on his own. Although this might have been a good thing, David was inclined to show his son all the wonders the world beheld.",
                        
                        "David knew about the story, but he wanted the Old Hag to narrate the story. His style of narration was great, David thought. “Let’s ask the Old Hag”, exclaimed David, after a pause. Off they went inside the store. A fiery purple colored ‘Old Hag Store’ title decorated the entrance.",
                        
                        "“What brings you here today?”, asked the Old Hag, in a husky voice. “I hope you’re not here just for the story, young lad”, he said. “We’ll take 2 flip tanks”, David said. “Oh nice”, said the Old Hag. “ But I’d also like you to tell this little guy here the story of the Flipping Coin. You can charge us extra for that.”, said David. “Oh don’t worry it’s for free. At least until people stop buying from my store.”, he said.",
                        
                        "“So listen to this young lad. There was once a woman, enchanted with powers only the wise ones had. She was bestowed with the finest of honors and held the highest of regards. But alas, she made a folly.”",
                        
                        "“And what was that?”, asked Jason, eagerly awaiting a response.",
                        
                        "“Well she had a coin. She would flip it every time she wanted a correct answer to something. And…”",
                        
                        "“And…?”",
                        
                        "“And one day, someone challenged her to answer a very very deep question. She, being as vain as she was, agreed without listening to the question. The coin was tossed in mid air.”",
                        
                        "The suspense was now building up. Jason was eager to know what happened next.",
                        
                        "“The questioner exclaimed, ‘What came first, the chicken or the egg?’”, said the Old Hag.",
                        
                        "“Ha ha ha ha”, Jason and David both had a good laugh. Off they went, to explore another shop, with the 2 flip tanks in their pockets. "],
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
            title: dict["title"].stringValue,
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