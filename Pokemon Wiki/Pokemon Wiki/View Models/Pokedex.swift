//
//  PokemonModel.swift
//  Pokédex
//
//  Created by New User on 20/9/20.
//  Copyright © 2020 Chenyin Zhang. All rights reserved.
//

import Foundation

typealias AllPokemon = [Pokemon]

class Pokedex : ObservableObject {
    @Published
    var allPokemon : AllPokemon{
        didSet {
            saveData()
        }
    }
    
    let destinationURL : URL
    
    init() {
        
        let filename = "pokedex"
        let mainBundle = Bundle.main
        let bundleURL = mainBundle.url(forResource: filename, withExtension: "json")!
        
        let fileManager = FileManager.default
        let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        destinationURL = documentURL.appendingPathComponent(filename + ".json")
        let fileExists = fileManager.fileExists(atPath: destinationURL.path)
        
        
        do {
            let url = fileExists ? destinationURL : bundleURL
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            allPokemon = try decoder.decode(AllPokemon.self, from: data)
        } catch  {
           print("Error info: \(error)")
            allPokemon = []
        }
      
        
    }
    
    func saveData() {
        let encoder = JSONEncoder()
        do {
            let data  = try encoder.encode(allPokemon)
            try data.write(to: self.destinationURL)
        } catch  {
            print("Error writing: \(error)")
        }
    }
    
    var typeTitles: [PokemonType] {
        return PokemonType.allCases
    }
    
    // Return all the pokemon ids that fit the requirement
    func pokemonIDs(for property: (Pokemon) -> Bool) -> [Int] {
        let filteredPokemon = allPokemon.filter(property)
        let indices = filteredPokemon.map {p in allPokemon.firstIndex(where: {$0.id == p.id})!}
        return indices
    }
}
