//
//  NextQuestionButton.swift
//  Multiply Speedrun
//
//  Created on 1/17/22.
//

import SwiftUI

let optionGradient = LinearGradient(
    colors: [Color.indigo.opacity(0.60), Color.blue.opacity(0.60)],
    startPoint: .leading, endPoint: .bottom)

struct NextQuestionButton: View {
    var nextQuestionButtonText : String
    var body: some View {
        Button(action: {}) {
        Text(nextQuestionButtonText)
            .bold()
            .font(Font.system(size: 30))
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding()
            .background(Capsule()
                            .strokeBorder(optionGradient, lineWidth: 40)
                            .background(Capsule().fill(optionGradient)))
            .foregroundColor(.white)
        }
    }
}
struct NextQuestionButton_Previews: PreviewProvider {
    static var previews: some View {
        NextQuestionButton(nextQuestionButtonText: "Next")
    }
}

