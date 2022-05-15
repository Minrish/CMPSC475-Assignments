//
//  GameView.swift
//  Multiply Speedrun 2
//
//  Created by Bert Yan on 1/24/22.
//

import SwiftUI

struct GameView: View{
    @EnvironmentObject var gameManager : GameManager
    var body: some View {
        VStack(alignment: .center){
            MainView().padding(.vertical)
        }.frame( maxWidth: .infinity, maxHeight: .infinity).background(ViewConstants.backgroundColor).foregroundColor(ViewConstants.textColor).navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .navigationBarHidden(true)
    }
}
