//
//  HelpSheetView.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 27/03/2025.
//

import SwiftUI

struct HelpSheetView: View {
    
    
    var body: some View {
        
        ScrollView {
            VStack (alignment: .leading) {
                Text("Help!")
                    .font(.largeTitle)
                    .bold()
                Divider()
                    .opacity(0)
                Text("What is this?")
                    .font(.title)
                    .bold()
                Text("""
Also Known As, or AKA, is an exam revision game where you describe keywords and terms to a partner under a time limit.
                 
It was introduced to me by our biology teacher. I found it so effective I wanted to create sets for other subjects easily, so I made this!
""")
                Divider()
                    .opacity(0)
                Text("How do I play?")
                    .font(.title)
                    .bold()
                
                
                Text("""
Grab some friends, and get into pairs. _(I'd also recommend finding a place where you won't disturb anyone: things can get **very loud** and competitive very quickly.)_

Choose a set to play, click **'Play Set'** at the bottom of the screen, and enter the number of teams you have, as well as team names. You can also customize how long each round will last, as well as how many points needed to win. 

Let's look at some quick definitions we'll use. 

**Subject Sets:** A main topic. Like an entire subject or course. _(e.g. Biology)_
**Topics:** Topics, chapters or modules within a subject, _(e.g. Plants, Ecology)_
**Terms:** Terms within a topic. _(e.g. within the 'Plants' topic, terms would be 'Cell Wall', or 'Leaf.')_


The screen will show the current scores, and assign a topic and team for the next round. 

Pass the phone to the first team. 

The pair will decide who will describe and who will guess. Once you press start, the timer will begin: describe as many words as you can WITHOUT using the word, or parts of the word, itself to your partner. You also are not allowed to say what it rhymes with. Click the checkmark once your partner has guessed the work correctly.

You can press the skip button on the left if you think it's hopeless, but you only get one skip per round - choose wisely! 

Once the timer ends, the game will assign a new team and new topic. Pass the phone to the next team, and repeat!

""")
                
            }
            .padding()
        }
    }
}

#Preview {
    HelpSheetView()
}
