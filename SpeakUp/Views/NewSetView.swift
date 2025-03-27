//
//  NewSetView.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 07/03/2025.
//

import SwiftUI

struct NewSetView: View {
    
    @State private var showSheet = false
    @Binding var sets : [SubjectSet]
    @State private var newSet : String = ""
    @ObservedObject var subjectSetManager : SubjectSetManager
    
    
    @Environment(\.dismiss) var goAway
    
    
    var body: some View {
        Form {
            Section {
                TextField("New Set: Biology, Chemistry", text: $newSet)
                
            }
            
            Button("Save") {
                subjectSetManager.save()
                subjectSetManager.load()
                let set = SubjectSet(title: newSet, topics: [])
                sets.append(set)
                subjectSetManager.save()
                subjectSetManager.load()
                
                goAway()
            }
        }
    }
}

#Preview {
    NewSetView(sets: .constant([SubjectSet(title: "Sample Subject", topics:
                                    [Topic(title: "Numbers", terms:
                                            [Term(text: "one"),
                                             Term(text: "two")]),])]), subjectSetManager: SubjectSetManager())
}
