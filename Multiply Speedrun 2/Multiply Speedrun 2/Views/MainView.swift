//
//  MainView.swift
//  Multiply Speedrun 2
//
//  Created by Bert Yan on 1/24/22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var gameManager : GameManager
    
    var body: some View{
        VStack{
            ScoreView()
            ZStack{
                ProblemView().padding(.top).padding(.top).padding(.top).opacity(gameManager.applicationState == .question ? 1.0 : 0.0).disabled(gameManager.applicationState == .question ? false : true)
                
                ResultView().opacity(gameManager.applicationState == .result ? 1.0 : 0.0).disabled(gameManager.applicationState == .result ? false : true)
                
                SummaryView().opacity(gameManager.applicationState == .summary ? 1.0 : 0.0).disabled(gameManager.applicationState == .summary ? false : true)
            }
        }
    }
}
