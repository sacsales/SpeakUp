//
//  ContentView.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 07/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var sampleSets = [Set(title: "Basics", topics:
                                            [Topic(title: "Numbers", terms:
                                                    [Term(text: "one"),
                                                     Term(text: "two")]),])]
    @State private var showSheet = false
    
    
    var body: some View {
        
        NavigationStack {
            
            List($sampleSets) { $set in
                NavigationLink {
                    SetDetailView(set: $set)
                } label: {
                    Text(set.title)
                        .bold()
                }
                
            }
            .navigationTitle("Sets")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
       
        .sheet(isPresented: $showSheet) {
            NewSetView(sets: $sampleSets)
                .presentationDetents([.medium])
        }
        
    }
    
    
}

#Preview {
    ContentView()
}
