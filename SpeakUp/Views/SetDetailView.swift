//
//  SetDetailView.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 07/03/2025.
//

//get the indexes from other screen....

import SwiftUI

struct SetDetailView: View {
    
 
    @Binding var subjectSet : SubjectSet
    @State private var showSheet = false
 
    @State private var gameScreen = false
    
    
  //  @EnvironmentObject var subjectSet: SubjectSet

    var body: some View {
       
            
            NavigationStack {
                List {
                    
                    ForEach($subjectSet.topics) { $topic in
                        NavigationLink {
                            TermsView(topic: $topic)
                        } label: {
                            Text(topic.title)
                        }
                        
                    }
                    .onDelete { indexSet in
                        subjectSet.topics.remove(atOffsets: indexSet)
                    }
                }
                
                
                .navigationTitle(subjectSet.title)
                
            }
            
            
            
            
            
            
            NavigationLink(destination: GameSetupView(chosenSet: $subjectSet)) {
                Text("Play Set")
                    .padding()
            }
            .buttonStyle(.borderedProminent)
            .tint(.purple)
            .disabled(checkEmpty(subjectSet: subjectSet))
            
            
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

    
    func checkEmpty(subjectSet: SubjectSet) -> Bool {
        
        var checkEmpty = false
        if subjectSet.topics.count < 2 {
            checkEmpty = true
        }
           
        for topic in subjectSet.topics {
            if topic.terms.isEmpty || topic.terms.count < 5 {
                checkEmpty = true
            }
        }
        
     return checkEmpty
        
         
        
    }
    




#Preview {
    SetDetailView(subjectSet: .constant(SubjectSet(title: "Basics", topics:
                                                [Topic(title: "Numbers", terms: [Term(text: "one"), Term(text: "two"),]),
                                                 Topic(title: "Colours", terms: [Term(text: "pink"),])])))
}
