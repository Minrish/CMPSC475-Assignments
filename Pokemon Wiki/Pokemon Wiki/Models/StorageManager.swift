//
//  StorageManager.swift
//  Pokemon Wiki
//
//  Created by Bert Yan on 2/14/22.
//

import Foundation

class StorageManager {
    var pokemons : [Pokemon]
    let filename = "pokedex-v2"
    let fileInfo : FileInfo
    
    init() {
        
        fileInfo = FileInfo(for: filename)
        
        if fileInfo.exists{
            let decoder = JSONDecoder()
            do {
                let data = try Data(contentsOf: fileInfo.url)
                pokemons = try decoder.decode([Pokemon].self, from: data)
            } catch {
                print(error)
                pokemons = []
            }
            
            return
        }
        
        
        let bundle = Bundle.main
        let url = bundle.url(forResource: filename, withExtension: ".json")!
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            pokemons = try decoder.decode([Pokemon].self, from: data)

        } catch {
            print(error)
            pokemons = []
        }
    }
    
    func save(pokemons:[Pokemon]){
        do {
            let encoder = JSONEncoder()
            let data    = try encoder.encode(pokemons)
            try data.write(to: fileInfo.url)
        } catch {
            print(error)
        }
    }
    
}
