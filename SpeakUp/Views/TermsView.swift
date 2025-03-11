//
//  TermsView.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 07/03/2025.
//

import SwiftUI

struct TermsView: View {
    
    @Binding var topic : Topic
    @State var newTerm = ""
    @State var showSheet = false
    
    var body: some View {
        VStack {
            List(topic.terms) { term in
                Text(term.text)
            }
            .navigationTitle(topic.title)
           
            
                
            
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
            NewTermView(topic: $topic)
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    TermsView(topic: .constant(Topic(title: "Numbers", terms: [Term(text: "one"), Term(text: "two")])))
}
