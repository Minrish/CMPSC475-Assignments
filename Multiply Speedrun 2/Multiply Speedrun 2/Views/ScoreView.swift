//
//  ScoreView.swift
//  Multiply Speedrun 2
//
//  Created by Bert Yan on 1/24/22.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var gameManager : GameManager
    var body: some View{
        VStack{
            
            Text("Score: \(gameManager.correctCount)/\(gameManager.QuestionRounds)")
                .font(.title)
                .bold()
                .foregroundColor(Color.white.opacity(0.50))
            
            HStack{
                ForEach(gameManager.scoreList, id: \.self){i in
                    Text(i)
                }.padding(2.0)
                 .font(.custom("Arial Bold", size: 20, relativeTo: .headline))
            }
        }
        
    }
}
