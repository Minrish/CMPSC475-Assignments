//
//  SummaryView.swift
//  Multiply Speedrun 2
//
//  Created by Bert Yan on 1/24/22.
//

import SwiftUI

struct SummaryView: View{
    @EnvironmentObject var gameManager : GameManager
    
    var body: some View{
        VStack{
            Text(ViewConstants.summary)
                .font(.custom("Avenir", size: 40, relativeTo: .headline)).bold()
            Button(ViewConstants.summaryButtonText){
                self.gameManager.resetProblemSet()
            } .buttonStyle(ResetButtonStyle())
        }
        
    }
}
