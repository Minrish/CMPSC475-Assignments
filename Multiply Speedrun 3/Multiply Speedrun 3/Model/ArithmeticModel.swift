//
//  ArithmeticModel.swift
//  Multiply Speedrun 3
//
//  Created by Bert Yan on 1/30/22.
//

import Foundation

enum CorrectnessState{
    case Wrong, Correct, pending
}

// Here we introduce a standard model of a single multiplication problem
struct ArithmeticModel{
    private let selectionNumber = 4
    var id : Int
    var firstVariable : Int
    var secondVariable : Int
    var result : Int
    var selection : [Int] {generateSelections(result)}
    var correctness : CorrectnessState
    
    
    // New init introduces:
    //     operation types: addition, multiplication according to our preference
    //     difficulty setting: easy, medium, or hard
    init(_ id: Int, _ operation: Operation, _ difficulty: Difficulty) {
        self.id = id
        if operation == .addition{
            switch difficulty {
            case .easy:
                firstVariable = Int.random(in: 5...10)
                secondVariable = Int.random(in: 5...10)
            case .medium:
                firstVariable = Int.random(in: 7...99)
                secondVariable = Int.random(in: 7...99)
            case .difficult:
                firstVariable = Int.random(in: 50...999)
                secondVariable = Int.random(in: 50...999)
            }
            result = firstVariable + secondVariable
        }else{
            switch difficulty {
            case .easy:
                firstVariable = Int.random(in: 5...10)
                secondVariable = Int.random(in: 5...10)
            case .medium:
                firstVariable = Int.random(in: 7...15)
                secondVariable = Int.random(in: 7...15)
            case .difficult:
                firstVariable = Int.random(in: 12...30)
                secondVariable = Int.random(in: 12...30)
            }
            result = firstVariable * secondVariable
        }
        correctness = .pending
    }
    
    // Generate selection and return them in ascending order
    private func generateSelections(_ Answer: Int) ->[Int]{
        let bottom = (Answer - 5) > 1 ? Answer - 5 : 1
        var selectionRange = Set((bottom) ... (Answer + 5))
        var temp: [Int] = [result]
        
        selectionRange.remove(result)
        for _ in (1..<selectionNumber) {
            let e = selectionRange.randomElement() ?? 1
            temp.append(e)
            selectionRange.remove(e)
        }
        temp.sort()
        return temp
    }
    
    var correctSign : String = "✔︎"
    var wrongSign : String = "✘"
    var nothingSign : String = "◎"
    
    // Helper function to convert the result of a problem into icons
    func computeCorrectness() ->String{
        switch correctness{
            case .Correct: return correctSign
            case .Wrong: return wrongSign
            default:return nothingSign
        }
    }
}

extension Array where Element : Equatable {
    func count(for element : Element) -> Int{
        self.filter{$0 == element}.count
    }
}
