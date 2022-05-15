//
//  HorizontalLine.swift
//  Multiply Speedrun
//
//  Created on 1/17/22.
//

import SwiftUI

struct HorizontalLine: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25, style: .continuous)
            .fill(Color.white)
            .frame(width: 300, height: 10)
    }
}

struct HorizontalLine_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalLine()
    }
}
