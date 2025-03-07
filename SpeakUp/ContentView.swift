//
//  ContentView.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 07/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    
   @State private var sampleSets = [Set(title: "Sample Subject", topics:
        [Topic(title: "Numbers", terms: ["one", "two", "three"]),
        Topic(title: "Colours", terms: ["pink", "blue", "black"])])]
    
    
    
    var body: some View {
        
        NavigationStack {
            List($sampleSets) { $set in
                NavigationLink {
                    SetDetailView(set: $set)
                } label: {
                    Text(set.title)
                }
            }
            .navigationTitle("Sets")
            
        }
        
    }
}

#Preview {
    ContentView()
}
