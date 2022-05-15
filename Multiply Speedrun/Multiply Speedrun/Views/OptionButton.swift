//
//  OptionLT.swift
//  Multiply Speedrun
//
//  Created on 1/17/22.
//

import SwiftUI

struct OptionButton: View {
    var optionButtonText : String
    var body: some View {
        Button (action: {}) {
            Text(optionButtonText)
                .bold()
                .font(Font.system(size: 30))
                .padding()
                .background(RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(Color.white.opacity(0.50))
                                .frame(width: 140, height: 140))
                .foregroundColor(.white)
        }

    }
}

struct OptionButton_Previews: PreviewProvider {
    static var previews: some View {
        OptionButton(optionButtonText: "Option")
    }
}
