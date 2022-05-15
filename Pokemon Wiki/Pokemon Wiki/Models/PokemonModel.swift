//
//  PokemonModel.swift
//  Pokemon Wiki
//
//  Created by Bert Yan on 2/7/22.
//

import Foundation

struct PokemonModel {
    let manager : StorageManager
    var pokemons : [Pokemon]
    
    init() {
        manager = StorageManager()
        pokemons = manager.pokemons
    }
    
    func save() {
        manager.save(pokemons: pokemons)
    }
}
