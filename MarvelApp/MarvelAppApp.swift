//
//  MarvelAppApp.swift
//  MarvelApp
//
//  Created by Francisco Javier Alarza Sanchez on 15/10/22.
//

import SwiftUI

@main
struct MarvelAppApp: App {
    @StateObject var heroesViewModel = HeroesViewModel()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(heroesViewModel)
        }
    }
}
