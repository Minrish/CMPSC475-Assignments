////
////  File.swift
////  Pokemon Wiki
////
////  Created by Bert Yan on 2/14/22.
////
//
//import Foundation
//
//typealias AllPokemon = [Pokemon]
//
//class Poke : ObservableObject {
//    @Published var pokemonModel = PokemonModel()
//
//    var allPokemon : AllPokemon = []{
//        didSet {
//            pokemonModel.save()
//        }
//    }
//
//    //MARK - Computed Properties -
//    // get the indicies for all pokemons in the model
//    var allIndicies : [Int] {Array(pokemonModel.pokemons.indices)}
//    var capturedPokemons : [Pokemon] {pokemonModel.pokemons.filter({$0.captured})}
//
//    var typeTitles: [PokemonType] {
//        return PokemonType.allCases
//    }
//
//    // Return all the pokemon ids that fit the requirement
//    func pokemonIDs(for property: (Pokemon) -> Bool) -> [Int] {
//        let filteredPokemon = allPokemon.filter(property)
//        let indices = filteredPokemon.map {p in allPokemon.firstIndex(where: {$0.id == p.id})!}
//        return indices
//    }
//}
