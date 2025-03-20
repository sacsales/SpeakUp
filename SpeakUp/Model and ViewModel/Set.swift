//
//  Set.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 07/03/2025.
//

import Foundation
import SwiftUI

struct SubjectSet: Identifiable, Hashable, Encodable, Decodable {
    var id = UUID()
    var title: String
    var topics: [Topic]

}



struct Topic: Identifiable, Codable, Equatable, Hashable {
    var id = UUID()
    var title: String
    var color: Color = .red
    var terms: [Term]
    
    
}
          

struct Term: Identifiable, Codable, Equatable, Hashable {
    var id = UUID()
    var text: String
   
}


struct Team: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var points = 0
    
}
