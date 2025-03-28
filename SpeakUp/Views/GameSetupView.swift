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
    
    
    @State private var pointsToWin = 20
    
    // @State private var subjectSet: SubjectSet
    
    var body: some View {
        
        NavigationStack {
            Form {
                
                Text("New Game")
                    .font(.largeTitle)
                    .bold()
                
                //show subject
                Section {
                    
                    VStack (alignment: .leading){
                        Text("Subject Set: \(chosenSet.title)")
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
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.purple, lineWidth: 4)
                    )
                    
                    
                }
                
                
                
                
                Section {
                    
                    Stepper("Number of teams: \(numberOfTeams)", value: $numberOfTeams, in: 2...5, onEditingChanged: { _ in
                        updateTeams()
                    })
                    
                    
                    Stepper("Points to win: \(pointsToWin)", value: $pointsToWin, in: 15...40)
                    
                    Stepper("Timer length: \(timerLength) seconds", value: $timerLength, in: 20...40)
                    
                    
                }
                
                Section {
                    
                    ForEach(teams.indices, id: \.self) { index in
                        Text("Team \(index + 1)")
                    }
                    
                    //buggy and annoying awful text fields. dismissed after every letter to be fixed - maybe a separate view?? why does it do this :( 
//                    ForEach($teams, id: \.self) { $team in
//                        TextField("Team name", text: $team.name)
//                            .textFieldStyle(.roundedBorder)
//                    }
                    
                    
                }
            }
            
            
            
            
            
            
            
            
            
            NavigationLink("Let's Play!", destination:  GameView(chosenSet: $chosenSet, teams: $teams, timerLength: $timerLength, pointsToWin: pointsToWin))
            
                .padding()
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                .padding()
                .bold()
            
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
