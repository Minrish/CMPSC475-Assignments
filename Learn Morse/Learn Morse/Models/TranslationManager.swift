//
//  TranslationManager.swift
//  Learn Morse
//
//  Created by Bert Yan on 3/15/22.
//

import Foundation

enum Constants{
    
   static func getMorseCode(fileName:String) ->[String:String]?{
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
