//
//  NewTopicView.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 07/03/2025.
//

import SwiftUI

struct NewTopicView: View {
    
    @Binding var set: Set
    @State var newTopic = ""
    @State var color: Color = .blue
    
    var body: some View {
        Form {
            Section {
                TextField("New Topic: Plants, Ecology", text: $newTopic)
                ColorPicker("Set Topic Color", selection: $color)

            }
            Button("Save") {
                let topic = Topic(title: newTopic, color: color, terms: [])
                set.topics.append(topic)
            }
        }
    }
}

#Preview {
    NewTopicView(set: .constant(Set(title: "Basics", topics:
                                        [Topic(title: "Numbers", terms: [Term(text: "one"), Term(text: "two"),]),
                                         Topic(title: "Colours", terms: [Term(text: "pink"),])])))
}
