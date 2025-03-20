//
//  SetDetailView.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 07/03/2025.
//

import SwiftUI

struct SetDetailView: View {
    
    
    @Binding var subjectSet : SubjectSet
    @State private var showSheet = false
    
    @State private var gameScreen = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationStack {
                    
                    List($subjectSet.topics) { $topic in
                        NavigationLink{
                            TermsView(topic: $topic)
                        } label: {
                            Image(systemName: "circle.fill")
                                .foregroundStyle(topic.color)
                            Text(topic.title)
                        }
                    }
                    .navigationTitle(subjectSet.title)
                    
                    
                }
               
                
                NavigationLink(destination: GameSetupView(chosenSet: $subjectSet)) {
                    Text("a")
                    
                }
               
               
                
                
            }
            
            
            
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
            NewTopicView(subjectSet: $subjectSet)
                .presentationDetents([.medium])
        }
        
        
    }
}

#Preview {
    SetDetailView(subjectSet: .constant(SubjectSet(title: "Basics", topics:
                                                [Topic(title: "Numbers", terms: [Term(text: "one"), Term(text: "two"),]),
                                                 Topic(title: "Colours", terms: [Term(text: "pink"),])])))
}
