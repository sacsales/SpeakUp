//
//  SubjectSetManager.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 11/03/2025.
//

import Foundation
import Observation
import SwiftUI

@Observable class SubjectSetManager: ObservableObject {
    var subjectSets: [SubjectSet] = [] {
        didSet {
            save()
        }
    }
        
    init() {
        load()
    }
    
    func deleteTerm(from subjectIndex: Int, in topicIndex: Int, at termIndex: IndexSet) {
            subjectSets[subjectIndex].topics[topicIndex].terms.remove(atOffsets: termIndex)
        }
    
    
    
    private func getArchiveURL() -> URL {
        URL.documentsDirectory.appending(path: "subjectSets.json")
    }
    
     func save() {
        let archiveURL = getArchiveURL()
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        
        let encodedSubjectSets = try? jsonEncoder.encode(subjectSets)
        try? encodedSubjectSets?.write(to: archiveURL, options: .noFileProtection)
    }
    
     func load() {
        let archiveURL = getArchiveURL()
        let jsonDecoder = JSONDecoder()
                
        if let retrievedSubjectSetData = try? Data(contentsOf: archiveURL),
           let subjectSetsDecoded = try? jsonDecoder.decode([SubjectSet].self, from: retrievedSubjectSetData) {
            subjectSets = subjectSetsDecoded
        }
    }
}
