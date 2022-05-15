//
//  PokemonRowView.swift
//  Pokemon Wiki
//
//  Created by Bert Yan on 2/14/22.
//

import SwiftUI

struct PokemonRowView : View {
    var pokemon : Pokemon
    var body: some View{
        HStack{
            Text(pokemon.getFormattedId())
            Text(pokemon.name)
            Image(systemName: "checkmark.seal.fill")
                .foregroundColor(Color.secondary)
                .padding(.all,5.0)
                .opacity(pokemon.captured ? 1.0 : 0.0)
            Spacer()
            Image(pokemon.getFormattedId()).resizable().aspectRatio(contentMode: .fit)
                .frame(height: 40, alignment: .center)
        }
    }
}
