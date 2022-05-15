//
//  ResultView.swift
//  Multiply Speedrun 3
//
//  Created by Bert Yan on 1/30/22.
//

import SwiftUI

struct ResultView: View{
    @Binding var gameManager : GameManager
    private var currentCorrectnessColorBinding : Color {
        gameManager.currentCorrectness == "Correct" ? ViewConstants.approveColor : ViewConstants.denyColor
    }
    
    var body: some View{
        VStack{
            Text(gameManager.currentCorrectness)
                .font(.custom("Avenir Next", size: 80, relativeTo: .largeTitle)).fontWeight(.bold)
                .foregroundColor(currentCorrectnessColorBinding).multilineTextAlignment(.center)
            Text(gameManager.currentProblemAnalysis)
                .font(.custom("Avenir", size: 25, relativeTo: .headline)).fontWeight(.bold)
            
            Spacer()
            
            Button(ViewConstants.resultButtonText){
                self.gameManager.getNextProblem()
                } .buttonStyle(NextButtonStyle())
        }
        
    }
}
