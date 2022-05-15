//
//  QuestionNumber.swift
//  Multiply Speedrun
//
//  Created on 1/17/22.
//

import SwiftUI

struct QuestionNumberText: View {
    var questionNumberText : String
    var body: some View {
        Text(questionNumberText)
            .font(.custom("Arial", size: 24, relativeTo: .headline))
            .bold()
            .foregroundColor(.white.opacity(0.60))
        
    }
}

struct QuestionNumberText_Previews: PreviewProvider {
    static var previews: some View {
        QuestionNumberText(questionNumberText: "Question 1")
    }
}
