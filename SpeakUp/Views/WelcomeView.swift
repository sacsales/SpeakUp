//
//  WelcomeView.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 28/03/2025.
//


///unused for now

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
//            
//            Image("AKALogo1")
//                .resizable() // Makes the image resizable
//                           .scaledToFit() // Maintains the aspect ratio
//                           .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            Text("Hello!")
                .bold()
                .font(.title)
            Text("""
Welcome to Also Known As (aka, AKA)!

This is an exam revision app created to play with friends! 

To get started, read the instructions by clicking on the '?' button in the top right corner. A sample subject set of cards has already been loaded in for you. 

Have fun, and happy studying!
""")
            
            Button("Let's Go!"){
                
            }
            .buttonStyle(.borderedProminent)
            .padding()
            .tint(.purple)
        }
        .padding()
    }
}

#Preview {
    WelcomeView()
}
