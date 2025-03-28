//
//  GameView.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 13/03/2025.
//

import SwiftUI

struct GameView: View {
    
    @State var isLandscape = true
    
    @Binding var chosenSet: SubjectSet
    
    
    @State private var topicIndex = 0
    @State private var randomTerm = 0
    
    
    @Binding var teams : [Team]
    @State var currentTeamIndex = 0
    
    
    @State var timeRemaining = 30
    @State var isTimerRunning = false
    @Binding var timerLength: Int
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var startTime =  Date()
    @State private var currentRoundPts = 0
    @State private var skipped = false
    
    
    @State private var isCountdownRunning = false
    @State private var countdownValue = 3
    
    @State private var showSheet = true
    
    @State private var showRect = true
    
    @State private var showScore = true
    
    
    @State var pointsToWin : Int
    
    @State var showEndScreen = false
    
    var body: some View {
        
        
        
        ZStack {
            
            
            VStack {
                Text("\(teams[currentTeamIndex].name)")
                    .foregroundStyle(.black)
                
                Text("\(timeRemaining)")
                    .foregroundStyle(.black)
                    .font(Font.system(.largeTitle, design: .monospaced))
                    .onReceive(timer) { _ in
                        if self.isTimerRunning {
                            if timeRemaining > 0 {
                                timeRemaining -= 1
                            } else if timeRemaining == 0 {
                                self.stopTimer()
                                teams[currentTeamIndex].points += currentRoundPts
                                showRect = true
                                
                                
                                showScore = true
                                if checkWin(winValue: pointsToWin) {
                                    showEndScreen = true 
                                }
                                
                                
                                currentRoundPts = 0
                                timeRemaining = timerLength
                                skipped = false
                                
                                if currentTeamIndex + 1 >= teams.count {
                                    currentTeamIndex = 0
                                } else {
                                    currentTeamIndex += 1
                                }
          
                            }
                        }
                    }
                    .onAppear() {
                       
                        self.stopTimer()
                    }
                
                
                
                HStack {
                    Button {
                        if skipped == false {
                            skipped = true
                            randomTerm = Int.random(in: 1..<chosenSet.topics[topicIndex].terms.endIndex)
                            
                        }
                    } label: {
                        Image(systemName: "forward.circle.fill")
                            .font(.system(size: 100))
                            .foregroundStyle(skipped ? .gray : .purple)
                    }
                    

                    
                    GameTermView(color: $chosenSet.topics[topicIndex].color, term: $chosenSet.topics[topicIndex].terms[randomTerm].text)
                    
                    Button {
                        randomTerm = Int.random(in: 1..<chosenSet.topics[topicIndex].terms.endIndex)
                        currentRoundPts += 1
                    } label: {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 100))
                            .foregroundStyle(.purple)
                    }
                    
                }
                
                Text("Current Round:  \(currentRoundPts) Points")
                    .foregroundStyle(.black)
            }
            
            .blur(radius: showRect ? 15 : 0)
            
            
            //blur + darken bg
            Rectangle()
                .fill(showRect ? .gray : .clear)
                .opacity(0.9)
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.height * 1.3, height: UIScreen.main.bounds.width)
            
            if showRect {
                
                if showScore {
                    
                    
                    ZStack {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.height * 0.6, height: UIScreen.main.bounds.width * 0.7)
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 15))
                        
                        
                        if showEndScreen == true {
                            VStack {
                                
                                Text("\(winner().name)wins with \(winner().points) points!")
                                    .font(.title)
                                    .bold()
                                    .padding()
                                    .foregroundStyle(.black)
                                ScoreView(teams: $teams)
                                NavigationLink(destination: AllSetsView()) {
                                    Text("End Game")
                                        .padding()
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.purple)
                            }
                            
                        } else {
                            VStack {
                                
                                Text("Points")
                                    .font(.title)
                                    .bold()
                                    .padding()
                                    .foregroundStyle(.black)
                                ScoreView(teams: $teams)
                                Button("Go!") {
                                    showScore = false
                                    topicIndex = randomTopic()
                                }
                                .buttonStyle(.borderedProminent)
                                
                            }
                        }
                    }
                } else {
                    
                    //your topic is...
                    ZStack {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.height * 0.6, height: UIScreen.main.bounds.width * 0.7)
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 15))
                        VStack {
                            Text("\(teams[currentTeamIndex].name)'s Turn")
                                .font(.title)
                                .bold()
                                .foregroundStyle(.black)
                            Text("Your topic is...")
                            Text(chosenSet.topics[topicIndex].title)
                                .font(.largeTitle)
                                .foregroundStyle(.black)
                            Button("Start!") {
                                showRect = false
                                showScore = false
                                startTimer()
                                isTimerRunning = true
                                
                                
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.purple)
                        }
                    }
                    
                }
            }
          
              
        }
        
        
        .background(Color.white)
        
        
        .rotationEffect (isLandscape ? .degrees(90): .degrees(0), anchor: .center)
        
        .navigationBarBackButtonHidden(true)
    }
    
    
    
    
    
    
    func stopTimer() {
        self.timer.upstream.connect().cancel()
    }
    
    func startTimer() {
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
    
    
    func checkWin(winValue: Int ) -> Bool {
        var win = false
        for team in teams {
            if team.points >= winValue {
                win = true
            }
        }
        return win
        
    }
    
    func winner() -> Team {
     // var highest = 0
      var winner: Team = Team(name: "")
        
        for team in teams {
            if team.points >= winner.points {
                winner = team
            }
        }
        return winner
        
    }
    
    
    func randomTopic() -> Int  {
        
       
        var topicIndex = Int.random(in: 0..<$chosenSet.topics.count - 1)
        return topicIndex
    }
    
    
}



#Preview {
    GameView(chosenSet: .constant(SubjectSet(title: "Basics", topics: [Topic(title: "Random", terms: [Term(text: "red blood cell"), Term(text: "shark"), Term(text: "eutrophication"), Term(text: "potometer")])])), teams: .constant([Team(name: "Team1"), Team(name: "Team2")]), timerLength: .constant(30), pointsToWin: 20)
}




