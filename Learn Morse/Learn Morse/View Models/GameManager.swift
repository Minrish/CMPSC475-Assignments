//
//  GameManager.swift
//  Learn Morse
//
//  Created by Bert Yan on 3/16/22.
//

import Foundation

class MorseCodeData:ObservableObject{
    
    @Published var morseCodeDict:[String:String] = [:]
    
    init(){
        morseCodeDict = getMorseCode(fileName: "morse") ?? [:]
    }
    
    func getMorseCode(fileName:String) ->[String:String]?{
             if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
                    do {
                        let data = try Data(contentsOf: url)
                        let decoder = JSONDecoder()
                        let jsonData = try decoder.decode([String:String].self, from: data)
                        return jsonData
                    } catch {
                        print("error:\(error)")
                    }
                }
                return nil
         }
}
