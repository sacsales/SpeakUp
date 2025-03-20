//
//  AllSetsView.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 11/03/2025.
//

import SwiftUI

struct AllSetsView: View {
    
    @StateObject var subjectSetManager = SubjectSetManager()
    
    
    
    @State private var showSheet = false
    
    
    var body: some View {
        NavigationStack {
            
            List($subjectSetManager.subjectSets) { $set in
                NavigationLink {
                    SetDetailView(subjectSet: $set)
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
            NewSetView(sets: $subjectSetManager.subjectSets)
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    AllSetsView()
}
