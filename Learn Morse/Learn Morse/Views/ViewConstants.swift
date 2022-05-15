//
//  ViewConstants.swift
//  Learn Morse
//
//  Created by Bert Yan on 3/16/22.
//

import Foundation
import SwiftUI

struct ViewConstants {
    
    // Textual constants
    static let title1stline : String = "LEARN"
    static let title2ndline : String = "MORSE"
    
    static let option1title : String = "Decoder Mode"
    static let option2title : String = "Study Mode"
    
    // Shadow constants
    static let shadowRadius: CGFloat = 20.0
    
    // Background constants
    static let backgroundGradient = LinearGradient(
        colors: [Color.black.opacity(0.90), Color.black.opacity(0.90)],
        startPoint: .top, endPoint: .bottom)
}
