//
//  NewTermView.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 07/03/2025.
//

import SwiftUI

struct NewTermView: View {
    
    @Binding var topic : Topic
    @State var newTerm = ""
    
    
    var body: some View {
        Form {
            Section {
                TextField("New Term: Mitochondria, ribosomes, etc.", text: $newTerm)
               

            }
            Button("Save") {
                let term = Term(text: newTerm)
                topic.terms.append(term)
                newTerm = ""
            }
        }
    }
}

#Preview {
    NewTermView(topic: .constant(Topic(title: "Numbers", terms: [Term(text: "one"), Term(text: "two")])))
}
