//
//  ChoiceView.swift
//  Multiply Speedrun 3
//
//  Created by Bert Yan on 1/30/22.
//

import SwiftUI

// Here we have the view for button selection
struct ChoiceView: View{
    @Binding var gameManager : GameManager

    var columns: [GridItem] = Array(repeating: GridItem(.fixed(100), spacing: 10), count: 2)
    var body: some View{
        
        LazyVGrid(columns: columns, spacing: 75) {
            ForEach(gameManager.currentProblemSelections, id: \.self){ choice in
                Button("\(choice)"){
                    self.gameManager.checkCorrectness(choice)
                }
            .buttonStyle(SelectionButtonStyle())
            }
        }
    }
}
