//
//  FlipcardsListView.swift
//  Learn Morse
//
//  Created by Bert Yan on 3/16/22.
//

import SwiftUI

struct FlipcardsListView: View {
    var morseCodeDict:[String:String]
    var body: some View {
        List{
        ForEach(morseCodeDict.sorted(by: <),id:\.key){
            key, value in
            FlidcardsDetailView(frontText: value,backText:key)
        }
    }
    }
    
}

struct FlipcardsListView_Previews: PreviewProvider {
    static var previews: some View {
        FlipcardsListView(morseCodeDict: ["----":"R","-.-":"A"])
    }
}
