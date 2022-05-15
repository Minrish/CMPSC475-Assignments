//
//  PreferenceButtonView.swift
//  Multiply Speedrun 3
//
//  Created by Bert Yan on 1/30/22.
//

import SwiftUI

struct PreferenceButtonView : View {
    @State private var isShowingPreference = false
    @Binding var gameManager : GameManager

    var body: some View {
   
        Button(action: { self.isShowingPreference.toggle() }) {
            Image(systemName: "gear.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25, alignment: .center)
                .foregroundColor(.white)
                .padding(30)
        }.sheet(isPresented: $isShowingPreference) {
            PreferenceView(isShowingPreference: self.$isShowingPreference, questionNumber: self.$gameManager.gamePreferenceSetting.QuestionRounds, preference: self.$gameManager.gamePreferenceSetting)
            
        }
        
    }
}
