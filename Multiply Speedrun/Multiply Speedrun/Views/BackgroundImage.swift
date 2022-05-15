//
//  BackgroundImage.swift
//  Multiply Speedrun
//
//  Created on 1/17/22.
//

import SwiftUI

struct BackgroundImage: View {
    var imageName : String
    var body: some View {
        Image(imageName)
    }
}

struct BackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImage(imageName: "MultiplyBackground")
    }
}
