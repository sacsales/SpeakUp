//
//  ScoreView.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 22/03/2025.
//

import SwiftUI

struct ScoreView: View {
    
    @Binding var teams : [Team]
   // @State  var currentTeamIndex : Int
    
    var body: some View {
        
        VStack {
            HStack {
                ForEach(teams) { team in
                    
                    
                        VStack {
                            Image(systemName: "person.2.fill")
                                .font(.system(size: 63))
                                .foregroundStyle(.purple)
                            Text(team.name)
                                .bold()
                                .font(.headline)
                                .foregroundStyle(.black)
                            Text("\(team.points) Points")
                            
                                .font(.subheadline)
                                .foregroundStyle(.black)
                            
                        }
                       
                       
                    
                }
            }
        }
        
        //.rotationEffect (.degrees(90), anchor: .center)
    }
}

#Preview {
    ScoreView(teams: .constant([Team(name: "Team 1", points: 2), Team(name: "Team2", points: 3)]))
}
