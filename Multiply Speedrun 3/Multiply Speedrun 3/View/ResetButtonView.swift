//
//  ResetButtonView.swift
//  Multiply Speedrun 3
//
//  Created by Bert Yan on 2/1/22.
//

import SwiftUI

struct ResetButtonView: View {
    @Binding var gameManager : GameManager
    
    var body: some View {
   
        Button(action: {gameManager.resetProblemSet()}) {
            Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25, alignment: .center)
                .foregroundColor(.white)
                .padding(30)
        }
    }
}
