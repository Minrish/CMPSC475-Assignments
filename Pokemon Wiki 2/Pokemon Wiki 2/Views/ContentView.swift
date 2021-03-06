//
//  ContentView.swift
//  Pokemon Wiki
//
//  Created by Bert Yan on 2/7/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var pokedex : Pokedex
    @State var showingPreferences = false
    var body: some View {
        
        // Show all the rows in the Categories view
        NavigationView{
            List{
                Categories().environmentObject(pokedex)
            }.navigationBarTitle(ViewConstants.title)
                .navigationBarItems(trailing: NavigationLink(destination:   PokemonListView().environmentObject(pokedex)) {
                                        Image(systemName: "slider.horizontal.3")
                                            .imageScale(.large)
                                            .accessibility(label: Text("Setting"))
                                            .padding()})
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Pokedex())
    }
}
