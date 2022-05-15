//
//  ViewConstants.swift
//  Multiply Speedrun 2
//
//  Created by Bert Yan on 1/24/22.
//

import Foundation
import SwiftUI

struct ViewConstants {
    
    // Textual constants
    static let title1stline : String = "MULTIPLY"
    static let title2ndline : String = "SPEEDRUN 2"
    static let summary: String = "All done!"
    
    static let resultButtonText : String = "Next"
    static let summaryButtonText : String = "Restart"
    static let startButtonText : String = "Start"
    
    // Color constants
    static let backgroundColor = LinearGradient(colors: [Color.indigo, Color.cyan], startPoint: .top, endPoint: .bottom)
    static let textColor = Color.white
    static let approveColor = Color.green.opacity(0.80)
    static let denyColor = Color.red.opacity(0.80)
    
    // Shadow constants
    static let shadowRadius: CGFloat = 20.0
    
    // Background constants
    static let backgroundGradient = LinearGradient(
        colors: [Color.indigo, Color.cyan],
        startPoint: .top, endPoint: .bottom)
}
