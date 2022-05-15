//
//  CategoryRow.swift
//  Pokemon Wiki
//
//  Created by Bert Yan on 2/7/22.
//

import SwiftUI

struct CategoryRow: View {
    @EnvironmentObject var pokedex : Pokedex
    let categoryName: String
    let property : ((Pokemon) -> Bool)
    
    var nonEmpty : Bool {pokedex.pokemonIDs(for: property).count > 0 }
    
    //Provide a row holding the CategoryItem
    var body: some View {
        VStack(alignment: .leading){
            if nonEmpty{
                Spacer()
                Text(categoryName).font(.title.bold())
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(alignment: .top, spacing: 0){
                        ForEach(pokedex.pokemonIDs(for: property), id:\.self){index in
                            NavigationLink(
                                destination: PokemonDetailView(pokemon: $pokedex.allPokemon[index]),
                                label: {
                                        CategoryItem(pokemon: $pokedex.allPokemon[index])
                                })
                        }
                    }
                }.frame(height: 185)
                Spacer()
                Spacer()
            }else{
                EmptyView()
            }
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    @State static var pokedex = Pokedex()
    static var name = "Bug"
    static var property = {(pokemon: Pokemon) in true}
    static var previews: some View {
        CategoryRow(categoryName: name, property: property)
            .environmentObject(Pokedex())
    }
}
