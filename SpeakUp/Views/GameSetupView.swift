//
//  GameSetupView.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 19/03/2025.
//

import SwiftUI

struct GameSetupView: View {
    
    @State private var numberOfTeams = 2
    @State private var timerLength = 30
    //@ObservedObject var subjectSetManager: SubjectSetManager
    @Binding var chosenSet: SubjectSet
    @State var teams = [Team(name: "Team 1"), Team(name: "Team 2")]
    
   // @State private var subjectSet: SubjectSet
    
    var body: some View {

        NavigationStack {
            VStack {
            VStack {
                Text("New Game")
                    .font(.largeTitle)
                    .bold()
                
                VStack {
                    VStack (alignment: .leading){
                        Text("Set: \(chosenSet.title)")
                            .font(.title2)
                            .bold()
                        ForEach($chosenSet.topics) { $topic in
                            HStack {
                                Image(systemName: "circle.fill")
                                    .foregroundStyle(topic.color)
                                Text(topic.title)
                            }
                        }
                        
                    }
                    .padding()
                    .cornerRadius(20)
                    .border(.black)
                    
                    
                    Stepper("Number of teams: \(numberOfTeams)", value: $numberOfTeams, in: 2...5, onEditingChanged: { _ in
                        updateTeams()
                    })
                    
                    
                    Stepper("Timer length: \(timerLength) seconds", value: $timerLength, in: 20...40)
                    
                    VStack {
                        ForEach($teams, id: \.self) { $team in
                            TextField("Team name", text: $team.name)
                                .textFieldStyle(.roundedBorder)
                        }
                    }
                }
                .padding()
                    
                    
                    NavigationLink("aha", destination:  GameView(chosenSet: $chosenSet, teams: $teams, timerLength: $timerLength))
                       
                    
                        .buttonStyle(.borderedProminent)
                        .tint(.purple)
                        .padding()
                        .ignoresSafeArea()
                       
                    
                    
                    
                }
                
                
            }
            
            
        }
        .navigationBarBackButtonHidden(true)
       
       
           
      
        
    }
    
      
    private func updateTeams() {
            if teams.count < numberOfTeams {
                // Add new teams if needed
                while teams.count < numberOfTeams {
                    teams.append(Team(name: "Team \(teams.count + 1)"))
                }
            } else if teams.count > numberOfTeams {
                // Remove excess teams
                teams = Array(teams.prefix(numberOfTeams))
            }
        }
}

#Preview {
    GameSetupView(chosenSet: .constant(SubjectSet(title: "Basics", topics:
                                                                                [Topic(title: "Numbers", terms: [Term(text: "one"), Term(text: "two"),]),
                                                                                 Topic(title: "Colours", terms: [Term(text: "pink"),])])))
}
