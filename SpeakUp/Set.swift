//
//  Set.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 07/03/2025.
//

import Foundation

struct Set: Identifiable, Codable {
    var id = UUID()
    var title: String
    var topics: [Topic]
}


struct Topic: Identifiable, Codable {
    var id = UUID()
    var title: String
    var terms: [String]
}
                
