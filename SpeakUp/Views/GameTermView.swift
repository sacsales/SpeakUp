//
//  GameTermView.swift
//  SpeakUp
//
//  Created by Sabrina C. Sales on 27/03/2025.
//

import SwiftUI

struct GameTermView: View {
    
    
    @Binding var color: Color
    @Binding var term: String
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.height * 0.6, height: UIScreen.main.bounds.width * 0.5)
                .foregroundStyle(color)
                .clipShape(.rect(cornerRadius: 15))
            
            Text(term)
                .foregroundStyle(.white)
                .font(.title2)
                .bold()
            
        }
    }
}

#Preview {
    GameTermView(color: .constant(.purple), term: .constant("Text"))
}



