//
//  ContentView.swift
//  FInal Project Mockup
//
//  Created by Bert Yan on 3/26/22.
//

import SwiftUI

struct ContentView: View {
    @State private var action: Int? = 0
    
    var body: some View {
        NavigationView{
            ZStack{
                
                ViewConstants.backgroundGradient.edgesIgnoringSafeArea(.all)
                
                VStack(alignment:.center, spacing: 30) {
                    
                    VStack{
                        Text(ViewConstants.title1stline).font(.system(size: 95, weight: .bold, design: .rounded)).foregroundColor(Color.mint)
                        Text(ViewConstants.title2ndline).font(.system(size: 85, weight: .bold, design: .rounded)).foregroundColor(Color.blue)
                    }
               
                    VStack(alignment: .center, spacing: 20){
                        
                        NavigationLink(destination: Text("Hello"), tag: 1, selection: $action) {EmptyView()}
                        
                        NavigationLink(destination: Text("Hi"), tag: 2, selection: $action) {EmptyView()}
                                        
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
                            .padding()
                            .foregroundColor(.white)
                            .background(Capsule().strokeBorder(option2Gradient, lineWidth: 40).background(Capsule().fill(option2Gradient)).shadow(radius: ViewConstants.shadowRadius)).foregroundColor(.white)
                            .onTapGesture {
                                //perform some tasks if needed before opening Destination view
                                self.action = 2
                            }
                    }
                    
                    Image(systemName: "gear.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 40)
                        .foregroundColor(Color(.white))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
