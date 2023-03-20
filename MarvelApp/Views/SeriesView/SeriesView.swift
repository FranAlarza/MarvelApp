//
//  SeriesView.swift
//  MarvelApp
//
//  Created by Francisco Javier Alarza Sanchez on 16/10/22.
//

import SwiftUI

struct SeriesView: View {
    var id: String
    @StateObject var viewModel = SeriesViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.series) { serie in
                    NavigationLink {
                        SerieDetailView(serie: serie)
                    } label: {
                        SerieCardView(serie: serie)
                    }
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                .shadow(radius: 5)
            }
            .navigationTitle("Series")
        }
        .onAppear {
            viewModel.getSeries(id: id)
        }
    }
}


struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(id: "1")
    }
}
