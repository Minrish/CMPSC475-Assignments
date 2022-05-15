//
//  CurrentScoreText.swift
//  Multiply Speedrun
//
//  Created on 1/17/22.
//

import SwiftUI

struct CurrentScoreText: View {
    var currentScoreText : String
    var body: some View {
        Text(currentScoreText)
            .font(.largeTitle)
            .bold()
            .foregroundColor(Color.white.opacity(0.50))
    }
}

struct CurrentScoreText_Previews: PreviewProvider {
    static var previews: some View {
        CurrentScoreText(currentScoreText: "2/5")
    }
}
