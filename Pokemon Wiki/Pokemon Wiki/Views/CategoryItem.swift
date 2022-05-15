//
//  CategoryItem.swift
//  Pokemon Wiki
//
//  Created by Bert Yan on 2/7/22.
//

import SwiftUI

struct CategoryItem: View {
    @Binding var pokemon: Pokemon
    
    var body: some View {
        //Present a single Pokemon with its name and captured icon
        VStack(alignment: .leading) {
            Image(pokemon.getFormattedId())
                .renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(width: frameSize, height: frameSize)
                .padding(.all,20.0)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(pokemonType: pokemon.types[0]))
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/))
                .overlay(
                    Text(pokemon.name)
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                        .padding(.bottom,5.0),
                    alignment: .bottom)
                .overlay(
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(Color.secondary)
                        .padding(.all,5.0)
                        .opacity(pokemon.captured ? 1.0 : 0.0),
                    alignment: .topTrailing)
        }
        .padding(.leading, 15)
    }
    
    let frameSize : CGFloat = 155
}

struct CategoryItem_Previews: PreviewProvider {
    @State static var pokemon = Pokedex().allPokemon[0]
    static var previews: some View {
        CategoryItem(pokemon: $pokemon)
            .environmentObject(Pokedex())
    }
}
