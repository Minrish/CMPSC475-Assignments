//
//  PokemonDetailView.swift
//  Pokemon Wiki
//
//  Created by Bert Yan on 2/7/22.
//

import SwiftUI

struct PokemonDetailView : View {
    @EnvironmentObject var pokedex : Pokedex
    @Binding var pokemon: Pokemon

    var body: some View{
        List{
            
            // Assignment 5 Adding Capture/Release Function
            HStack{
                Spacer()
                Button(action:{pokedex.allPokemon[pokemon.id - 1].captured.toggle()}){
                    pokemon.captured ?
                        Text("Mark as released")
                        .font(.title)
                        : Text("Mark as captured")
                        .font(.title)
                }.padding(.all)
                    .buttonStyle(ResultCapturedButtonStyle())
                Spacer()
            }
            
            
            // "Each card should somehow indicate whether a Pokemon has been captured."
            // To fullfil the above criteria, the Pokemon profile picture will:
            // 1) Turned grey when not captured.
            // 2) Show the color of the first of its types if captured

            Image(pokemon.getFormattedId())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20.0)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(pokemon.captured ? Color(pokemonType: pokemon.types[0]): Color.gray)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                )
                .overlay(
                    Text(pokemon.getFormattedId())
                        .font(.title2.bold())
                        .foregroundColor(Color.white)
                        .padding(.all),
                    alignment: .bottomTrailing)
                .padding(20.0)
                .grayscale(pokemon.captured ? 0.0 : 0.99)

            
            // Display Text: Height and Weight
            HStack(spacing:10) {
                Spacer()
                VStack(spacing:0) {
                    Spacer()
                    Text("Height").font(.title2).bold()
                    
                    HStack(alignment:.bottom){
                        Text("\(String(format: "%g", pokemon.height))").font(.largeTitle).bold()
                        Text("m").font(.title)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                VStack(spacing:0) {
                    Spacer()
                    Text("Weight").font(.title2).bold()
                    
                    HStack(alignment:.bottom){
                        Text("\(String(format: "%g", pokemon.weight))").font(.largeTitle).bold()
                        Text("kg").font(.title)
                    }
                    
                    Spacer()
                }
                Spacer()
            }
            
            // Display Text: Types
            VStack(alignment: .leading){
                Text("Types").font(.headline)
                ScrollView(.horizontal){
                    HStack(spacing: 10.0){
                        ForEach(pokemon.types, id: \.self){ type in
                            Text(type.rawValue)
                                .padding(10.0)
                                .frame(minWidth: 50.0)
                                .background(
                                    RoundedRectangle(cornerRadius: 50)
                                        .fill(Color(pokemonType: type))
                                        .opacity(0.8))
                        }
                    }
                }
                Spacer()
                
            }
            
            // Display Text: Weakness
            VStack(alignment: .leading){
                Text("Weaknesses").font(.headline)
                ScrollView(.horizontal){
                    HStack(spacing: 10.0){
                        ForEach(pokemon.weaknesses, id: \.self){ weakness in
                            Text(weakness.rawValue)
                                .padding(10.0)
                                .frame(minWidth: 50.0)
                                .background(
                                    RoundedRectangle(cornerRadius: 50)
                                        .fill(Color(pokemonType: weakness))
                                        .opacity(0.8))
                        }
                    }
                }
                Spacer()
            }
            
            // Display prev_evolution, if exists any
            if((pokemon.prev_evolution) != nil){
                VStack(alignment: .leading){
                    CategoryRow(categoryName: "Evolves From", property: {pokemon.prev_evolution!.contains($0.id)}).environmentObject(pokedex)
                }
            }
            
            // Display next_evolution, if exists any
            if((pokemon.next_evolution) != nil){
                VStack(alignment: .leading){
                    CategoryRow(categoryName: "Evolves Into", property: {pokemon.next_evolution!.contains($0.id)}).environmentObject(pokedex)
                }
            }
            

        }.navigationBarTitle(Text(pokemon.name),displayMode: .automatic)
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    @State static var pokemon = Pokedex().allPokemon[0]
    @State static var pokedex = Pokedex()
    static var previews: some View {
        PokemonDetailView(pokemon: $pokemon)
            .environmentObject(Pokedex())
    }
}
