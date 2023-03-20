//
//  Favorites.swift
//  MarvelApp
//
//  Created by Francisco Javier Alarza Sanchez on 19/10/22.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject var viewModel = FavoritesSeriesViewModel()
    var body: some View {
        List {
            ForEach(viewModel.favorites) { serie in
                Text(serie.title)
                    .swipeActions {
                        Button {
                            viewModel.deleteRow(from: serie.id)
                        } label: {
                            Image(systemName: "trash")
                        }
                        .background(Color.red)
                    }
            }
        }
        .onAppear {
            viewModel.fetchFavorites()
        }
    }
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
