//
//  PokemonListView.swift
//  Pokemon Wiki
//
//  Created by Bert Yan on 2/14/22.
//

import SwiftUI

struct PokemonListView : View {
    @EnvironmentObject var pokedex : Pokedex
    @State var typeIndex : PokemonType? = nil
    
    //return rowView for pokemons with link to detailView
    var body: some View{
        List{
            //When typeIndex is nil, then return all the pokemons
            //otherwise, return the type the user selected
            ForEach(
                pokedex.pokemonIDs(
                    for: {typeIndex==nil ? true : $0.types.contains(typeIndex!)}
                ),
            id: \.self){ id in
                NavigationLink(destination: PokemonDetailView(pokemon: self.$pokedex.allPokemon[id])) {
                    PokemonRowView(pokemon: self.pokedex.allPokemon[id])
                }
            }
        }.navigationBarTitle(typeIndex==nil ? "All Pokemon" : typeIndex!.rawValue)
        .navigationBarItems(trailing: Preferences(typeIndex: $typeIndex))
    }
}
