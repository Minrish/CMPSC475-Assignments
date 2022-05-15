//
//  GameManager.swift
//  Multiply Speedrun 3
//
//  Created by Bert Yan on 1/30/22.
//

import Foundation

enum ApplicationState{
    case initial, question, result, summary
}

struct GameManager {
    
    // Model data
    var QuestionRounds : Int
    var current : Int
    var isRedirectingToSummaryPage : Bool
    var problemSet : [ArithmeticModel]

    var gamePreferenceSetting : PreferenceModel = PreferenceModel(){
        didSet{
            resetProblemSet()
        }
    }
    
    var applicationState : ApplicationState{
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
    
    var problemOperation : String {gamePreferenceSetting.operation.rawValue}
    var problemDifficulty : String {gamePreferenceSetting.difficulty.rawValue}
    
    var currentProblem : ArithmeticModel {problemSet[current]}
    var currentQuestionNumber : Int {currentProblem.id}
    var currentFirstVariable : String {String(currentProblem.firstVariable)}
    var currentSecondVariable : String {String(currentProblem.secondVariable)}
    var currentProblemSelections : [Int] {currentProblem.selection}
    var currentProblemOperator : String {return gamePreferenceSetting.operation == .addition ? "+" : "X"}
    
    var correctCount: Int {scoreList.count(for: "✔︎")}
    var currentCorrectness: String {String(describing: currentProblem.correctness)}
    var scoreList : [String]{problemSet.map{$0.computeCorrectness()}}
    var currentProblemAnalysis: String {"The correct one is : " + String(currentProblem.result)}
    
    init() {
        problemSet = [ArithmeticModel]()
        QuestionRounds = gamePreferenceSetting.QuestionRounds
        for i in(0..<QuestionRounds) {
            problemSet.append(ArithmeticModel(i + 1, gamePreferenceSetting.operation, gamePreferenceSetting.difficulty))
        }
        isRedirectingToSummaryPage = false
        current = 0
    }
    
    // Reset the problem set for another round
    mutating func resetProblemSet(){
        problemSet = [ArithmeticModel]()
        QuestionRounds = gamePreferenceSetting.QuestionRounds
        for i in(0..<QuestionRounds) {
            problemSet.append(ArithmeticModel(i + 1, gamePreferenceSetting.operation, gamePreferenceSetting.difficulty))
        }
        isRedirectingToSummaryPage = false
        current = 0
    }
    
    mutating func getNextProblem(){
        if current == QuestionRounds - 1 && currentProblem.correctness != .pending{
            isRedirectingToSummaryPage.toggle()
        }
        current = (current + 1) % QuestionRounds
    }
    
    
    mutating func checkCorrectness(_ Answer: Int){
        if Answer == currentProblem.result{
            problemSet[current].correctness = .Correct
        }else{
            problemSet[current].correctness = .Wrong
        }
    }
}
