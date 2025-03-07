//
//  SetDetailView.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 07/03/2025.
//

import SwiftUI

struct SetDetailView: View {
    
    
    @Binding  var set : Set
    
           
    var body: some View {
        List(set.topics) { topic in
            Text(topic.title)
        }
    }
}

#Preview {
    SetDetailView(set: .constant(Set(title: "Sample Subject", topics:
                            [Topic(title: "Numbers", terms: ["one", "two", "three"]),
                            Topic(title: "Colours", terms: ["pink", "blue", "black"])])))
}
