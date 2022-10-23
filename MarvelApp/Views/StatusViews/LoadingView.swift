//
//  LoadingView.swift
//  MarvelApp
//
//  Created by Francisco Javier Alarza Sanchez on 23/10/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Image("ball")
            Text("Cargando...")
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
