//
//  LoadingView.swift
//  MarvelApp
//
//  Created by Francisco Javier Alarza Sanchez on 23/10/22.
//

import SwiftUI

struct LoadingView: View {
    @State private var isAnimating = false
    @State private var showProgress = false
    var foreverAnimation: Animation {
        Animation.linear(duration: 2.0)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        VStack {
            Image("ball")
                .rotationEffect(Angle(degrees: self.isAnimating ? 360 : 0.0))
                .animation(self.isAnimating ? foreverAnimation : .default)
                .onAppear { self.isAnimating = true }
                .onDisappear { self.isAnimating = false
                }
            Text("Cargando...")
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
