//
//  PreferenceModel.swift
//  Multiply Speedrun 3
//
//  Created by Bert Yan on 1/30/22.
//

import Foundation

enum Operation : String, CaseIterable, Identifiable{
    var id: String { self.rawValue }
    case addition, multiplicaiton
}

enum Difficulty : String, CaseIterable, Identifiable{
    var id: String { self.rawValue }
    case easy, medium, difficult
}

struct PreferenceModel{
    var operation : Operation
    var difficulty : Difficulty
    var QuestionRounds : Int
    
    // We will assume these settings as initial settings until user modifies them.
    init(operation: Operation = .multiplicaiton, difficulty: Difficulty = .easy){
        self.operation = operation
        self.difficulty = difficulty
        QuestionRounds = 5
    }
}
