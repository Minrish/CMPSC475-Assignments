//
//  MultiplierText.swift
//  Multiply Speedrun
//
//  Created on 1/17/22.
//

import SwiftUI

struct MultiplierText: View {
    var multiplierText : String
    var body: some View {
        Text(multiplierText)
            .font(.custom("Arial Bold", size: 70, relativeTo: .headline))
            .bold()
            .foregroundColor(Color.white)
    }
}

struct MultiplierText_Previews: PreviewProvider {
    static var previews: some View {
        MultiplierText(multiplierText: "SecondVal")
    }
}
