//
//  MorseCodeDecoder.swift
//  MorseCode
//
//  Created by Bert on 03/17/22.
//

import SwiftUI
enum Stage{
    case initial
    case successfull
    case incorrect
    
    func getColor() -> Color{
        switch self {
        case .initial:
            return .orange
        case .successfull:
            return .green
        case .incorrect:
            return .red
        }
    }
}

struct MorseCodeDecoder: View {
   // @State var tapCount = 0
    @State var decodedMessage:String = ""
    @State private var title: String = "TAP HERE"
    @State var stage : Stage = .initial
    var bgButtonColor : Color {stage.getColor()}
    var conditiom = true
    @State var connectionState: Bool = true
   
    var morseCodeDict:[String:String]
    var body: some View {
        VStack(spacing:5){
            
            VStack{
                Text(ViewConstants.title1stline).font(.system(size: 75, weight: .bold, design: .rounded)).foregroundColor(Color.mint)
                Text(ViewConstants.title2ndline).font(.system(size: 68, weight: .bold, design: .rounded)).foregroundColor(Color.blue)
            }

            
        let tapGes = TapGesture()
            .onEnded{
                if title == "TAP HERE"{
                    title = ""
                }
                title = title + "."
                stage = .initial
                
                // BONUS POINT
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    decodeMorseCode()
                }
            
            }
            let longPress = LongPressGesture()
                .onEnded { value in
                    if title == "TAP HERE"{
                        title = ""
                    }
                    title = title + "-"
                    stage = .initial
                   // connectionState = false
                    
                    // BONUS POINT
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        decodeMorseCode()
                    }
                    
                }
            
            
            
            
        Button {
            removeText()
        } label: {
            Text("Delete the message")
        }
        
            
            ZStack(alignment: .center){
            ColorSquare(color: .blue)
                Text(decodedMessage).gesture(tapGes).font(.largeTitle)
        }
            ZStack(alignment: .center){
                ColorSquare(color: .blue).gesture(tapGes).gesture(longPress)
            
            if self.connectionState {
                Text(title).foregroundColor(.white)
            }
            else{
               // TextField("Username", text: $title).padding().background(.orange)
                TextField("Enter code", text: $title).padding().multilineTextAlignment(TextAlignment.center).font(.largeTitle).foregroundColor(.white)
            }
        }
        Button {
            decodeMorseCode()
        } label: {
            Text("Decode")
        }
//        .buttonStyle(Option1ButtonStyle())
        .background(bgButtonColor)
        .foregroundColor(.black)
        .frame(width: 60, height: 90)
        }
    }
    
    func removeText(){
        decodedMessage = ""
    }
    
    func decodeMorseCode(){
        for (key,_) in morseCodeDict{
            print(title)
            if morseCodeDict[key] == title{
                decodedMessage = decodedMessage + key.uppercased()
                stage  = .successfull
                connectionState = true
                title = "TAP HERE"
                return
            }
        }
        title = "TAP HERE"
        stage = .incorrect
        connectionState = true
    }
}

struct MorseCodeDecoder_Previews: PreviewProvider {
    static var previews: some View {
        MorseCodeDecoder(morseCodeDict: [:])
    }
}
