//
//  NewSetView.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 07/03/2025.
//

import SwiftUI

struct NewSetView: View {
    
    
    @Binding var sets : [Set]
    @State private var newSet : String = ""
    
    var body: some View {
        Form {
            TextField("New Term", text: $newSet)
//            Button("Save") {
//                let set = Set(title: newSet, topics: <#T##[Topic]#>)
//                //sets.topics.append(term)
//            }
        }
    }
}

#Preview {
    NewSetView(sets: .constant([Set(title: "Sample Subject", topics:
                                    [Topic(title: "Numbers", terms:
                                            [Term(text: "one"),
                                             Term(text: "two")]),])]))
}
