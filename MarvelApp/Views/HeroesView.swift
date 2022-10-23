//
//  ContentView.swift
//  MarvelApp
//
//  Created by Francisco Javier Alarza Sanchez on 15/10/22.
//

import SwiftUI

struct HeroesView: View {
    @StateObject var viewModel = HeroesViewModel()
    var body: some View {
        TabView {
            NavigationStack {
                List {
                    ForEach(viewModel.heroes) { hero in
                        NavigationLink(destination: SeriesView(id: String(hero.id))) {
                            HeroCardView(hero: hero)
                                .frame(width: 350, height: 350)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .shadow(radius: 5)
                    }
                }
                .navigationTitle("Heroes")
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesView()
    }
}

