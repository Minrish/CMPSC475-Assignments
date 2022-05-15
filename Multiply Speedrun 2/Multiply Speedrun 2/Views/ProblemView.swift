//
//  ProblemView.swift
//  Multiply Speedrun 2
//
//  Created by Bert Yan on 1/24/22.
//

import SwiftUI

// Present the math problem
struct ProblemView: View {
    @EnvironmentObject var gameManager : GameManager
    
    var body: some View{
        VStack(spacing: 45){
            
            // Problems
            VStack(alignment: .center, spacing: 10) {
                
                // Problem Number
                Text("Question \(gameManager.currentQuestionNumber)")
                    .font(.custom("Arial", size: 24, relativeTo: .headline))
                    .bold()
                    .foregroundColor(.white.opacity(0.60))
                
                HStack (alignment: .lastTextBaseline) {
                    Text("×")
                        .font(.custom("Arial Bold", size: 60, relativeTo: .headline))
                        .bold()
                        .foregroundColor(Color.white)
                    
                    VStack(alignment: .trailing) {
                        Text(gameManager.currentFirstVariable)
                            .font(.custom("Arial Bold", size: 60, relativeTo: .headline))
                            .bold()
                            .foregroundColor(Color.white)
                        
                        Text(gameManager.currentSecondVariable)
                            .font(.custom("Arial Bold", size: 60, relativeTo: .headline))
                            .bold()
                            .foregroundColor(Color.white)
                    }
                }
                
                // Horizontal Line
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.white)
                    .frame(width: 200, height: 6)
                
            }
            ChoiceView()
        }
    }
}
