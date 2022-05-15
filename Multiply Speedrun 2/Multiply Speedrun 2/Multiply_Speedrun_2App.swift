//
//  Multiply_Speedrun_2App.swift
//  Multiply Speedrun 2
//
//  Created by Bert Yan on 1/24/22.
//

import SwiftUI

@main
struct Multiply_Speedrun_2App: App {
    @StateObject var gameManager = GameManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameManager)
        }
    }
}
