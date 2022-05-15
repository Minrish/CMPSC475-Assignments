//
//  ContentView.swift
//  Multiply Speedrun
//
//  Created on 1/17/22.
//

import SwiftUI  

let backgroundGradient = LinearGradient(
    colors: [Color.indigo, Color.cyan],
    startPoint: .top, endPoint: .bottom)

struct ContentView: View {
    
    var body: some View {
        
        // Need to be scrollable for smaller iphones
        ScrollView {
            
            // Overall is a VStack, but background color and foreground application requires a ZStack
            ZStack {
                backgroundGradient
                VStack(spacing: 50) {
                    
                    Spacer()
                        .frame(height: 0)
                    
                    // Scores
                    VStack (spacing: 10){
                        CurrentScoreText(currentScoreText: "Score: 1/5")
                        HStack {
                            // "_" if unanswered yet.
                            // "✔︎" if correct.
                            // "✘" if incorrect.
                            CorrectnessIndicatorText(correctnessIndicatorText: "✔︎")
                                .foregroundColor(Color.green)
                            CorrectnessIndicatorText(correctnessIndicatorText: "✘")
                                .foregroundColor(Color.red)
                            CorrectnessIndicatorText(correctnessIndicatorText: "_")
                                .foregroundColor(Color.white)
                            CorrectnessIndicatorText(correctnessIndicatorText: "_")
                                .foregroundColor(Color.white)
                            CorrectnessIndicatorText(correctnessIndicatorText: "_")
                                .foregroundColor(Color.white)
                        }
                    }
                    
                    VStack(spacing: 60) {
                        
                        // Problems
                        Spacer()
                            .frame(height: 0)
                        
                        VStack(alignment: .trailing, spacing: 10)  {
                            QuestionNumberText(questionNumberText: "Question 3")
                            HStack (alignment: .lastTextBaseline){
                                MultiplicationSymbolText(multiplicationSymbolText: "×")

                                VStack (alignment: .trailing){
                                    MultiplicandText(multiplicandText: "50")
                                    MultiplierText(multiplierText: "25")
                                }
                            }
                            HorizontalLine()
                        }

                        
                        // Multiple Choices
                        HStack(spacing:55) {
                            VStack(spacing: 90) {
                                OptionButton(optionButtonText: "1550")
                                OptionButton(optionButtonText: "1250")
                            }
                            VStack(spacing: 90) {
                                OptionButton(optionButtonText: "1150")
                                OptionButton(optionButtonText: "1050")
                            }
                            
                        }
                        
                        // Next Question Button
                        NextQuestionButton(nextQuestionButtonText: "Next")
                        Spacer()
                            .frame(height: 50)
                        
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
