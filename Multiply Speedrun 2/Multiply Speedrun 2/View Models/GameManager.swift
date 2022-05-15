//
//  GameManager.swift
//  Multiply Speedrun 2
//
//  Created by Bert Yan on 1/24/22.
//

import Foundation
import SwiftUI

enum ApplicationState{
    case question, result, summary
}

class GameManager : ObservableObject{
    
    // Model data
    var QuestionRounds : Int
    var current : Int
    
    @Published var isRedirectingToSummaryPage : Bool = false
    @Published var problemSet : [ArithmeticModel] = []
    @Published var applicationState : ApplicationState = .question
    @Published var currentProblem : ArithmeticModel = ArithmeticModel(-1)
    
    var currentQuestionNumber : Int {currentProblem.id}
    var currentFirstVariable : String {String(currentProblem.firstVariable)}
    var currentSecondVariable : String {String(currentProblem.secondVariable)}
    var currentProblemSelections : [Int] {currentProblem.selection}
    var correctCount: Int {scoreList.count(for: "✔︎")}
    var currentCorrectness: String {String(describing: currentProblem.correctness)}
    var scoreList : [String]{problemSet.map{$0.computeCorrectness()}}
    var currentProblemAnalysis: String {"The correct one is : " + String(currentProblem.result)}
    
    init() {
        current = 0
        isRedirectingToSummaryPage = false
        problemSet = [ArithmeticModel]()
        QuestionRounds = 5
        for i in(0..<QuestionRounds) {
            problemSet.append(ArithmeticModel(i + 1))
        }
        currentProblem = problemSet[current]
    }
    
    func getApplicationState() -> ApplicationState{
        if isRedirectingToSummaryPage{
            return .summary
        }else{
            if currentProblem.correctness == .pending{
                return .question
            }else{
                return .result
            }
        }
    }
    
    // Reset the problem set for another round
     func resetProblemSet(){
        problemSet = [ArithmeticModel]()
        QuestionRounds = 5
        for i in(0..<QuestionRounds) {
            problemSet.append(ArithmeticModel(i + 1))
        }
        isRedirectingToSummaryPage = false
        current = 0
        applicationState = .question
    }
    
     func getNextProblem(){
        if current == QuestionRounds - 1 && currentProblem.correctness != .pending{
            isRedirectingToSummaryPage.toggle()
        }
        current = (current + 1) % QuestionRounds
        currentProblem = self.problemSet[current]
        applicationState = getApplicationState()
    }
    
    func getNextGameManager(){
        getNextProblem()
        self.currentProblem = self.problemSet[current]
    }
    
     func checkCorrectness(_ Answer: Int){
        if Answer == currentProblem.result{
            problemSet[current].correctness = .Correct
            currentProblem.correctness = .Correct
        }else{
            problemSet[current].correctness = .Wrong
            currentProblem.correctness = .Wrong
        }
        applicationState = getApplicationState()
    }
}
