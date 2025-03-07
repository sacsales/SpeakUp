//
//  Set.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 07/03/2025.
//

import Foundation
import SwiftUI

struct Set: Identifiable, Codable {
    var id = UUID()
    var title: String
    var topics: [Topic]
   
    
}

struct Term: Identifiable, Codable {
    var id = UUID()
    var text: String
}


struct Topic: Identifiable, Codable {
    var id = UUID()
    var title: String
    var color: Color = .red
    var terms: [Term]
}
                
