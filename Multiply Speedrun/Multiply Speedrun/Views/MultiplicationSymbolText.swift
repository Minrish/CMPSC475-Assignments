//
//  MultiplicationSymbolText.swift
//  Multiply Speedrun
//
//  Created on 1/17/22.
//

import SwiftUI

struct MultiplicationSymbolText: View {
    var multiplicationSymbolText : String
    var body: some View {
        Text(multiplicationSymbolText)
            .font(Font.system(size:70))
            .bold()
            .foregroundColor(Color.white)
    }
}

struct MultiplicationSymbolText_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationSymbolText(multiplicationSymbolText: "×")
    }
}
