//
//  MultiplicandText.swift
//  Multiply Speedrun
//
//  Created on 1/17/22.
//

import SwiftUI

struct MultiplicandText: View {
    var multiplicandText : String
    var body: some View {
        Text(multiplicandText)
            .font(.custom("Arial Bold", size: 70, relativeTo: .headline))
            .bold()
            .foregroundColor(Color.white)
    }
}

struct MultiplicandText_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicandText(multiplicandText: "FirstValue")
    }
}
