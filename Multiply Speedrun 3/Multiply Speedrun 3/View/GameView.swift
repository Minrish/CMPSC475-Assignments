//
//  GameView.swift
//  Multiply Speedrun 3
//
//  Created by Bert Yan on 1/30/22.
//

import SwiftUI

struct GameView: View{
    @State private var gameManager = GameManager()
    
    var body: some View {
        VStack(alignment: .center){
            MainView(gameManager: $gameManager)
            HStack{
                ResetButtonView(gameManager: $gameManager)
                Spacer()
                PreferenceButtonView(gameManager: $gameManager)
//                    .opacity(gameManager.applicationState == .question ? 0.0 : 1.0)
//                    .disabled(gameManager.applicationState == .question ? true : false)
            }
        }.frame( maxWidth: .infinity, maxHeight: .infinity).background(ViewConstants.backgroundColor).foregroundColor(ViewConstants.textColor).navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .navigationBarHidden(true)
    }
}
