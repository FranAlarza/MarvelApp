//
//  Favorites.swift
//  MarvelApp
//
//  Created by Francisco Javier Alarza Sanchez on 19/10/22.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var viewModel: SeriesViewModel
    var data = UserDefaultsHelper()
    @State var favorites: Set<Series> = []
    var body: some View {
        List {
            ForEach(Array(favorites)) { serie in
                Text(serie.title)
                    .swipeActions {
                        Button {
                            viewModel.deleteFavorite(from: serie)
                            favorites.remove(serie)
                        } label: {
                            Image(systemName: "trash")
                        }
                        .background(Color.red)
                    }
            }
        }
        .onAppear {
            favorites = data.load()
        }
    }
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
