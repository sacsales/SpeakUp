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
    @State private var showHelpSheet = false
    
    var body: some View {
        NavigationStack {
            
            List($subjectSetManager.subjectSets, editActions: [.all]) { $subjectSet in
                NavigationLink {
                    SetDetailView(subjectSet: $subjectSet, subjectSetManager: subjectSetManager)
                } label: {
                    Text(subjectSet.title)
                        .bold()
                }
                
            }
            .navigationTitle("Subject Sets")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showHelpSheet = true
                    } label: {
                        Image(systemName: "questionmark.circle")
                    }
                }
            }
        }
       
        .sheet(isPresented: $showSheet) {
            NewSetView(sets: $subjectSetManager.subjectSets, subjectSetManager: subjectSetManager)
                .presentationDetents([.medium])
        }
        
        .sheet(isPresented: $showHelpSheet) {
            HelpSheetView()
        }
        
        .navigationBarBackButtonHidden(true)
    }
    
}

#Preview {
    AllSetsView()
}
