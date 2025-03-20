//
//  GameView.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 13/03/2025.
//

import SwiftUI

struct GameView: View {
    
    
    @Binding var timerLength: Int
    //@ObservedObject var subjectSetManager: SubjectSetManager
    @Binding var chosenSet: SubjectSet
   
    @Binding var teams : [Team]
    @State var currentTeamIndex = 0
    @State var timeRemaining = 30
    @State var isTimerRunning = false
    @State var isLandscape = true
    
    @State private var randomTerm = 0
    // @State private var subjectSet: SubjectSet
    
    
   @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
   
        @State private var startTime =  Date()
       
    //var currentTopic = chosenSet.topics[0]
    
    var body: some View {
        
       
        
        
        VStack {
            Text("\(teams[currentTeamIndex].name)")
                .foregroundStyle(.black)
            Text("\(timeRemaining)")
                .font(Font.system(.largeTitle, design: .monospaced))
                .onReceive(timer) { _ in
                    if self.isTimerRunning {
                        if timeRemaining > 0 {
                               timeRemaining -= 1
                           }
                    }
                }
                .onTapGesture {
                    
                }
                .onAppear() {
                    // no need for UI updates at startup
                    self.stopTimer()
                }
  
            Button("Start") {
                startTimer()
                isTimerRunning.toggle()
            }
            
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "forward.circle.fill")
                        .font(.system(size: 100))
                        .foregroundStyle(.purple)
                }
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(.pink)
                        .frame(width: 400, height: 250)
                    Text(chosenSet.topics[currentTopic].name)
                        .foregroundStyle(.white)
                        .font(.title2)
                        .bold()
                    
                }
                
               
                  
                    Button {
                        
                    } label: {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 100))
                            .foregroundStyle(.purple)
                    }
                
            }
            
            Text("\(teams[currentTeamIndex].name) points")
                .foregroundStyle(.black)
        }
        
        .rotationEffect (isLandscape ? .degrees(90): .degrees(0), anchor: .center)
        
       
        
    }
    
        
    func stopTimer() {
        self.timer.upstream.connect().cancel()
    }
    
    func startTimer() {
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
       }
    
    
       
    
    
}



#Preview {
    GameView(timerLength: .constant(30), chosenSet: .constant(SubjectSet(title: "Basics", topics:
                                                                            [Topic(title: "Numbers", terms: [Term(text: "one"), Term(text: "two"),]),
                                                                             Topic(title: "Colours", terms: [Term(text: "pink"),])])), teams: .constant([Team(name: "Team1"), Team(name: "Team2")]))
}



