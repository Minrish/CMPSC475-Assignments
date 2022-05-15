//
//  FlipImage.swift
//  Learn Morse
//
//  Created by Bert Yan on 3/15/22.

import SwiftUI

struct ColorSquare : View {
    var color : Color
    var body : some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(color)
            .frame(width: 300, height: 200)
            .padding()

    }
}


struct FlipImage  : View {
    //var name : String
    var text:String
    var color : Color
    var body: some View {
        ZStack{
            ColorSquare(color: color)
            Text(text).foregroundColor(.white).bold()
        }
    

    }
}

struct FlipImage_Previews: PreviewProvider {
    static var previews: some View {
        FlipImage(text: "R", color: .orange)
    }
}
