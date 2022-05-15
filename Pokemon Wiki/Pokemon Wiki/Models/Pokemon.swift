//
//  Pokemon.swift
//  Pokemon Wiki
//
//  Created by Bert Yan on 2/14/22.
//

import Foundation

struct Pokemon : Identifiable, Codable{
    let id : Int
    let name : String
    let types : [PokemonType]
    let height : Double
    let weight : Double
    let weaknesses : [PokemonType]
    
    // Assignment 5
    let prev_evolution : [Int]?
    let next_evolution : [Int]?
    
    // Not in .json
    var captured : Bool
    
    func getFormattedId () -> String{
        return String(format: "%03d", id)
    }
    
    static let standard = Pokemon(
        id: 5,
        name: "Charmeleon",
        types: [PokemonType.fire],
        height: 1.09,
        weight: 19.0,
        weaknesses: [PokemonType.water, PokemonType.ground, PokemonType.rock],
        prev_evolution: [4],
        next_evolution: [6],
        captured: false
    )
}
