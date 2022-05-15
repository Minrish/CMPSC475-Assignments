//
//  ContentView.swift
//  Multiply Speedrun 3
//
//  Created by Bert Yan on 1/30/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View{
        NavigationView{
            ZStack{
                
                // Overall is a VStack, but background color and foreground application requires a ZStack
                ViewConstants.backgroundGradient.edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center, spacing: 250){
                    VStack {
                        Text(ViewConstants.title1stline).font(.system(size: 65, weight: .bold, design: .rounded)).foregroundColor(Color.mint)
        
                        Text(ViewConstants.title2ndline).font(.system(size: 50, weight: .bold, design: .rounded)).foregroundColor(Color.cyan)
                    }
                    
                    NavigationLink(destination: GameView()){
                        Text(ViewConstants.startButtonText).font(.system(size: 30, weight: .bold, design: .rounded))
                            .padding(.horizontal)
                            .padding(.horizontal)
                            .padding(.horizontal)
                            .padding(.horizontal)
                            .padding(.horizontal)
                            .padding(.horizontal)
                            .padding()
                            .background(Capsule().strokeBorder(optionStartGradient, lineWidth: 40).background(Capsule().fill(optionStartGradient)).shadow(radius: ViewConstants.shadowRadius)).foregroundColor(.white)
                        
                    }
                }
            }
        }.foregroundColor(ViewConstants.textColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
