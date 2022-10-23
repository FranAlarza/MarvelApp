//
//  MainView.swift
//  MarvelApp
//
//  Created by Francisco Javier Alarza Sanchez on 23/10/22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: HeroesViewModel
    var body: some View {
        switch (viewModel.status) {
        case .none:
            HeroesView()
        case .loading:
            LoadingView()
        case .loaded:
            HeroesView()
        case .error:
            ErrorView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(HeroesViewModel())
    }
}
