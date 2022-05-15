//
//  ContentView.swift
//  Learn Morse
//
//  Created by Bert Yan on 3/15/22.
//

import SwiftUI
    
struct ContentView: View {
    let morseCodeObj = MorseCodeData()

    @State private var action: Int? = 0
    
    var body: some View {
        NavigationView{
            ZStack{
                
                ViewConstants.backgroundGradient.edgesIgnoringSafeArea(.all)
                
                VStack(alignment:.center) {
                    Text(ViewConstants.title1stline).font(.system(size: 95, weight: .bold, design: .rounded)).foregroundColor(Color.mint)
                    Text(ViewConstants.title2ndline).font(.system(size: 85, weight: .bold, design: .rounded)).foregroundColor(Color.blue)
                
               
                    VStack(alignment: .center, spacing: 40){
                        
                        NavigationLink(destination: MorseCodeDecoder(morseCodeDict: morseCodeObj.morseCodeDict), tag: 1, selection: $action) {EmptyView()}
                        
                        NavigationLink(destination: FlipcardsListView(morseCodeDict: morseCodeObj.morseCodeDict), tag: 2, selection: $action) {EmptyView()}
                                        
                        Text(ViewConstants.option1title).font(.system(size: 30, weight: .regular, design: .rounded))
                            .padding(.horizontal)
                            .padding(.horizontal)
                            .padding()
                            .foregroundColor(.white)
                            .background(Capsule().strokeBorder(option1Gradient, lineWidth: 40).background(Capsule().fill(option1Gradient)).shadow(radius: ViewConstants.shadowRadius)).foregroundColor(.white)
                            .onTapGesture {
                                //perform some tasks if needed before opening Destination view
                                self.action = 1
                            }
                        Text(ViewConstants.option2title).font(.system(size: 30, weight: .regular, design: .rounded))
                            .padding(.horizontal)
                            .padding(.horizontal)
                            .padding(.horizontal)
                            .padding()
                            .foregroundColor(.white)
                            .background(Capsule().strokeBorder(option2Gradient, lineWidth: 40).background(Capsule().fill(option2Gradient)).shadow(radius: ViewConstants.shadowRadius)).foregroundColor(.white)
                            .onTapGesture {
                                //perform some tasks if needed before opening Destination view
                                self.action = 2
                            }
                    }
                }
            }
        }
    }
}
 

struct ContentView_Previews: PreviewProvider {
    let moreCode = Constants.getMorseCode(fileName: "morse")
    static var previews: some View {
        ContentView()
    }
}
