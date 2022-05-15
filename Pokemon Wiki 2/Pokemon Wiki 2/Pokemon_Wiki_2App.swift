//
//  Pokemon_WikiApp.swift
//  Pokemon Wiki
//
//  Created by Bert Yan on 2/7/22.
//

import SwiftUI

@main
struct Pokemon_WikiApp: App {
    @EnvironmentObject var pokedex : Pokedex
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Pokedex())
        }
    }
}
