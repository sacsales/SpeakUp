//
//  SetDetailView.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 07/03/2025.
//

import SwiftUI

struct SetDetailView: View {
    @Binding var set : Set
    @State private var showSheet = false
           
    var body: some View {
        NavigationStack {
            List($set.topics) { $topic in
                NavigationLink{
                    TermsView(topic: $topic)
                } label: {
                    Image(systemName: "circle.fill")
                        .foregroundStyle(topic.color)
                    Text(topic.title)
                }
            }
            .navigationTitle(set.title)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        
        .sheet(isPresented: $showSheet) {
            NewTopicView(set: $set)
                .presentationDetents([.medium])
        }
        
        
    }
}

#Preview {
    SetDetailView(set: .constant(Set(title: "Basics", topics:
                                        [Topic(title: "Numbers", terms: [Term(text: "one"), Term(text: "two"),]),
                                         Topic(title: "Colours", terms: [Term(text: "pink"),])])))
}
