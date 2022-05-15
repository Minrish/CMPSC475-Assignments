//
//  AllButtonStyle.swift
//  Multiply Speedrun 3
//
//  Created by Bert Yan on 1/30/22.
//

import SwiftUI

let optionStartGradient = LinearGradient(
    colors: [Color.mint.opacity(0.60), Color.blue.opacity(0.60)],
    startPoint: .leading, endPoint: .bottom)

let optionNextGradient = LinearGradient(
    colors: [Color.blue.opacity(0.60), Color.indigo.opacity(0.60)],
    startPoint: .leading, endPoint: .bottom)

let optionRestartGradient = LinearGradient(
    colors: [Color.indigo.opacity(0.60), Color.mint.opacity(0.60)],
    startPoint: .leading, endPoint: .bottom)


// Button style presets
struct NextButtonStyle: ButtonStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding()
            .background(Capsule()
                            .strokeBorder(optionNextGradient, lineWidth: 40)
                            .shadow(radius: ViewConstants.shadowRadius)
                            )
            .foregroundColor(.white)
    }
}

struct RestartButtonStyle: ButtonStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding()
            .background(Capsule()
                            .strokeBorder(optionRestartGradient, lineWidth: 40)
                            .shadow(radius: ViewConstants.shadowRadius)
                            )
            .foregroundColor(.white)
    }
}

struct SelectionButtonStyle: ButtonStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(Font.system(size: 30))
            .frame(minWidth: 32.0)
            .background(RoundedRectangle(cornerRadius: 25, style: .continuous)
                                            .fill(Color.white.opacity(0.30))
                                            .frame(width: 100, height: 100)
                                            .shadow(radius: ViewConstants.shadowRadius))
                            .foregroundColor(.white)
                        
    }
}

