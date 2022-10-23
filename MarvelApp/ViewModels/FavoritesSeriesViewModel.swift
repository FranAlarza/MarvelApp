//
//  FavoritesSeries.swift
//  MarvelApp
//
//  Created by Francisco Javier Alarza Sanchez on 19/10/22.
//

import Foundation

class FavoritesSeriesViewModel: ObservableObject {
    @Published var favorites: [Series] = []
    private var userDefaultsSeries = UserDefaultsHelper()
    
    func saveFavorite(serie: Series) {
        fetchFavorites()
        favorites.append(serie)
        userDefaultsSeries.save(series: favorites)
    }
    
    func fetchFavorites() {
        let series = userDefaultsSeries.load()
        favorites = series
    }
    
    func deleteRow(from id: Int) {
        favorites.removeAll(where: {$0.id == id})
        userDefaultsSeries.save(series: favorites)
    }
    
    
}
