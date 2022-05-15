//
//  MainView.swift
//  Multiply Speedrun 3
//
//  Created by Bert Yan on 1/30/22.
//

import SwiftUI

struct MainView: View {
    @Binding var gameManager : GameManager
    
    var body: some View{
        VStack{
            ScoreView(gameManager: gameManager)
            ZStack{
                ProblemView(gameManager: $gameManager).padding(.top).padding(.top).padding(.top).opacity(gameManager.applicationState == .question ? 1.0 : 0.0).disabled(gameManager.applicationState == .question ? false : true)
                
                ResultView(gameManager: $gameManager).opacity(gameManager.applicationState == .result ? 1.0 : 0.0).disabled(gameManager.applicationState == .result ? false : true)
                
                SummaryView(gameManager: $gameManager).opacity(gameManager.applicationState == .summary ? 1.0 : 0.0).disabled(gameManager.applicationState == .summary ? false : true)
            }
        }
    }
}
