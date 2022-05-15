//
//  CorrectnessIndicator.swift
//  Multiply Speedrun
//
//  Created on 1/17/22.
//

import SwiftUI

struct CorrectnessIndicatorText: View {
    var correctnessIndicatorText : String
    var body: some View {
        Text(correctnessIndicatorText)
            .font(.custom("Arial Bold", size: 30, relativeTo: .headline))
            .bold()
//            .foregroundColor(Color.green)
    }
}

struct CorrectnessIndicatorText_Previews: PreviewProvider {
    static var previews: some View {
        CorrectnessIndicatorText(correctnessIndicatorText : "✘✔︎_")
            .foregroundColor(Color.green)
        CorrectnessIndicatorText(correctnessIndicatorText : "✘✔︎_")
            .foregroundColor(Color.red.opacity(0.70))
        CorrectnessIndicatorText(correctnessIndicatorText : "✘✔︎_")
            .foregroundColor(Color.black)
    }
}
