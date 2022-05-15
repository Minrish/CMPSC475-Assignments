//
//  Preference.swift
//  Pokemon Wiki
//
//  Created by Bert Yan on 2/14/22.
//

import SwiftUI

struct Preferences: View {
    @Binding var typeIndex : PokemonType?
    var body: some View {
        Picker(selection: $typeIndex, label:Text("Filter")){
            Text("All").tag(nil as PokemonType?)
            ForEach(PokemonType.allCases, id: \.id) { value in
                Text(value.rawValue).tag(value as PokemonType?)
            }
        }.pickerStyle(MenuPickerStyle())
    }
}
